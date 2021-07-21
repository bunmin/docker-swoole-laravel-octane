# docker-compose-swoole-laravel-octane
This A simplified Docker Compose workflow that sets up a LEMP network of containers using swoole package for local Laravel octane development or production.

This repository is clone from [docker-compose-laravel](https://github.com/aschmelyun/docker-compose-laravel) with some modification.

## Usage

To get started, make sure you have [Docker installed](https://docs.docker.com/get-docker/) on your system, and then clone this repository.

Next, navigate to this repository that you have cloned before, then copy `.env.example` to `.env` and you can update `.env` as you wish.

After that spin up the containers for the web server by running `docker-compose up -d --build site`, wait until the docker done create all services needed. After services done created and without error, you need install laravel packages for first time using by running `docker-compose run --rm composer install`, After done you can access `http://localhost` in your browser, then *tada...* your site with docker and laravel octane is running.

Three additional containers are included that handle Composer, NPM, and Artisan commands *without* having to have these platforms installed on your local computer. Use the following command examples from your project root, modifying them to fit your particular use case.

### 1. composer
command : `docker-compose run --rm composer [<command_name>]`, example : `docker-compose run --rm composer update`

### 2. npm
command : `docker-compose run --rm npm [<command_name>]`, example : `docker-compose run --rm npm run dev`

### 3. artisan
command : `docker-compose run --rm artisan [<command_name>]`, example : `docker-compose run --rm artisan migrate`

## Images
The following images are built for our web server and additional services, with detailed:
- **php-swoole** - `:phpswoole/swoole:4.6-php8.0-alpine`
- **site/nginx** - `:nginx:alpine` (**lastest**)
- **mysql** - `:mysql:8.0.25`
- **artisan** - `:phpswoole/swoole:4.6-php8.0-alpine`
- **composer** - `:composer:2`
- **npm** - `:node:13.7`

## Laravel
This repository is included with **laravel** clean installation and **octane package**, if you want to change **laravel** version you can delete all files in `./app` directory, then create and install with **laravel** version as you wish and install octane package *(this is important because, this docker configuration is only for **laravel octane** where using **swoole** to run web services)*. After that you can running `docker-compose up -d --build site` to build and run this docker image for **laravel**.

Anyway, this repo included version of:
- **laravel/framework** - `:8.40`
- **laravel/octane** :`1.0`