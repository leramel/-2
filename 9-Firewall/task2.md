# Открываем firewald

1. Удалите iptables и установите firewalld  
   Удаляем iptables  
   ![alt text](images/image5.png)  
   Устанавливаем firewalld  
   ![alt text](images/image6.png)
2. Попробуйте так-же проверить возможность подключения по ssh  
   Мне удалось успешно подключиться  
   ![alt text](images/image7.png)
3. Если её нет то откройте порт  
   Несмотря на то что у меня получилось подключиться, открою порт  
   ![alt text](images/image8.png) 
4. Выведите список открытых портов с помощью firewall-cmd  
   ![alt text](images/image9.png)
5. Можно ли там добавить порты по названию сервиса?
    Да, например sudo firewall-cmd --add-service=ssh. Firewalld сам знает, какие порты относятся к сервису.  

6. На вашей Локальной виртуальной машине попробуйте подключиться к серверу samba из предыдущих заданий  
   ![alt text](images/image10.png)
7. Если не получилось то откройте нужные порты
   ![alt text](images/image11.png)

8. Сделайте так чтобы изменения были постоянными


