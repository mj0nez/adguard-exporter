FROM alpine:3.22 AS certs

RUN apk add ca-certificates

FROM scratch
WORKDIR /

COPY --from=certs /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY ./bin/adguard-exporter /adguard-exporter
USER 65532:65532

ENTRYPOINT ["/adguard-exporter"]
