#!/bin/bash
cd $(dirname $0)
source .conf

#Присваивание цветов из конфиг-файла переменным
color[0]=$column1_background
color[1]=$column1_font_color
color[2]=$column2_background
color[3]=$column2_font_color

#Создание массива дефолтных цветов
default[0]=1
default[1]=2
default[2]=4
default[3]=6

#Проверка данных из  конфиг-файла
for (( i = 0; i < 4; i++ ))
do
     if [[ ${color[$i]} =~ ^[1-6$]+$ ]]
        then
            :
        else
            color[$i]=${default[$i]}
        fi
done

#Устанавливаем цвет по умолочанию, если color1=color2 для левой половины
if [ ${color[0]} == ${color[1]} ]
then
    color[0]=${default[0]}
    if [ ${color[0]} == ${color[1]} ]
    then
        color[0]=${default[1]}
    else
        :
    fi
else
    :
fi

#Устанавливаем цвет по умолочанию, если color1=color2 для правой половины
if [ ${color[2]} == ${color[3]} ]
then
    color[2]=${default[2]}
    if [ ${color[2]} == ${color[3]} ]
    then
        color[2]=${default[3]}
    else
        :
    fi
else
    :
fi

#Запуск рабочего скрипта с указанными цветами
chmod +x data.sh
./data.sh ${color[0]} ${color[1]} ${color[2]} ${color[3]}

#Вывод таблицы цветов в конце
arr=(zero white red green blue purple black)
for (( i=0; i<2; i++ ))
do
    echo -en "Column $(( i+1 ))" "background = " 
    if [ ${color[($i*2)]} -eq ${default[($i*2)]} ]  
    then
        echo  "default" "(${arr[${color[($i*2)]}]})"
    else
        echo  "${color[($i*2)]}" "(${arr[${color[($i*2)]}]})"
    fi
    echo -en "Column $(( i+1 ))" "font color = "  
    if [ ${color[($i*2)+1]} -eq ${default[($i*2)+1]} ]  
    then
        echo  "default" "(${arr[${color[($i*2)+1]}]})"
    else
        echo  "${color[($i*2)+1]}" "(${arr[${color[($i*2)+1]}]})"
    fi
done