FROM centos:6.6

RUN groupadd -g 1160 fmbl && \
    groupadd -g 1161 log && \
    groupadd -g 1164 config && \
    groupadd -g 1165 cache  && \
    groupadd -g 1166 jms
    
RUN useradd -g log -u 1155 hial && useradd -g fmbl -G log -u 1200 fmbl

RUN mkdir /hial

RUN yum -y install rsyslog7.x86_64 && \
    yum -y install tar && \
    yum -y install libaio && \
    yum -y install wget && \
    yum clean all

RUN mkdir /opt/oracle
WORKDIR /opt/oracle
RUN wget -P /tmp http://eholt300788b:8080/instantclient_11_2.tar
RUN tar -xvf /tmp/instantclient_11_2.tar

RUN echo "LS_COLORS=$LS_COLORS:'di=0;36:' ; export LS_COLORS" >> ~/.bashrc
CMD ["/bin/bash"]
