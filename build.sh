#!/usr/bin/env bash

sudo podman build \
  -t quay.io/freedomben/passwordmaker:latest \
  -t quay.io/freedomben/passwordmaker:2.5 \
  .
