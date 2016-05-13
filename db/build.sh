#!/usr/bin/env bash

mysql -h mysql -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE < /data/www/db/migrations/1.example_create_users_table.sql