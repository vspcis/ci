FROM centos:6.6

COPY src /tmp/

RUN yum -y install rsyslog7.x86_64 && \
    yum -y install tar && \
    yum -y install uuid && \
    yum -y install libuuid && \
    yum -y install libuuid-devel && \
    yum -y install libee.x86_64 && \
    yum -y install /tmp/rsyslog/rpms/rsyslog_dependencies/uuid-devel-1.6.1-10.el6.x86_64.rpm && \
    yum clean all

RUN groupadd -g 1160 fmbl && \
    groupadd -g 1161 log && \
    groupadd -g 1164 config && \
    groupadd -g 1165 cache  && \
    groupadd -g 1166 jms
    
RUN useradd -g log -u 1155 hial && useradd -g fmbl -G log -u 1200 fmbl

RUN mkdir /hial && \
    mkdir /hial/apps && \
    mkdir /hial/setup && \
    mkdir /hial/DTE && \
    mkdir /hial/ITE2 && \
    mkdir /hial/PPE && \
    mkdir /hial/PROD && \
    mkdir /hial/DR && \
    mkdir /hial/logging && \
    mkdir /hial/logging/config && \
    mkdir /hial/logging/libs && \
    mkdir /hial/logging/log && \
    mkdir /hial/logging/rsyslog

RUN mkdir /opt/oracle
WORKDIR /opt/oracle
RUN tar -xvf /tmp/instantclient_11_2.tar

RUN cp /tmp/rsyslog/hial/logging/config/* /hial/logging/config && \
    cp /tmp/rsyslog/hial/logging/libs/*  /hial/logging/libs && \
    cp /tmp/rsyslog/hial/logging/rsyslog/* /hial/logging/rsyslog

WORKDIR /opt/oracle/instantclient_11_2
RUN ln -s libclntsh.so.11.1 libclntsh.so && \
    ln -s libocci.so.11.1 libocci.so && \
    export LD_LIBRARY_PATH=/opt/oracle/instantclient_11_2:$LD_LIBRARY_PATH && \
    export PATH=/opt/oracle/instantclient_11_2:$PATH
RUN yum -y install /tmp/rsyslog/rpms/rsyslog_plugin_dependencies/oracle-instantclient11.2-basic-11.2.0.4.0-1.x86_64.rpm && \
    yum -y install  /tmp/rsyslog/rpms/rsyslog_plugin_dependencies/oracle-instantclient11.2-devel-11.2.0.4.0-1.x86_64.rpm && \
    export LD_LIBRARY_PATH=/usr/lib/oracle/11.2/client64/lib:$LD_LIBRARY_PATH && \
    export PATH=/usr/lib/oracle/11.2/client64/bin:$PATH

WORKDIR /tmp/rsyslog/rpms/rsyslog_plugin_dependencies/OCILIB_RPM_Files
RUN yum -y install ocilib-4.1.0-1.x86_64.rpm

WORKDIR /hial/setup
RUN cp -r /tmp/HIAL_BootScripts/* . && \
    cp /hial/setup/config/rc.local /etc/rc.local && \
    cp /hial/setup/config/service/commonlog /etc/init.d && \
    chkconfig --add commonlog && \
    chkconfig --level 35 commonlog on && \
    chmod 755 /etc/init.d/commonlog

# RUN rm -rf /tmp/*

WORKDIR /

RUN echo "LS_COLORS=$LS_COLORS:'di=0;36:' ; export LS_COLORS" >> ~/.bashrc
CMD ["/bin/bash"]
