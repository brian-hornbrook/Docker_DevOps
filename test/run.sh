docker compose run --rm certbot certbot certonly --webroot \
  --webroot-path=/var/lib/letsencrypt \
  -d yourhonestprogrammer.com -d www.yourhonestprogrammer.com \
  --email yourqualityprogrammer@gmail.com --agree-tos --non-interactive
