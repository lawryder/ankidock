#!/bin/bash

service nginx start

cd /
cd anki-sync-server/src
python3 -m ankisyncd
