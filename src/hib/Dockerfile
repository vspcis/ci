FROM hial_mq

COPY src /tmp/

RUN groupadd -g 1155 iib && \
    groupadd -g 1157 mqbrkrs && \
    useradd -G iib,mqm,mqbrkrs,root,config,cache,log iibadmin && \
    echo "iibadmin ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN cat /tmp/iibadmin_profile.append >> /home/iibadmin/.bash_profile

WORKDIR /tmp
RUN tar -xzvf IIB_V9.0.0.2_LINUX_X86-64.tar.gz
WORKDIR /tmp/integrationbus_runtime1
RUN ./setuplinuxx64 -i silent -DLICENSE_ACCEPTED=TRUE -DUSER_INSTALL_DIR=/opt/ibm/mqsi/9.0.0.2; exit 0

RUN cp /tmp/iib*.sh /usr/local/bin/ && \
    chmod +rx /usr/local/bin/*.sh

RUN cp /tmp/soapfault200.sh /var/mqsi/common/profiles/ && \
    chmod 775 /var/mqsi/common/profiles/soapfault200.sh && \
    chown iibadmin /var/mqsi/common/profiles/soapfault200.sh

RUN rm -rf /tmp/*

ENV BASH_ENV=/usr/local/bin/iib_env.sh

EXPOSE 4414 9080

USER iibadmin

ENTRYPOINT ["iib_manage.sh"]
