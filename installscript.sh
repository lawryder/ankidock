#!/bin/sh

# Ins Stammverzeichnis wechseln
cd /

# Aktuelle Tools installieren
apt-get update && apt-get install -y \
git \
nginx \
python3 \
python3-distutils \
python3-pip8

# Und jetzt zum Hauptprogramm!

# Anki-Sync-Server von Github klonen. Es wird ein Ordner "Anki-Sync-Server" im Hauptverzeichnis angelegt.
git clone https://github.com/ankicommunity/anki-sync-server/

# Dependancies mit Pip installieren
pip install -r /anki-sync-server/src/requirements.txt

# Aufräumen
apt-get purge -y git
apt autoremove autoclean clean -y
