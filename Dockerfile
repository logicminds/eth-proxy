FROM python:3.6

EXPOSE 8080

ENV DEBIAN_FRONTEND noninteractive

#RUN apt-get update
#RUN apt-get install -y python-twisted

COPY . /app/
WORKDIR /app/

RUN useradd eth-proxy -m && echo "eth-proxy:eth-proxy" | chpasswd
RUN chown -R eth-proxy:eth-proxy /app
USER eth-proxy
RUN make install
# /home/eth-proxy/.local/bin/ethproxy
ENTRYPOINT ["python", "/app/eth-proxy.py"]
CMD [""]
