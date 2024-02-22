#build stage
FROM node:lts-alpine as build-stage
ARG API_URL
ARG EVENT_URL
ARG TZ

ENV API_URL $API_URL
ENV EVENT_URL $EVENT_URL
ENV TZ $TZ

WORKDIR /app
COPY OEE_Front/package*.json ./
RUN npm install
COPY OEE_Front/ ./

RUN cat <<EOF > /app/public/env-config.js
window._env_ = {
  BACKEND_ADDRESS: '${API_URL}',
  WS_ADDRESS: '${EVENT_URL}'
}
EOF