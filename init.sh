#!/bin/bash

saf_webmaker_build() {
    docker volume create --name vc_saf_webmaker
    docker build . -t webmaker
}

saf_webmaker_run() {
    docker run -it --rm -v vc_saf_webmaker:/alice webmaker bash -ls
}