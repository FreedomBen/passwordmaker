#!/usr/bin/env bash

set -e

sudo podman push quay.io/freedomben/passwordmaker:latest
sudo podman push quay.io/freedomben/passwordmaker:2.5
