FROM ubuntu

ENV TZ=Europe/Berlin
COPY ./run.sh /

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
apt-get update && apt-get install -y \
tzdata \
systemctl \
python3 \
python3-distutils \
python3-pip \
git \
nginx && \
git clone https://github.com/ankicommunity/anki-sync-server/ && \
pip3 install -r /anki-sync-server/src/requirements.txt && \
apt-get autoremove && \
echo "daemon off;" >> /etc/nginx/nginx.conf && \
chmod +x ./run.sh

COPY ./default /etc/nginx/sites-enabled/

EXPOSE 27701
