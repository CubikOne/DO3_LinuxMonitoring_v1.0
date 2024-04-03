#!/bin/bash

source "$(dirname "$0")/check.sh" # source используется для выполнения кода из другого файла

validate_input "$1" # передаёт ей первый аргумент, который был передан скрипту

if [[ $? -eq 1 ]]; then
    echo "$1"
else
    echo "Некорректный ввод."
fi
