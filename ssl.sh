#!/usr/bin/env bash

docker compose run --rm certbot certbot certonly --webroot \
  --webroot-path=/var/lib/letsencrypt \
  -d yourhonestprogrammer.com -d www.yourhonestprogrammer.com \
  --email yourqualityprogrammer@gmail.com --agree-tos --non-interactive

docker run -it --rm \
  -v ./certbot/etc/letsencrypt:/etc/letsencrypt \
  -v ./certbot/var/lib/letsencrypt:/var/lib/letsencrypt \
  certbot/certbot certonly --webroot -w /var/www/html \
  -d yourhonestprogrammer.com -d www.yourhonestprogrammer.com \
  --email yourqualityprogrammer@gmail.com --agree-tos
