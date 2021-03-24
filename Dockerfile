FROM ubuntu

ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y \
git \
nginx \
python3 \
python3-distutils \
python3-pip \
systemctl \
tzdata

RUN git clone https://github.com/ankicommunity/anki-sync-server/

RUN pip3 install -r /anki-sync-server/src/requirements.txt

COPY ./default /etc/nginx/sites-enabled/

CMD ["systemctl","start","nginx"]

EXPOSE 27701
