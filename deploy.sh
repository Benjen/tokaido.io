#!/usr/bin/env bash
#
# Copy Jekyll site to S3 bucket
#
####################################
#
# Custom vars
#
s3_bucket="s3://tokaido.io/"
####################################

set -e # halt script on error
set -v # echo on

tempfile=$(mktemp)

echo "Building site..."
hugo

echo "Removing .html extension"
find public/ -type f ! -iname 'index.html' -iname '*.html' -print0 | while read -d $'\0' f; do mv "$f" "${f%.html}"; done

echo "Copying files to server..."
aws s3 sync public/ $s3_bucket --size-only --exclude "*" --include "*.*" --delete | tee -a $tempfile
echo "Copying files with content type..."
aws s3 sync public/ $s3_bucket --size-only --content-type text/html --exclude "*.*" --delete | tee -a $tempfile
