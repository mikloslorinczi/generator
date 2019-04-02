#!/usr/bin/env bash

set -eou pipefail

# The four Linux based Bitrise repository
declare -a REPOS=("bitrise-base" "android" "android-ndk" "android-ndk-lts")

declare -A URLS

function blue {
  echo -e "\033[96m${1}\033[0m"
}

function gold {
  echo -e "\033[93m${1}\033[0m"
}

function green {
  echo -e "\033[92m${1}\033[0m"
}

function red {
  echo -e "\033[91m${1}\033[0m"
}

for REPO in "${REPOS[@]}"; do
    echo -n "Checking "; gold "${REPO}"
    URLS["${REPO}"]="$(generator url)"
    echo
done

for URL in "${!URLS[@]}"; do
    echo "${URL}:${URLS[${URL}]}"
done