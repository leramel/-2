# Юниты

### 1) Что такое systemd юнит? 
Systemd-юнит — это файл конфигурации systemd, который описывает объект управления: сервис, таймер, устройство, точку монтирования и т.д. Юниты хранятся в каталогах /etc/systemd/system и /usr/lib/systemd/system.


### 2) Проверье статус любого systemd юнита, какую информацию выводит эта команда? 
``` bash
systemctl status ssh  
```
Команда показывает состояние сервиса (active/inactive), включён ли он в автозагрузку, PID процесса, время запуска, последние логи и путь к unit-файлу.



### 3) ПОпробуйте остановить сервис.
``` bash
sudo systemctl stop ssh 
sudo systemctl status sshd 
```
Сервис прекращает работу, но настройки не удаляются.



### 4) Перезапустите его.  
``` bash
sudo systemctl restart ssh  
```
Сервис останавливается и запускается заново.


### 5) УДалите из автозагрузки.

sudo systemctl disable ssh  

systemctl is-enabled sshd

Сервис не будет запускаться автоматически при старте системы.


### 6) Верните обратно.  

sudo systemctl enable ssh  

systemctl is-enabled sshd
Сервис снова добавляется в автозагрузку.


### 7) Что такое таймеры?  
Systemd-таймеры — это юниты, которые запускают другие юниты (обычно сервисы) по времени или расписанию. Они являются заменой cron и используют файлы с расширением .timer.

Просмотр таймеров
```bash
systemctl list-timers
systemctl list-timers --all
```
Создание таймера:

Таймер /etc/systemd/system/mytimer.timer:
```bash
[Timer]
OnCalendar=daily
Persistent=true
```
Сервис /etc/systemd/system/myscript.service:
```bash
[Service]
Type=oneshot
ExecStart=/path/to/script.sh
```