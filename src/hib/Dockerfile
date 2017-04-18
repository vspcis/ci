FROM hial_mq

COPY src /tmp/

RUN groupadd -g 1155 iib && \
    groupadd -g 1157 mqbrkrs && \
    useradd -G iib,mqm,mqbrkrs,root iibadmin 

WORKDIR /tmp
RUN tar -xzvf IIB_V9.0.0.2_LINUX_X86-64.tar.gz
WORKDIR /tmp/integrationbus_runtime1
RUN ./setuplinuxx64 -i silent -DLICENSE_ACCEPTED=TRUE -DUSER_INSTALL_DIR=/opt/ibm/mqsi/9.0.0.2; exit 0

RUN rm -rf /tmp/*

WORKDIR /



