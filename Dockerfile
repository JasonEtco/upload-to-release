FROM alpine:latest
LABEL author="Jason Etcovitch <jasonetco@github.com>"

LABEL "com.github.actions.name"="Upload to Release"
LABEL "com.github.actions.description"="Uploads a file to a new release."
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="blue"

RUN	apk add --no-cache \
  bash \
  ca-certificates \
  curl \
  jq

COPY upload-to-release /usr/bin/upload-to-release

ENTRYPOINT ["upload-to-release"]
