# Перенаправление потоков ввода-вывода
### 1. Как работают операторы > и >>
Оператор '>' — перезапись файла
```shell
echo "Первая строка" > file.txt
echo "Вторая строка" > file.txt
cat file.txt
```
Перенаправляет вывод команды в файл. Если файл существует — полностью перезаписывает его.

Оператор >> — добавление в конец файла

Перенаправляет вывод команды в файл. Если файл существует — добавляет в конец. Если не существует — создаёт.
```shell
echo "Первая строка" > file.txt
echo "Вторая строка" >> file.txt
echo "Третья строка" >> file.txt
cat file.txt
```
<img width="914" height="311" alt="image" src="https://github.com/user-attachments/assets/a43c4be7-e5f1-4485-af01-6f22e9211636" />

### 2. Стандартные потоки: stdin, stdout, stderr
stdin - Данные, которые программа получает (обычно с клавиатуры)

stdout - Нормальный результат работы программы (на экран)

stderr - Сообщения об ошибках (на экран)
### 3. Вывод содержимого файла без текстового редактора
Команда cat — показать весь файл

Команда less — постраничный просмотр (q — выйти)

Команда head — показать первые строки

Команда tail — показать последние строки

<img width="673" height="297" alt="image" src="https://github.com/user-attachments/assets/e53715f8-dde0-4441-b39c-402cf5297c06" />

### 4. Создание файла с содержимым без текстового редактора
echo с перенаправлением

Heredoc (многострочный ввод)

printf

<img width="807" height="468" alt="image" src="https://github.com/user-attachments/assets/b97763de-fa42-4c1f-a9ff-5f623a89f1c5" />

### 5. Перенаправление потоков
5.1) Перенаправить только stdout в файл
```shell
ls /home > output.txt 2> errors.txt
ls /home 1> output.txt (Или явно указать дескриптор 1)
```
5.2) Перенаправить только stderr в файл
```shell
ls /nonexistent 2> errors.txt
```
5.3) Перенаправить stdout и stderr в один файл
```shell
ls /home /nonexistent > all_output.txt 2>&1
```
5.4) Перенаправить stdout и stderr в разные файлы
```shell
ls /home /nonexistent > output.txt 2> errors.txt
```
### 6. Чем отличаются stdout и stderr?
<img width="729" height="242" alt="image" src="https://github.com/user-attachments/assets/18ba050d-8f32-42ca-9a9a-ba1ed334fe8d" />

### 7. Что такое stdin? Пример передачи данных через стандартный ввод
stdin — это поток, откуда программа читает входные данные. По умолчанию это клавиатура, но можно перенаправить из файла или из другой команды.

1) Перенаправление из файла с помощью <

Команда sort читает содержимое numbers.txt через stdin.

2) Передача данных через конвейер |

Вывод echo становится stdin для sort.

3) Интерактивный ввод через cat

cat читает stdin и сразу выводит это на stdout.

<img width="744" height="420" alt="image" src="https://github.com/user-attachments/assets/25eae1f8-ea70-4128-b18a-20a359d2622d" />

### 8. Отправка вывода в /dev/null
Всё, что туда попадает, исчезает.

Отправить stdout в /dev/null:
```shell
ls /home /nonexistent > /dev/null
```
Отправить stderr в /dev/null:
```shell
ls /home /nonexistent 2> /dev/null
```
Отправить всё в /dev/null (stdout и stderr):
```shell
ls /home /nonexistent > /dev/null 2>&1
```
### 9. Чем конвейер | отличается от перенаправления >?
'>' — это «сохранить в файл», результат уходит на диск (в файл).

ls сделал список файлов, > взял этот список, записал его в файл files.txt.

| — это «передать следующей команде»

ls сделал список файлов, | передал этот список команде grep, grep отфильтровал — оставил только .txt файлы, результат появился на экране.

### 10. Конвейер из двух-трёх программ
Найти все .txt файлы и отсортировать их
<img width="752" height="376" alt="image" src="https://github.com/user-attachments/assets/9e6f250b-7200-4f05-a914-b9caf5850050" />
find нашёл файлы + sort отсортировал список.


