#!/bin/bash
cd $(dirname $0)
function tryagain {
    echo "Попробовать ещё раз? (Y/n)"
    ANSWER=0
    read ANSWER
    case "$ANSWER" in
        y | Y) echo "Введите параметры (4)"
                COLOR1=0
                COLOR2=0
                COLOR3=0
                COLOR4=0
                read COLOR1 COLOR2 COLOR3 COLOR4
                ./main.sh $COLOR1 $COLOR2 $COLOR3 $COLOR4;;
        *) :;;
    esac
}

ERROR_FLAG=0
ERROR_FLAG2=0
RETURN_FLAG=1

if (($# == 4)) 
then
    if [ $1 == $2 ] || [ $3 == $4 ]
    then
        ERROR_FLAG2=1
        RETURN_FLAG=0
    else
        for var in $1 $2 $3 $4
        do
            if [ $ERROR_FLAG == 0 ] && [ $ERROR_FLAG2 == 0 ]
            then
            case "$var" in
                1 | 2 | 3 | 4 | 5 | 6) : ;;
                *) ERROR_FLAG=1 RETURN_FLAG=0;;
            esac 
            else 
                :
            fi
        done
    fi
    if  [ $ERROR_FLAG == 1 ]
    then
        echo "Допустимые значения [1-6]"
        tryagain
    else 
        :
    fi 
    if  [ $ERROR_FLAG2 == 1 ]
    then
        echo "Фон и цвет шрифта не должны совпадать"
        tryagain
    else 
        :
    fi 
else 
    echo "Вы ввели менее или более 4 параметров"
    RETURN_FLAG=0
    tryagain
fi

if [ $RETURN_FLAG == 1 ]
then
    chmod +x data.sh
    ./data.sh $1 $2 $3 $4
else
    :
fi