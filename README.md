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
5. Создание pull request из ветки develop в main
6. После слияния веток - запуск скрипта обновления