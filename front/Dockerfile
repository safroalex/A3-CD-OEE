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

RUN npm run build
#production stage
FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html
COPY front/default.conf /etc/nginx/conf.d/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]