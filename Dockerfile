FROM ubuntu:eoan

ARG MAKE_THREADS=8

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential

ADD download/julius-2019.tar.gz /
RUN cd /julius-master && \
    ./configure --prefix=/output && \
    make -j $MAKE_THREADS  && \
    make install

RUN cd /output/bin && tar -czvf /julius.tar.gz *