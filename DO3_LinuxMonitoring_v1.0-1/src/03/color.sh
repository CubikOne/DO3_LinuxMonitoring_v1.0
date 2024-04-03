#!/bin/bash
#Дефолт цвет
DEFAULT_COLOR='\033[0m'
#Цвет шрифта
WHITE_FONT='\033[37m'
RED_FONT='\033[31m'
GREEN_FONT='\033[32m'
BLUE_FONT='\033[36m'
PURPLE_FONT='\033[35m'
BLACK_FONT='\033[30m'
#Цвет фона
WHITE_BCKG='\033[47m'
RED_BCKG='\033[41m'
GREEN_BCKG='\033[42m'
BLUE_BCKG='\033[46m'
PURPLE_BCKG='\033[45m'
BLACK_BCKG='\033[40m'
#Выбираем цвет фона
case "$1"  in
1) echo -en $WHITE_BCKG;;
2) echo -en $RED_BCKG;;
3) echo -en $GREEN_BCKG;;
4) echo -en $BLUE_BCKG;;
5) echo -en $PURPLE_BCKG;;
6) echo -en $BLACK_BCKG;;
*) echo -en $DEFAULT_COLOR;;
esac
#Выбираем цвет шрифта
case "$2"  in
1) echo -en $WHITE_FONT;;
2) echo -en $RED_FONT;;
3) echo -en $GREEN_FONT;;
4) echo -en $BLUE_FONT;;
5) echo -en $PURPLE_FONT;;
6) echo -en $BLACK_FONT;;
*) echo -en $DEFAULT_COLOR;;
esac