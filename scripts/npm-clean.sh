#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

eval EXEC_CLEAN_DEMO=true

show_help() {
    echo "Usage: npm-clean.sh"
    echo ""
}

while [[ $1  == -* ]]; do
    case "$1" in
      -h|--help|-\?) show_help; exit 0;;
      -*) echo "invalid option: $1" 1>&2; show_help; exit 0;;
    esac
done

npm install rimraf

cd "$DIR/../"
npm run clean-lock
npm run clean

cd ${DIR}
