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
tzdata

COPY ./default /etc/nginx/sites-enabled/

RUN git clone https://github.com/ankicommunity/anki-sync-server/ && \
pip3 install -r /anki-sync-server/src/requirements.txt && \
systemctl start nginx

EXPOSE 27701
