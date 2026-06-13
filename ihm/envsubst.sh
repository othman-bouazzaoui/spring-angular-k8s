#!/bin/sh

# if you have this prb  exec /tmp/envsubst.sh: no such file or directory you have to execute "sed -i 's/\r$//' envsubst.sh"
# envsubst command to substitute environment variables in the template file

envsubst < /usr/share/nginx/html/assets/config/config.template.json > /usr/share/nginx/html/assets/config/config.json
if [ "$LOCAL_PROXY" = "true" ]; then
    echo "LOCAL_PROXY is $LOCAL_PROXY - DEV Environment detected - using nginx.dev.conf"
    cp /etc/nginx/nginx.dev.conf /etc/nginx/nginx.conf
fi

exec "$@"
