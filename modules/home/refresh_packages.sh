#!/usr/bin/env bash

rm ~/.Renviron
echo "R_LIBS_SITE=$(cat /etc/profiles/per-user/user/bin/R | grep -oP "(?<=R_LIBS_SITE=')[^']+" | paste -sd: -)" >> ~/.Renviron
