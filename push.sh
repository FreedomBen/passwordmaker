#!/usr/bin/env bash

set -e

sudo podman push --authfile ~/.docker/config.json \
  quay.io/freedomben/passwordmaker:latest

sudo podman push --authfile ~/.docker/config.json \
  quay.io/freedomben/passwordmaker:2.5

sudo podman push --authfile ~/.docker/config.json \
  docker.io/freedomben/passwordmaker:latest

sudo podman push --authfile ~/.docker/config.json \
  docker.io/freedomben/passwordmaker:2.5
