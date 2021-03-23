FROM ubuntu

COPY ./installscript.sh /installscript.sh
RUN chmod +x ./installscript.sh
RUN ./installscript.sh

COPY ./default /etc/nginx/sites-enabled/

EXPOSE 27701
