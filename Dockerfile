FROM debian:jessie
MAINTAINER J Lynn <Justin.Lynn@cba.com.au>

RUN apt-get -q update &&\
    apt-get -q upgrade -y &&\
    apt-get install -y cntlm

ENTRYPOINT ["/usr/sbin/cntlm"]
CMD ["-h"]
