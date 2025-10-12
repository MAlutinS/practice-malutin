# practice-malutin

## Репозиторий для прохождения осенней практики Индид 2025

### Цель
Подготовка базовой инфраструктуры для кода, который пока что находиться в разработке.

### Технологичейский стек

- [docker compose](https://docs.docker.com/compose/) - контейнеризация приложений и управление стеком;
- [HAproxy](https://www.haproxy.org/) - балансировщик;
- [Astro](https://astro.build/) - frontoffice сервис;
- [Strapi](https://strapi.io/) - backoffice сервис;
- [Postgres](https://www.postgresql.org/) - база данных;
- [Git](https://git-scm.com/) - система управления версиями.

### Команды для запуска проекта

1. Установка зависимостей для frontoffice
    ```bash
    cd frontoffice
    npm i
    ```

2. Установка зависимостей для backoffice
    ```bash
    cd ../backoffice
    npm i
    ```

### Как доставляется код разработчика

1. Клонирование репозитория:
    ```bash
    git clone git@github.com:${yourUsername}/practice-malutin.git
    cd practice-malutin
    ```
2. Переход в ветку develop:
    ```bash
    git checkout develop
    ```
3. Внесение изменений и коммит:
    ```bash
    git add . 
    git commit -m "описание"
    ``` 
4. Отправка изменений в ветку develop:
    ```bash
    git push origin develop
    ```
5. Создание Pull Request для слияния с веткой main

### Скрипты для работы

Изначально нужно перейти в папку dev-config с помощью команды

    ```bash
    cd practice-malutin/dev-config
    ```

1. Запуск docker-контейнеров
    ```bash
    ./scripts/start.ps1
    ```
2. Остановка docker-контейнеров
    ```bash
    ./scripts/stop.ps1
    ```
3. Создание бэкапов
    ```bash
    ./scripts/backup.ps1
    ```
4. Восстановление из последнего архива
    ```bash
    ./scripts/restore.ps1
    ```
5. Обновление кода front & back office, обновление конфигурации БД
    ```bash
    ./scripts/update.ps1
    ```
6. Вывод логов для указанного сервиса
    ```bash
    ./scripts/logs.ps1 <имя_сервиса>
    ```
7. Подключение к указанному сервису
    ```bash
    ./scripts/console.ps1 <имя_сервиса>
    ```
### Доступ к сервисам

- Frontoffice: http://localhost:80
- Backoffice (основной): http://localhost:1337
- Backoffice (запасной): http://localhost:1338
- pgAdmin: http://localhost:8080 email:admin@example.com password:admin123
- статистика HAProxy: http://localhost:1936

### База данных

- PostgreSQL (основная): http://localhost:5432
- PostgreSQL (запасная): http://localhost:5433

##### Данные для подлючения
 - Database: "backoffice"
 - Username: "admin"
 - Password: "admin"