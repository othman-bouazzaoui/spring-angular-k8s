### STAGE 2: Run ###
FROM nginx:1.17.1-alpine

COPY nginx.dev.conf /etc/nginx/nginx.dev.conf
COPY nginx.conf /etc/nginx/nginx.conf

WORKDIR /usr/share/nginx/html
COPY dist/ihm/browser .

# Set up environment variable substitution script, will be executed at container startup
COPY envsubst.sh /tmp/envsubst.sh
RUN chmod +x /tmp/envsubst.sh
ENTRYPOINT ["/tmp/envsubst.sh"]

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

