FROM ubuntu

COPY ./installscript.sh /installscript.sh
RUN ./installscript.sh

COPY ./ankisyncd.conf /anki-sync-server/src/
COPY ./default /etc/nginx/sites-enabled/

ENABLE 27701
