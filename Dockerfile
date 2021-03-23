FROM ubuntu

COPY ./installscript.sh /installscript.sh
RUN ./installscript.sh

COPY ./default /etc/nginx/sites-enabled/

ENABLE 27701
