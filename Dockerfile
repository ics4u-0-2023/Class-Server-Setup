FROM debian:12-slim

RUN apt-get update \
    && apt-get install -y wget

RUN apt-get autoremove -y \
    && apt-get clean -y \
    && apt-get autoclean -y