#!/bin/bash

if [ $# -eq 0 ]; then
    if [ -f info.sh ]; then
        source ./info.sh
        info
        echo "Хотите записать в файл? (Y/n)"
        read answer
        if [[ $answer == "Y" || $answer == "y" ]]; then
            info > "$(date '+%d_%m_%y_%H_%M_%S').status"
        fi
    fi
else
    echo "Параметры командной строки не поддерживаются."
fi
