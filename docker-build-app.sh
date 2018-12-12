#! /bin/bash

set -e;

current_dir=`pwd`
war_dir="app/war"

if [ ! -d "$war_dir" ]; then
    mkdir -p $war_dir
fi

rm -f $current_dir/app/war/dhis.war

wget -O "$current_dir/$war_dir/dhis.war" "https://s3-eu-west-1.amazonaws.com/releases.dhis2.org/2.31/2.31.0/dhis.war"

image_id=$(docker build -q -t dhis2-app:2.31 app/)

echo "Image id: $image_id"
docker tag $image_id itellez/dhis2-app:2.31