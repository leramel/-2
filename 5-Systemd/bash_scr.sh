#!/bin/bash
DIR="$HOME/my_folder"

# Создаем папку, если она не существует
if [ ! -d "$DIR" ]; then
  mkdir "$DIR"
  echo "Папка '$DIR' создана."
else
  echo "Папка '$DIR' уже существует."
fi

# Файл с текущей датой
FILE_DATE="$DIR/1"
if [ ! -f "$FILE_DATE" ]; then
  date > "$FILE_DATE"
fi

# Файл с версией ядра
FILE_KERNEL="$DIR/2"
if [ ! -f "$FILE_KERNEL" ]; then
  uname -r > "$FILE_KERNEL"
fi

# Файл с именем компьютера
FILE_HOSTNAME="$DIR/3"
if [ ! -f "$FILE_HOSTNAME" ]; then
  hostname > "$FILE_HOSTNAME"
fi

# Файл со списком всех файлов в домашней директории
HOME_DIR="$HOME"
FILE_HOME_LIST="$DIR/4"
if [ ! -f "$FILE_HOME_LIST" ]; then
  ls -la "$HOME_DIR" > "$FILE_HOME_LIST"
fi