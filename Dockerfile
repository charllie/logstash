FROM logstash:latest

RUN echo '#!/bin/bash' > docker-entrypoint.sh
RUN echo 'set -e' >> docker-entrypoint.sh
RUN echo 'if [ "${1:0:1}" = '"'"'-'"'"' ]; then' >> docker-entrypoint.sh
RUN echo '  set -- logstash "$@"' >> docker-entrypoint.sh
RUN echo 'fi' >> docker-entrypoint.sh
RUN echo 'if [ "$1" = '"'"'logstash'"'"' ]; then' >> docker-entrypoint.sh
RUN echo '  set -- gosu logstash "$@"' >> docker-entrypoint.sh
RUN echo 'fi' >> docker-entrypoint.sh
RUN echo 'mkdir -p /data/sincedb' >> docker-entrypoint.sh
RUN echo 'chown -R logstash /data/sincedb' >> docker-entrypoint.sh
RUN echo 'exec "$@"' >> docker-entrypoint.sh
