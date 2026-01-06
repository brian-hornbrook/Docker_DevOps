#!/usr/bin/env bash

docker compose run --rm certbot certbot certonly --webroot \
  --webroot-path=/var/lib/letsencrypt \
  -d yourhonestprogrammer.com -d www.yourhonestprogrammer.com \
  --email yourqualityprogrammer@gmail.com --agree-tos --non-interactive

docker run -it --rm \
  -v /etc/letsencrypt:/etc/letsencrypt \
  -v /var/lib/letsencrypt:/var/lib/letsencrypt \
  -v /var/www/certbot:/var/www/html \
  certbot/certbot certonly --webroot -w /var/www/html \
  -d yourdomain.com -d www.yourdomain.com \
  --email your_email@example.com --agree-tos
