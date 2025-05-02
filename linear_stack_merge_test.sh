#!/bin/bash

dir=$(LC_ALL=C tr -dc A-Za-z0-9 </dev/urandom | head -c 16)

mkdir $dir
cd $dir

echo 'Detaching from main...'
git switch --detach main

echo 'First commit...'
echo 'creating a new file' > first_file
for c in a b c d e f g; do
    echo $c >> first_file
done
git add .
git commit -m 'add new file'

echo 'Second commit...'
sed -i'' 's/b/bbb/' first_file
git add .
git commit -m 'change b to bbb'

echo 'Exiting...'
cd ..
git switch --detach main
git sl
