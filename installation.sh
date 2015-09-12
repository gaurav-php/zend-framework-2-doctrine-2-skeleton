#!/bin/bash

function setup_composer() {
    name = $1
    description = $2

    if [ -z description ]; then
        description = name
    fi

    sed -i.bak s/{PROJECT_NAME}/${name}/g composer.json
    sed -i.bak s/{PROJECT_DESCRIPTION}/${description}/g composer.json
}

function install_components() {
    php -r "readfile('https://getcomposer.org/installer');" | php
    composer install
    npm install
    bower install
    npm install -g bower
}

echo "\nWelcome! Let's get the party started\n\n"
echo "Composer - Please enter a name for this project:"

read project_name

echo "Composer - Please enter a description [Default: Project Name]:"

read project_description

echo "Thanks for the input.  Currently installing $project_name"

setup_composer $project_name $project_description
install_components

echo "\nLet's get your components all linked up."

ln -s bower_components/jquery/dist public/jquery
ln -s bower_components/bootstrap/dist/css public/css
ln -s bower_components/bootstrap/dist/fonts public/fonts
ln -s bower_components/bootstrap/dist/js public/js
ln -s bower_components/holderjs/src public/holderjs

cat welcome-text.txt