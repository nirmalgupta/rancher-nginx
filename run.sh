#!/usr/bin/env bash

eval echo "\"$(cat <<EOF
$(<site-https.in )
EOF
)\"" > /etc/nginx/sites-available/site-https

ln -sf  /etc/nginx/sites-available/site-https /etc/nginx/sites-enabled/site-https

nginx -g "daemon off;"
