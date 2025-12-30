
# Шарим (Samba)

### 1) Установите пакет Samba

```bash
sudo apt update
sudo apt install samba
smbd --version

```

### 2) Что такое общая папка и зачем она может быть нужна?
Общая папка — это папка, доступная нескольким пользователям по сети.  
Она нужна для:
- совместного хранения и обмена файлами;
- централизованного доступа к данным;
- разграничения прав доступа между пользователями и группами.

### 3) Создайте общую папку без пароля с правами только на чтение
```

sudo mkdir -p /srv/samba/public_read
sudo chmod 555 /srv/samba/public_read

```
```

[public_read]
path = /srv/samba/public_read
browsable = yes
read only = yes
guest ok = yes

```
```

sudo systemctl restart smbd

```

### 4) Создайте общую папку с паролем с правами на чтение и запись
```

sudo mkdir -p /srv/samba/private_rw
sudo chmod 770 /srv/samba/private_rw
sudo chown nobody:nogroup /srv/samba/private_rw
sudo smbpasswd -a username
sudo smbpasswd -e username

```
```

[private_rw]
path = /srv/samba/private_rw
browsable = yes
read only = no
valid users = username

```
```

sudo systemctl restart smbd

```

### 5) Создайте общую папку с доступом для группы с полными правами
```

sudo groupadd samba_group
sudo mkdir -p /srv/samba/group_full
sudo chown :samba_group /srv/samba/group_full
sudo chmod 770 /srv/samba/group_full
sudo usermod -aG samba_group username

```
```

[group_full]
path = /srv/samba/group_full
browsable = yes
read only = no
valid users = @samba_group

```
```

sudo systemctl restart smbd

```

### 6) Создайте общую папку с разными правами для разных групп
```

sudo groupadd full_access
sudo groupadd read_only
sudo groupadd no_access

sudo mkdir -p /srv/samba/mixed_access
sudo chown :full_access /srv/samba/mixed_access
sudo chmod 770 /srv/samba/mixed_access

sudo setfacl -m g:full_access:rwx /srv/samba/mixed_access
sudo setfacl -m g:read_only:rx /srv/samba/mixed_access
sudo setfacl -m g:no_access:--- /srv/samba/mixed_access

```
```

[mixed_access]
path = /srv/samba/mixed_access
browsable = yes
read only = no
valid users = @full_access, @read_only

```
```

sudo systemctl restart smbd

```
```
