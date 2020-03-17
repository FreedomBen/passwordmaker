#!/usr/bin/env bash

sudo podman run \
  -it \
  --rm \
  --user 12345 \
  --name 'passwordmaker' \
  --publish 8080:8080 \
  quay.io/freedomben/passwordmaker:latest

