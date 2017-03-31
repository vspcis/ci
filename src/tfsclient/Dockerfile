FROM ubuntu:14.04

ARG TFS_USER
ARG TFS_PASSWORD
ENV TFS_USER ${TFS_USER}
ENV TFS_PASSWORD ${TFS_PASSWORD}
ENV TF_AUTO_SAVE_CREDENTIALS "1"

RUN apt-get update && apt-get install -y \
    default-jre \
    unzip \
    wget

RUN wget https://github.com/Microsoft/team-explorer-everywhere/releases/download/v14.114.0/TEE-CLC-14.114.0.zip -P /tmp/ && \
    unzip /tmp/TEE-CLC-14.114.0.zip -d /opt/microsoft/ && \
    rm /tmp/TEE-CLC-14.114.0.zip

ENV PATH "$PATH:/opt/microsoft/TEE-CLC-14.114.0"
RUN tf eula -accept
RUN tf workspace -collection:http://10.69.1.12:8080/tfs/HIAL -delete HIAL -login:${TFS_USER}@rmtools,${TFS_PASSWORD}; exit 0
RUN tf workspace -new HIAL -collection:http://10.69.1.12:8080/tfs/HIAL -login:${TFS_USER}@rmtools,${TFS_PASSWORD}
RUN tf workfold -map '$/HIAL/HIAL 2.0' -workspace:HIAL /workspace -login:${TFS_USER}@rmtools,${TFS_PASSWORD}
WORKDIR /workspace
# RUN tf get -login:${TFS_USER}@rmtools,${TFS_PASSWORD}

RUN echo "LS_COLORS=$LS_COLORS:'di=0;36:' ; export LS_COLORS" >> ~/.bashrc
COPY tfs_get /usr/local/bin/
CMD ["/bin/bash"]
