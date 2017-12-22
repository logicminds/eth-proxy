FROM ubuntu:xenial
MAINTAINER Florian Maunier fmauneko@dissidence.ovh

EXPOSE 8080

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y python-twisted

COPY . /app/
WORKDIR /app/

RUN useradd eth-proxy && echo "eth-proxy:eth-proxy" | chpasswd
RUN chown -R eth-proxy:eth-proxy /app
USER eth-proxy

ENTRYPOINT ["python", "/app/eth-proxy.py"]
CMD [""]
