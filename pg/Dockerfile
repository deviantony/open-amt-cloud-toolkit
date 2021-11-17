FROM postgres
COPY pg/pg_hba.conf /var/lib/postgresql/
RUN openssl req -new -x509 -days 365 -nodes -text -out /var/lib/postgresql/server.crt -keyout /var/lib/postgresql/server.key -subj "/CN=vprodemo.com"
RUN chmod 600 /var/lib/postgresql/server.key
RUN chown postgres:postgres /var/lib/postgresql/server.key
COPY ./data/init.sql /docker-entrypoint-initdb.d/init.sql
COPY ./data/initMPS.sql /docker-entrypoint-initdb.d/initMPS.sql

