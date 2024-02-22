FROM nginx
ARG SERVER_HOSTNAME
ARG SERVER_IP
ARG TZ
ENV SERVER_HOSTNAME $SERVER_HOSTNAME
ENV SERVER_IP $SERVER_IP
ENV TZ $TZ
WORKDIR /etc/nginx/
COPY nginx/nginx.conf .
WORKDIR /etc/nginx/cert
COPY OEE-Node-red/filesys/etc/nginx/cert/rootCA.crt .
COPY OEE-Node-red/filesys/etc/nginx/cert/rootCA.key .
COPY OEE-Node-red/filesys/etc/nginx/cert/genchain.sh .
RUN ./genchain.sh