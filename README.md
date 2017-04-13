Setting up this repo
=========
Install Git on your machine https://git-scm.com/book/en/v2/Getting-Started-Installing-Git

Download these files
```git clone https://github.com/dadeg/docker-compose-nginx-php7-mysql.git```

Install Docker-Compose
https://docs.docker.com/compose/install/

Setting up your website
=========
If you have any dependencies, you can just install them right in your project folder.

The containers will know about them.

Things to change for your app:
 1. in `docker-compose.yml`, change the volumes folder to map properly to your project.
 2. in `docker-compose.yml`, set the port to map properly to your docker host so it doesn't conflict.


Tips:

Install composer
http://getcomposer.org

Install dependencies through composer
```composer install```

DOCKER COMPOSE
=========

start the web app:

`docker-compose up -d web`

stop the server:

`docker-compose stop`

build and migrate the database, should only need to do this once or when you want to migrate. It might be smart to make a migration handler.

`docker-compose run webapp bash /data/www/db/build.sh`

make a backup of the database, mysql container must have a volume set up to host. This will put the dump in your project's root folder.

`docker-compose run mysql bash -c 'exec mysqldump --all-databases -h mysql -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" > /data/all-databases.sql'`

restore dump to the database (untested):

`docker exec -i imageNameOrId mysql nameOfYourDb < ~/path/to/your/dump.sql`

Global Variables
========
Global variables can be set in `container-files/etc/nginx/fastcgi_params`

