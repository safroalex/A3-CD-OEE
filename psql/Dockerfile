FROM postgres:13-bullseye
ARG TZ
RUN apt-get update && apt-get install -y --no-install-recommends postgresql-13-pldebugger git ca-certificates make patch gnupg apt-transport-https lsb-release wget
RUN git clone https://github.com/michelp/pgjwt.git
WORKDIR /pgjwt
RUN make install
WORKDIR /
RUN echo "deb https://packagecloud.io/timescale/timescaledb/debian/ $(lsb_release -c -s) main" | tee /etc/apt/sources.list.d/timescaledb.list
RUN wget --quiet -O - https://packagecloud.io/timescale/timescaledb/gpgkey | apt-key add -
RUN apt update
RUN apt-get install -y --no-install-recommends timescaledb-2-postgresql-13 timescaledb-tools timescaledb-toolkit-postgresql-13
WORKDIR /docker-entrypoint-initdb.d
COPY --chown=postgres OEE-Node-red/oee_whole_dump.sql ./oee_dump
COPY psql/init.sh .
RUN localedef -i ru_RU -c -f UTF-8 -A /usr/share/locale/locale.alias ru_RU.UTF-8
ENV LANG ru_RU.utf8
ENV POSTGRES_PASSWORD postgres
ENV TZ $TZ