FROM ubuntu

RUN apt-get update && apt-get install -y \
git \
nginx \
python3 \
python3-distutils \
python3-pip \
systemctl

RUN git clone https://github.com/ankicommunity/anki-sync-server/

RUN pip install -r /anki-sync-server/src/requirements.txt

COPY ./default /etc/nginx/sites-enabled/

CMD ["systemctl","start","nginx"]

EXPOSE 27701
