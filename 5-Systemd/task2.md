# Пишем юниты

### 1) Создайте скрипт который создаёт папку, заполняет её файлами (1–4) и записывает в них информацию  
Скрипт проверяет существование каталога и файлов, создаёт их при необходимости и записывает текущую дату, версию ядра, hostname и список файлов в домашнем каталоге пользователя.
```bash
#!/bin/bash  
set -euo pipefail  

WORKDIR="$HOME/unit_test"  

mkdir -p "$WORKDIR"  

for i in 1 2 3 4; do  
  FILE="$WORKDIR/$i"  
  if [ ! -f "$FILE" ]; then  
    touch "$FILE"  
  fi  
  {  
    date  
    uname -r  
    hostname  
    ls "$HOME"  
  } > "$FILE"  
done  
```
Флаги set -euo pipefail означают:  
-e — завершать скрипт при ошибке  
-u — считать ошибкой использование необъявленных переменных  
-o pipefail — ошибка в любом месте конвейера считается ошибкой всего конвейера


### 2) Создайте юнит который будет вызывать этот скрипт при запуске. Проверьте  
Файл /etc/systemd/system/unit-test.service  
```bash
[Unit]  
Description=Test unit script  

[Service]  
Type=oneshot  
ExecStart=/usr/local/bin/unit_test.sh  

[Install]  
WantedBy=multi-user.target  
```
Команды проверки:
```bash  
sudo systemctl daemon-reload  
sudo systemctl enable unit-test  
sudo systemctl start unit-test  
systemctl status unit-test  
```
---

### 3) Создайте таймер который будет вызывать выполнение одноимённого systemd юнита каждые 5 минут  
Файл /etc/systemd/system/unit-test.timer  
```bash
[Unit]  
Description=Run unit-test every 5 minutes  

[Timer]  
OnBootSec=5min  
OnUnitActiveSec=5min  

[Install]  
WantedBy=timers.target  
```
Команды:
```bash  
sudo systemctl daemon-reload  
sudo systemctl enable unit-test
```
### 4) От какого пользователя вызываются юниты по умолчанию?  
По умолчанию systemd-сервисы запускаются от пользователя root.


### 5) Создайте пользователя от имени которого будет выполняться ваш скрипт  
```bash 
sudo useradd -m unituser  
```

### 6) Дополните юнит информацией о пользователе от которого должен выплняться скрипт 
Изменение unit-test.service  
```bash
[Service]  
Type=oneshot  
User=unituser  
ExecStart=/usr/local/bin/unit_test.sh  
```

После изменения:
```bash  
sudo systemctl daemon-reload  
sudo systemctl restart unit-test  
```

### 7) Дополните ваш скрипт так, чтобы он независимо от местоположения всегда выполнялся в домашней папке того кто его вызывает  
В начало скрипта добавляется переход в домашний каталог:  

cd "$HOME"  

Теперь скрипт всегда работает относительно домашней директории пользователя, от имени которого запущен systemd-юнит.