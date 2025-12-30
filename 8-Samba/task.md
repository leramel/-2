
# Шарим


1. Установите пакет samba  
   Установим samba  
   ![alt text](images/image1.png)
   
2. ЧТо такое побщая папка, зачем оно может быть нужно?  
   Общая папка — это директория на сервере, доступ к которой предоставлен по сети другим компьютерам по протоколам SMB/CIFS (для Windows, macOS, Linux) или другим сетевым протоколам.
3. Создайте общую папку без пароля с правами только на чтение файлов  
   Создадим папку и установим для неё соответствующий режим  
   ![alt text](images/image2.png)  
   Откроем файл /etc/samba/smb.conf и добавим в конец следующие строки  
   ![alt text](images/image3.png)  
4. Создайте общую папку с паролем с правами на чтение и запись  
   Создадим нового юзера  
   ![alt text](images/image4.png)  
    Добавляем пользователя в Samba  
    ![alt text](images/image5.png)  
    Создадим папку, изменим ей владельца и установим соответствующий режим доступа  
    ![alt text](images/image6.png)  
    Добавим в /etc/samba/smb.conf следущие строчки  
    ![alt text](images/image7.png)
5. Создайте общую папку с доступом для какой-то группы с полными правами  
   Создадим новых юзеров и добавим их в группу  
   ![alt text](images/image8.png)  
   ![alt text](images/image9.png)  
   ![alt text](images/image10.png)  
    ![alt text](images/image11.png)  
    ![alt text](images/image12.png)  
    Далее добавим пользователей в Samba  
    ![alt text](images/image13.png)  
    ![alt text](images/image14.png)  
    Создадим нужную директорию  
    ![alt text](images/image15.png)  
    Откроем /etc/samba/smb.conf и добавим следующие строки  
    ![alt text](images/image16.png)  
6. Создайте общую папку в которой у одной группы будет полный доступ, а у другой только доступ на чтение. Третья группа не должна иметь к ней доступа  
   Создадим группы  
   ![alt text](images/image17.png)  
   Создадим пользователей  
   ![alt text](images/image18.png)  
   Добавим пользователей в соответствующие группы  
   ![alt text](images/image19.png)  
   Добавим пользователей в Samba  
   ![alt text](images/image20.png)  
   Создадим нужную директорию  
   ![alt text](images/image21.png)  
   Откроем /etc/samba/smb.conf и добавим следующие строки  
   ![alt text](images/image22.png)
