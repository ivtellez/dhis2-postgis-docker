#! /bin/bash

set -e;

current_dir=`pwd`
db_dir="db-demo"

rm -f $current_dir/$db_dir/dhis2-db.sql.gz

wget -O "$current_dir/$db_dir/dhis2-db.sql.gz" "https://s3-eu-west-1.amazonaws.com/databases.dhis2.org/sierra-leone/2.31/2.31.0/dhis2-db-sierra-leone.sql.gz"

image_id=$(docker build -q -t dhis2-db-demo:2.31 db-demo/)

echo "Image id: $image_id"
docker tag $image_id itellez/dhis2-db-demo:2.31