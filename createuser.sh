#!/bin/bash

# Проверка наличия аргументов
if [ "$#" -ne 2 ]; then
    echo "Использование: $0 <имя_пользователя> <пароль>"
    exit 1
fi

USERNAME=$1
PASSWORD=$2

# Создание пользователя
sudo useradd -m -s /bin/bash $USERNAME

# Установка пароля для пользователя
echo "$USERNAME:$PASSWORD" | sudo chpasswd

# Проверка успешности создания пользователя
if [ $? -eq 0 ]; then
    echo "Пользователь $USERNAME успешно создан с паролем."
else
    echo "Ошибка при создании пользователя."
    exit 1
fi
