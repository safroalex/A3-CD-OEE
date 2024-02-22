#!/bin/sh
psql --file=oee_dump
#echo "log_statement = 'all'" >> /var/lib/postgresql/data/postgresql.conf
echo "shared_preload_libraries = 'timescaledb'" >> /var/lib/postgresql/data/postgresql.conf
echo "timescaledb.telemetry_level=off" >> /var/lib/postgresql/data/postgresql.conf
timescaledb-tune