# Docker Compose With PHP Swoole for Laravel Octane
This A simplified Docker Compose workflow that sets up a LEMP network of containers using swoole package for local Laravel octane development or production.

This repository is cloned from [docker-compose-laravel](https://github.com/aschmelyun/docker-compose-laravel) with some modification.

## Usage

To get started, make sure you have [Docker installed](https://docs.docker.com/get-docker/) on your system, and then clone this repository.

Next, spin up the containers for the web server by running this step :
### Configure Env File
1. Navigate to the root directory, where you have cloned before, then copy `.env.example` to `.env` and you can update `.env` as you wish.
2. If you want to use **mysql**, after you run step 1 in [Configure Env File](#install-packages--run-docker), update database connection setting in`\app\.env` (env of laravel) same with `\.env` (env of docker)

### Install packages & run docker
#### Install all with one command
This method is usually used by linux users, if you are a windows user I recommend using  [CMDER](https://cmder.net/).

Back to root directory if you have running step 2 in [Configure Env File](#configure-env-file), then for linux users, run command :`$ ./create.sh`, if you are a windows user and have already installed [CMDER](https://cmder.net/), run command : `λ sh create.sh` in root diretory of application

#### Install using docker-compose command
Another way, u can install & run docker services with step by step.

Back to root directory if you have running step 2 in [Configure Env File](#configure-env-file), and follow step in bellow :
1. `$ docker-compose run --rm composer create-project laravel/laravel .`, download & install laravel last version.
2. `$ docker-compose run --rm composer require laravel/octane`, require octane package.
3. `$ docker-compose run --rm artisan octane:install` (when show option of application server choose [1] swoole), install octane package.
4. `$ docker-compose run --rm npm install chokidar`, this package needed for run watcher in development environments.
5. `$ docker-compose up -d --build site`, this comment will build and running **site** service and other services needed in `docker-compose.yml` file.

After all services done created and without error, you can access `http://localhost` in your browser, then *tada...* your site with docker and laravel octane is running.

Three additional containers are included that handle Composer, NPM, and Artisan commands *without* having to have these platforms installed on your local computer. Use the following command examples from your project root, modifying them to fit your particular use case.

## Additional Services
### 1. composer
command : `$ docker-compose run --rm composer [<command_name>]`, example : `$ docker-compose run --rm composer update`

### 2. npm
command : `$ docker-compose run --rm npm [<command_name>]`, example : `$ docker-compose run --rm npm run dev`

### 3. artisan
command : `$ docker-compose run --rm artisan [<command_name>]`, example : `$ docker-compose run --rm artisan migrate`

## Images
The following images are built for our web server and additional services, with detailed:
- **php-swoole** - `:phpswoole/swoole:4.8-php8.0-alpine`
- **site/nginx** - `:nginx:alpine` (**lastest**)
- **mysql** - `:mysql:8.0.25`
- **artisan** - `:phpswoole/swoole:4.8-php8.0-alpine`
- **composer** - `:composer:2`
- **npm** - `:node:alpine3.15`
