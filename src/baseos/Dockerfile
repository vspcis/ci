FROM centos:6.6

RUN groupadd -g 1160 fmbl && \
    groupadd -g 1161 log && \
    groupadd -g 1164 config && \
    groupadd -g 1165 cache  && \
    groupadd -g 1166 jms
    
RUN useradd -g log -u 1155 hial && useradd -g fmbl -G log -u 1200 fmbl

RUN mkdir /hial && \
    mkdir /hial/apps && \
    mkdir /hial/nfs && \
    mkdir /hial/setup && \
    mkdir /hial/DTE && \
    mkdir /hial/ITE2 && \
    mkdir /hial/PPE && \
    mkdir /hial/PROD && \
    mkdir /hial/DR

RUN yum -y install rsyslog7.x86_64 && \
    service rsyslog start && \
    service rsyslog stop
