#!/bin/bash
echo
echo
echo "===============  CREATE A INSTANCE ==============="
echo
echo
# echo "   Press [ENTER] for default values:"
echo


# Specify envoirement type
read -p "   Enter Encoirement type you want to use [production/development] (default = \"development\") >>> " ENV_TYPE
if [ "$ENV_TYPE" == "" ]
then
  ENV_TYPE="development"
fi

update_env_file () {
    sed -i 's/ENV_TYPE=.*/ENV_TYPE='$ENV_TYPE'/' .env
    echo
    echo "=== Env configuration ==="
    echo
    cat .env
    echo
    echo
}

prompt_proceed () {
    read -p "   Do you want to proceed? [Y/N] (default = \"N\") >>> " PROCEED
    if [ "$PROCEED" == "" ]
    then
    PROCEED="N"
    fi
}

create_instance () {
    echo
    echo "=> Start creating instance"
    echo
    # Create latest laravel project
    echo "==> Create latest laravel project"
    echo
    docker-compose run --rm composer create-project laravel/laravel .
    echo
    echo "<== Done create laravel project"
    echo 
    # install Laravel Octane
    echo "==> Install Octane (choose 1 for swoole)"
    echo
    docker-compose run --rm composer require laravel/octane
    docker-compose run --rm artisan octane:install
    echo
    echo "<== Done install Octane"
    echo 
    if [ "$ENV_TYPE" == "development" ]
    then
    # install npm package
    echo "==> Install NPM package"
    echo
    docker-compose run --rm npm install chokidar
    echo
    echo "<== Done install NPM package"
    echo
    fi 
    # Build service
    echo "==> Build docker service"
    echo
    docker-compose up -d --build site
    echo
    echo "<== Done Build docker service"
    echo
    docker ps
    echo
}

update_env_file
prompt_proceed
if [[ "$PROCEED" == "Y" || "$PROCEED" == "y" ]]
then
 create_instance
else
 echo "   Aborted"
 echo
fi