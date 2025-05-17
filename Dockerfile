FROM caddy:builder-alpine AS builder

RUN xcaddy build \
    --with github.com/lucaslorentz/caddy-docker-proxy/v2 \
    --with github.com/caddyserver/certmagic@master \
    --with github.com/caddy-dns/duckdns \
    --with github.com/caddy-dns/dynv6 \
    --with github.com/mholt/caddy-dynamicdns \
    --with github.com/mholt/caddy-l4

FROM caddy:alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

CMD ["caddy", "docker-proxy"]
