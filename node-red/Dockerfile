FROM nodered/node-red
ARG DB_SERVER
ARG DBWS_SERVER
ARG MOSQUITTO_SERVER
ARG PGWS_JWT_SECRET
ARG TZ
ENV DB_SERVER $DB_SERVER
ENV DBWS_SERVER $DBWS_SERVER
ENV MOSQUITTO_SERVER $MOSQUITTO_SERVER
ENV PGWS_JWT_SECRET $PGWS_JWT_SECRET
ENV TZ $TZ
#USER node-red
COPY node-red/package.json .
RUN npm install --unsafe-perm --no-update-notifier --no-fund
COPY OEE-Node-red/settings.js /data/settings.js
COPY OEE-Node-red/flows_cred.json /data/flows_cred.json
COPY OEE-Node-red/flows.json /data/flows.json
WORKDIR /usr/src/node-red
COPY OEE-Node-red/regid-from-topic ./regid-from-topic
USER 0
RUN npm install ./regid-from-topic
USER node-red 
##next two lines do not work for some reason
COPY OEE-Node-red/filesys/etc/nginx/cert/rootCA.crt /home/node-red/rootCA.crt
RUN git config --global http.sslCAInfo /home/node-red/rootCA.crt
#disable ssl cert verification completely to make git wok with vmgit
RUN git config --global http.sslVerify false
COPY OEE-Node-red/filesys/home/nodered/dbdump.sh /usr/src/node-red/dbdump.sh
USER 0
RUN apk add --no-cache postgresql-client patch
USER node-red 