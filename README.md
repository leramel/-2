# Отчёт по заданию: управление учётной записью пользователя в Linux

## 1. Запрет входа пользователю user1
sudo usermod -s /sbin/nologin user1

изменили оболочку пользователя (usermod -s меняет оболочку)
## 2. Проверка состояния учётной записи
$ grep '^user1:' /etc/passwd

user1:x:1001:1001::/home/user1:/sbin/nologin

(вместо /bin/bash стоит /sbin/nologin)
## 3. Альтернативные способы запрета интерактивного входа
sudo passwd -l user1 (блокировка пароля)

sudo chage -E 0 user1 (истечение срока действия аккаунта)

Восстановление: sudo chage -E -1 user1
## 4. Можно ли создать двух пользователей с одинаковым username?
Нельзя, потому что это главный идентификатор

$ sudo useradd user1

useradd: user 'user1' already exists

useradd проверяет не совпадает ли имя с существующим
## 5. Можно ли создать двух пользователей с одинаковым UID?
Можно, но надо это явно указать

sudo useradd -u 1001 -o user2

## 6. Восстановление возможности входа для user1
sudo usermod -s /bin/bash user1 (Возвращаем оболочку /bin/bash)
## 7. Подтверждение восстановления
$ grep '^user1:' /etc/passwd

user1:x:1001:1001::/home/user1:/bin/bash

*Проверяем возможность входа командой su*

$ su - user1

Password:

[user1@alt ~]$ whoami

user1

## 
