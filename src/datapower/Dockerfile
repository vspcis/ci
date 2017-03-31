FROM ibmcom/datapower

ENV DATAPOWER_ACCEPT_LICENSE=true \
    DATAPOWER_WORKER_THREADS=2

EXPOSE 22 9090

COPY auto-startup.cfg /drouter/config/auto-startup.cfg
