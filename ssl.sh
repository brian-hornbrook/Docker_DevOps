#!/usr/bin/env bash

# gets SSL
certonly --webroot --webroot-path=/var/www/certbot --email your-yourqualityprogrammer@gmail.com --agree-tos --no-eff-email --staging -d yourhonestprogrammer.com -d www.yourhonestprogrammer.com

# backup data
docker exec -t docker-devops-db pg_dump -U DATABASE_USERNAME DATABASE_NAME > backup.sql
docker exec -i docker-devops-db /usr/bin/pg_dump \
 -U DATABASE_USERNAME DATABASE_NAME > postgres-backup.sql
docker exec -t docker-devops-db pg_dump -U DATABASE_USERNAME DATABASE_NAME > ./backup/backup.sql
docker exec -it docker-devops-db pg_dump -U DATABASE_USERNAME DATABASE_NAME > ./backup/backup.sql
docker exec docker-devops-db pg_dump -U DATABASE_USERNAME -F t DATABASE_NAME > mydb.tar

# restore data
docker exec -i docker-devops-db psql -U DATABASE_USERNAME -d DATABASE_NAME < backup.sql

docker cp ./backup/backup.sql docker-devops-db:/tmp/backup.sql


### new
docker exec -t docker-devops-db pg_dumpall -c -U DATABASE_USERNAME -d DATABASE_NAME > dump_`date +%Y-%m-%d"_"%H_%M_%S`.sql

cat dump_2026-01-09_19_39_48.sql | docker exec -i docker-devops-db psql -U DATABASE_NAME

### Data Camp
  # backup
docker exec -t docker-devops-db pg_dump -U DATABASE_USERNAME -d DATABASE_NAME > backup.sql

  # restore
docker exec -t docker-devops-db pg_dump -U myuser mydatabase > backup.sql
docker exec -i docker-devops-db psql -U DATABASE_USERNAME -d DATABASE_NAME < ./backup/backup.sql
docker exec -i docker-devops-db psql -U DATABASE_USERNAME -d DATABASE_NAME < /tmp/backup.sql
