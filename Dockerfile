FROM alpine

LABEL maintainer="shkey <shkey325@gmail.com>"

COPY ./shadowsocks.json /etc/shadowsocks.json

RUN apk update && \
    apk add --no-cache git python3 libsodium && \
    pip3 install --no-cache-dir git+https://github.com/shadowsocks/shadowsocks.git@master && \
    rm -r /var/cache/apk && \
    rm -r /usr/share/man

EXPOSE 2333 4321 8765

ENTRYPOINT ["ssserver", "-c", "/etc/shadowsocks.json"]
