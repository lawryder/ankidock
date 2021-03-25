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
apt-get autoremove && \
echo "daemon off;" >> /etc/nginx/nginx.conf

COPY ./default /etc/nginx/sites-enabled/
COPY ./run.sh /

CMD [./run.sh]

EXPOSE 27701
