FROM alpine:latest
LABEL org.opencontainers.image.source=https://github.com/nzapponi/filebrowser-arm32

RUN apk --update add ca-certificates
RUN apk --update add mailcap
RUN apk add curl bash git
RUN curl -fsSL https://filebrowser.org/get.sh | bash
COPY config.json /.filebrowser.json
VOLUME ["/srv"]
EXPOSE 80

ENTRYPOINT ["filebrowser"]