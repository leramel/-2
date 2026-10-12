# Отчёт по заданию: Работа в консоли Linux

## 1. Перемещение между директориями
Абсолютный путь (от корня файловой системы):
```shell
cd /home/student/lab
```
Относительный путь (от текущей позиции):
```shell
cd lab          # перейти в папку lab внутри текущей директории
cd ..           # подняться на уровень выше (в родительскую папку)
cd ../..        # подняться на два уровня выше
cd ~            # вернуться в домашнюю директорию
cd -            # вернуться в предыдущую директорию
```
## 2. Вывод списка файлов в директории
   ```shell
   ls
   ```
   С подробной информацией:
   ```shell
   ls -l
   ```
## 3. Вывод списка всех файлов, включая скрытые
   ```shell
   ls -la
   ```
## 4. Создание папки с несколькими уровнями подпапок
   ```shell
   mkdir -p project/src/main/java/com/example
   ```
   Проверка структуры:
   ```shell
   tree project
   find project -type d
   ```
## 5. Создание файла и запись текста
  ```shell
  echo "Первая строка текста" > project/note.txt
  echo "Вторая строка текста" >> project/note.txt
  echo "Третья строка текста" >> project/note.txt
  ```
  Проверка
  ```shell
  cat project/note.txt
  ```
## 6. Перемещение файла из одной директории в другую
  ```shell
  mv project/note.txt project/src/
  ```
  Проверка
  ```shell
  ls project/
  ls project/src/
  ```
  Файл note.txt больше не находится в project/, он переместился в project/src/.
## 7. Копирование файла из одной директории в другую
  ```shell
  cp project/src/note.txt project/src/main/
  ```
  Проверка
  ```shell
  ls project/src/
  ls project/src/main/
  ```
  Теперь файл note.txt существует в двух местах: и в project/src/, и в project/src/main/.
## 8. Переименование файла
  ```shell
  mv project/src/note.txt project/src/readme.txt
  ```
  Проверка
  ```shell
  ls project/src/
  ```
  Файл note.txt переименован в readme.txt.
## 9. Сравнение содержимого двух файлов
  ```shell
  diff project/src/readme.txt project/src/main/note.txt
  ```
  1c1 — строка 1 первого файла изменена (changed) на строку 1 второго файла
  < string1 — строка из первого файла
  --- — разделитель
  > Первая строка текста — строка из второго файла
## 10. Сортировка содержимого файла
  Создадим файл для сортировки
  ```shell
  cat > numbers.txt << EOF
  ```
## 11. Поиск файла по имени
  ```shell
  find project -name "readme.txt"
  find project -iname "README*" (без учета регистра)
  find project -type f -name "*.txt" (поиск по типу)
  ```
## 12. Удаление созданных файлов и каталогов
Удаление файлов:
```shell
rm numbers.txt
```
Удаление директории с содержимым (рекурсивно)
```shell
rm -r project/
```
Проверка:
```shell
ls
```
Папка project/ и все временные файлы удалены.
  
