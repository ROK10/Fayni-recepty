DROP TABLE IF EXISTS users_created_recipes;
DROP TABLE IF EXISTS users_liked_recipes;
DROP TABLE IF EXISTS users_roles;
DROP TABLE IF EXISTS users cascade;
DROP TABLE IF EXISTS roles cascade;
DROP TABLE IF EXISTS recipes cascade;

CREATE TABLE users
(
    id       BIGINT AUTO_INCREMENT NOT NULL,
    username VARCHAR(255)          NOT NULL,
    password VARCHAR(255)          NOT NULL,
    CONSTRAINT pk_users PRIMARY KEY (id)
);

CREATE TABLE roles
(
    id   BIGINT AUTO_INCREMENT NOT NULL,
    name VARCHAR(45)           NOT NULL,
    CONSTRAINT pk_roles PRIMARY KEY (id)
);

CREATE TABLE recipes
(
    id          BIGINT AUTO_INCREMENT NOT NULL,
    title       VARCHAR(255)          NOT NULL,
    description longtext              NOT NULL,
    popularity  INT                   NOT NULL,
    img         VARCHAR(225)          NOT NULL,
    ingredients longtext              NOT NULL,
    time        varchar(225)          not null,
    difficulty  varchar(225)          not null,
    CONSTRAINT pk_recipes PRIMARY KEY (id)
);

CREATE TABLE users_roles
(
    role_id BIGINT NOT NULL,
    user_id BIGINT NOT NULL
);

CREATE TABLE users_liked_recipes
(
    user_id   BIGINT NOT NULL,
    recipe_id BIGINT NOT NULL
);

CREATE TABLE users_created_recipes
(
    user_id   BIGINT NOT NULL,
    recipe_id BIGINT NOT NULL
);

INSERT INTO users (username, password)
VALUES ('user', 'userpass'),
       ('admin', 'adminpass');

INSERT INTO roles (name)
VALUES ('user'),
       ('admin');

INSERT INTO users_roles (role_id, user_id)
VALUES (1, 1),
       (2, 2);

INSERT INTO ingredients (name)
VALUES ('Пісочне печиво'),
       ('Вершкове масло'),
       ('Малина перетерта'),
       ('Морозиво'),
       ('Ягоди'),
       ('Ванілін');

INSERT INTO recipes (title, description, popularity, img, ingredients, time, difficulty)
VALUES ('Малиновий торт із морозивом', '1. Печиво подрібнюємо, змішуємо з розм’якшеним вершковим маслом та викладаємо у форму з високими знімними бортами.

2. У глибоку посудину викладаємо морозиво і залишаємо на 10–15 хвилин за кімнатної температури.

3. «Малину – апельсин», перетерті із цукром, додаємо до морозива та змішуємо за допомогою блендера. Отриману масу ставимо на півгодини в холодильник для застигання.

4. Викладаємо суміш на корж із печива, розрівнюємо поверхню. Ставимо в морозилку для остаточного замерзання.

5. Виймаємо торт із форми та прикрашаємо цілими ягодами — свіжими або замороженими.', 0,
        'https://rud.ua/uploads/under_recipe/Malinoviy_tort-morozivo_600x300_61cc2028604e5.jpg', 'Пісочне печиво
       Вершкове масло
       Малина перетерта
       Морозиво
       Ягоди
       Ванілін', '120 хвилин', 'легко');

INSERT INTO recipes_ingredients (recipe_id, ingredient_id)
VALUES (1, 1),
       (1, 2),
       (1, 3),
       (1, 4),
       (1, 5),
       (1, 6);

INSERT INTO users_created_recipes (user_id, recipe_id)
VALUES (1, 1);
