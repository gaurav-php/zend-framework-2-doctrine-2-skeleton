#!/bin/bash

function install_components() {
    php -r "readfile('https://getcomposer.org/installer');" | php
    composer install
    npm install
    bower install
    npm install -g bower
}

echo "\nWelcome! Let's get the party started\n\n"

install_components

echo "\nLet's get your components all linked up."

cd public

ln -s ../bower_components/jquery/dist public/jquery
ln -s ../bower_components/bootstrap/dist/css public/css
ln -s ../bower_components/bootstrap/dist/fonts public/fonts
ln -s ../bower_components/bootstrap/dist/js public/js
ln -s ../bower_components/holderjs/src public/holderjs

cd ../

cat welcome-text.txt
