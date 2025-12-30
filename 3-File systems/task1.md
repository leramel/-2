# ФС

### 1) Какие файловые системы вы знаете?

Локальные (дисковые) - ext4, ext3, XFS, Btrfs, ReiserFS, NTFS,FAT16 / FAT32, exFAT

Сетевые - NFS, SMB (CIFS), SSHFS, WebDAV

Псевдо- и виртуальные - proc, sysfs, tmpfs, devtmpfs

Специализированные - swap, overlayfs, squashfs,
iso9660

### 2) Как можно классифиировать файловые системы? в чём отличия??

Файловые системы классифицируются по назначению и способу использования: локальные и сетевые, постоянные и временные, журналируемые и нежурналируемые. Отличия заключаются в надёжности, производительности, поддержке прав доступа, максимальных размерах файлов и совместимости с операционными системами.

### 3) Какие файловые системы используются в linux?

**Основные** - ext4 (стандарт), XFS (серверы), Btrfs (современная)

**Для /boot** - ext2/ext3

**Для /tmp - tmpfs** (в памяти)

**Виртуальные** - procfs (/proc), sysfs (/sys), devtmpfs (/dev)

**Сетевые** - NFS, CIFS для Windows шаринга

### 4) Как можно создать файловую систему на диске?

Поиск диска: 
```bash
lsblk 
```
Создаем ФС
```bash 
sudo mkfs.ext4 /dev/sda1
sudo mkfs.xfs /dev/sda1
sudo mkfs.ntfs /dev/sda1
sudo mkfs.vfat /dev/sda1
```
Проверяем:
```bash 
sudo blkid /dev/sda1
```
### 5) Как можно подключить диск в систему, что такое монтирование?

Монтирование - подключение ФС к дереву каталогов
```bash 
sudo mkdir /mnt/mydisk
sudo mount /dev/sda1 /mnt/mydisk
echo "/dev/sda1 /mnt/mydisk ext4 defaults 0 2" | sudo tee -a /etc/fstab
sudo umount /mnt/mydisk
```
### 6) файловая система procfs, cifs, tpmfs,sysfs. В чём особенности каждой из них? Вывести каталоги к которым примонтированы эти файловые системыю

procfs (/proc): информация о процессах и системе

cifs: доступ к Windows/Samba шарингу

tmpfs: в оперативной памяти

sysfs (/sys): информация об устройствах

### 7) Как можно получить информацию о системе используя лишь команду cat? Вывести ифонмацию о процессоре и состоянии памяти системы

Дистрибутив: 

cat /etc/os-release

Процессор: 
```
cat /proc/cpuinfo | grep "model name" | head -1
```
Память: 
```
cat /proc/meminfo | grep -E "^(MemTotal|MemFree)"
```
Нагрузка: 
```
cat /proc/loadavg
```
Время работы: 
```
cat /proc/uptime
```
Подключённые swap-устройства: 
```
cat /proc/swaps
```
Разделы: 
```
cat /proc/partitions
```