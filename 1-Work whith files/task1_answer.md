# Отчёт по заданию: управление учётной записью пользователя в Linux

## 1. Запрет входа пользователю user1
```shell
sudo usermod -s /sbin/nologin user1
```
изменили оболочку пользователя (usermod -s меняет оболочку)
## 2. Проверка состояния учётной записи
```shell
$ grep '^user1:' /etc/passwd
```
user1:x:1001:1001::/home/user1:/sbin/nologin

(вместо /bin/bash стоит /sbin/nologin)
## 3. Альтернативные способы запрета интерактивного входа
```shell
sudo passwd -l user1 (блокировка пароля)
```

```shell
sudo chage -E 0 user1 (истечение срока действия аккаунта)
```
Восстановление: sudo chage -E -1 user1
## 4. Можно ли создать двух пользователей с одинаковым username?
Нельзя, потому что это главный идентификатор
```shell
$ sudo useradd user1
```
useradd: user 'user1' already exists

useradd проверяет не совпадает ли имя с существующим
## 5. Можно ли создать двух пользователей с одинаковым UID?
Можно, но надо это явно указать
```shell
sudo useradd -u 1001 -o user2
```
## 6. Восстановление возможности входа для user1
```shell
sudo usermod -s /bin/bash user1 (Возвращаем оболочку /bin/bash)
```
## 7. Подтверждение восстановления
```shell
$ grep '^user1:' /etc/passwd

user1:x:1001:1001::/home/user1:/bin/bash
```
*Проверяем возможность входа командой su*
```shell
$ su - user1

Password:

[user1@alt ~]$ whoami

user1
```
## 

