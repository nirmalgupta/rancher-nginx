FROM ubuntu:trusty

RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates nginx && \
    rm -rf /var/lib/apt/lists/* && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log && mkdir src

COPY site-https.in run.sh src/

RUN cd src; chmod +x run.sh
EXPOSE 80 443
VOLUME ["/var/cache/nginx"]

CMD cd src; ./run.sh
