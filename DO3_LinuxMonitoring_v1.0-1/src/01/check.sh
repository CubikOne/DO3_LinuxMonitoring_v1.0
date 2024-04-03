#!/bin/bash

validate_input() {
    # Проверяем, является ли параметр числом
    if [[ $1 =~ ^[0-9]+$ ]]; then
        return 0
    else
        return 1
    fi
}
