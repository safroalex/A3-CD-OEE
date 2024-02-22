FROM eclipse-mosquitto:2.0-openssl
ARG SERVER_HOSTNAME
ARG SERVER_IP
ARG TZ
ENV SERVER_HOSTNAME $SERVER_HOSTNAME
ENV SERVER_IP $SERVER_IP
ENV TZ $TZ
RUN apk add --update openssl
WORKDIR /mosquitto/config
#RUN mkdir -pv cert
COPY  mosquitto/mosquitto.conf ./
WORKDIR /mosquitto/config/cert
COPY OEE-Node-red/filesys/etc/nginx/cert/rootCA.crt .
COPY OEE-Node-red/filesys/etc/nginx/cert/rootCA.key .
COPY OEE-Node-red/filesys/etc/nginx/cert/genchain.sh .
RUN sh -c ./genchain.sh