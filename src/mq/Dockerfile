FROM hial_baseos

COPY src /tmp/

RUN groupadd -g 1156 mqm && \
    useradd -u 498 -g mqm mqm
 
WORKDIR /tmp
RUN tar -xzvf IIB_IBTK_WS_MQ_LNX_X86-64.tar.gz
WORKDIR /tmp/integrationbus/WebSphere_MQ_V7.5.0.1
RUN ./mqlicense.sh -accept && \
    rpm -ivh *.rpm
RUN /opt/mqm/bin/setmqinst -p /opt/mqm -i
RUN su - mqm -c "/opt/mqm/bin/crtmqm -c 'HIAL.CI' -u HIAL.CI.DLQ -lc -ld /var/mqm/log -lf 4096 HIAL.CI"
RUN su - mqm -c "strmqm HIAL.CI"

RUN rm -rf /tmp/*

WORKDIR /

