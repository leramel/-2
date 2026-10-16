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

<img width="640" height="162" alt="EDXnS3ivETEND1u8QSgjnPcpMmUw6wSJUFxxbX8SiDBOqSIfVRD2cAg8FmYk02ToxHozZm8r-O4ik9VJsc6Ttxm5VLgq-Q" src="https://github.com/user-attachments/assets/386f86b2-64ec-4681-801a-77d2b5725cde" />

## 2. Вывод списка файлов в директории
   ```shell
   ls
   ```
   С подробной информацией:
   ```shell
   ls -l
   ```

<img width="640" height="327" alt="loSpXisuRIsrC212ArQ-OfOVH-_laSoR-_QcooNamWXMHX1yunaarfrOfpA3sKLr-6GAW16qcUQLfwlzeE7k_C0tmMGQqw" src="https://github.com/user-attachments/assets/d0cd8f3b-0e05-4c24-9d19-6a5186dba474" />

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

<img width="640" height="480" alt="0htoBv4S1Szpq-BLJDFqgnXRaaMdAtALj2ZzMjwVYJGmoSPjJvZJjO81cRi4daDTkxiNFZHhgVShiVxup3UN3O08BVnDjA" src="https://github.com/user-attachments/assets/fdbb1478-cea9-4e0b-a010-ba068926305d" />

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

<img width="640" height="303" alt="R1HwoWucnJ7i17uRmkpv-ralbTc6mgBrTs0tbqVnlOGs_3AUcBnWS4VtePwmH8aM49FfrYAa8O2J3xARo7k18f2f" src="https://github.com/user-attachments/assets/afd90906-c04f-49dd-9bf7-0606f17ec35a" />

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
  diff project/src/readme.txt project/src/main/note2.txt
  ```
  1c1 — строка 1 первого файла изменена (changed) на строку 1 второго файла
  < string1 — строка из первого файла
  --- — разделитель
  > Первая строка текста — строка из второго файла
> 
<img width="640" height="161" alt="ZeoJKxv7zjLzsdEkuYewHDqHNyeL_Q2A0CAj33LYme0s0ZryxohgKqSKjAxYPBO4jlKtnJvd2P6_VMeck5Jc4k4s" src="https://github.com/user-attachments/assets/b6317544-3e26-4b41-980a-51c2cf3be463" />

## 10. Сортировка содержимого файла
  Создадим файл для сортировки
  ```shell
  cat > numbers.txt << EOF
  ```
   Сортировка по возрастанию
   ```shell
   sort numbers.txt
   ```
   Сортировка по убыванию
   ```shell
   sort -r numbers.txt
   ```

<img width="640" height="363" alt="RcQDGhCSB3LIjEiN_S3zL7RJg-NSxTbDC_qMdKE4yhHv-Y2YWNjT-tI2vCYem7fTHVv64Zm5TigVAqN9vThmzPqaZPQeBw" src="https://github.com/user-attachments/assets/fdf0305a-b2c5-4f63-a689-a122b4bea312" />

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
  
<img width="640" height="350" alt="cLSPtZyUQyLeQDNzv_lJc6L3OUZqE3Dz-d-q2jUgyxbuLt9fW2SlAzvDoUoWRh9UG5d5WbPNmJF0eEI2afCz9SNjYKZNcQ" src="https://github.com/user-attachments/assets/8be11d0e-95ec-4c29-9292-f63a9384a2ee" />

