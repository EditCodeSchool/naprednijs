FROM jupyter/base-notebook:latest

USER root

RUN apt-get update && apt-get install -y curl unzip

ENV DENO_INSTALL=/usr/local
RUN curl -fsSL https://deno.land/install.sh | sh

COPY . /home/jovyan

RUN chown -R 1000:100 /home/jovyan

USER ${NB_UID}

RUN deno jupyter --unstable --install
