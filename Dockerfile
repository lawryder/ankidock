FROM ubuntu

ENV TZ=Europe/Berlin

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
apt-get update && apt-get install -y \
git \
nginx \
python3 \
python3-distutils \
python3-pip \
systemctl \
tzdata && \
git clone https://github.com/ankicommunity/anki-sync-server/ && \
pip3 install -r /anki-sync-server/src/requirements.txt && \
echo "daemon off;" >> /etc/nginx/nginx.conf && \
apt-get autoremove autoclean clean

COPY ./default /etc/nginx/sites-enabled/

CMD ["systemctl","enable","nginx"]

EXPOSE 27701
