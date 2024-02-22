FROM postgres:13-bullseye
ARG TZ
RUN apt-get update && apt-get install -y --no-install-recommends postgresql-13-pldebugger git ca-certificates make patch gnupg apt-transport-https lsb-release wget
RUN git clone https://github.com/michelp/pgjwt.git
WORKDIR /pgjwt
RUN make install