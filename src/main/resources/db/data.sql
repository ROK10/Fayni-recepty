DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS recipes;
DROP TABLE IF EXISTS ingredients;

CREATE TABLE users
(
    id       BIGINT AUTO_INCREMENT NOT NULL,
    username VARCHAR(255)          NOT NULL,
    password VARCHAR(255)          NOT NULL,
    CONSTRAINT pk_users PRIMARY KEY (id)
);

ALTER TABLE users
    ADD CONSTRAINT uc_users_id UNIQUE (id);

ALTER TABLE users
    ADD CONSTRAINT uc_users_password UNIQUE (password);

ALTER TABLE users
    ADD CONSTRAINT uc_users_username UNIQUE (username);

CREATE TABLE recipes
(
    id          BIGINT AUTO_INCREMENT NOT NULL,
    title       VARCHAR(255),
    description VARCHAR(255),
    popularity  INT,
    CONSTRAINT pk_recipes PRIMARY KEY (id)
);

ALTER TABLE recipes
    ADD CONSTRAINT uc_recipes_id UNIQUE (id);

CREATE TABLE roles
(
    id   BIGINT AUTO_INCREMENT NOT NULL,
    name VARCHAR(45)           NOT NULL,
    CONSTRAINT pk_roles PRIMARY KEY (id)
);

CREATE TABLE ingredients
(
    id   BIGINT AUTO_INCREMENT NOT NULL,
    name VARCHAR(255),
    CONSTRAINT pk_ingredients PRIMARY KEY (id)
);

ALTER TABLE ingredients
    ADD CONSTRAINT uc_ingredients_id UNIQUE (id);

CREATE TABLE recipes_ingredients
(
    recipe_id      BIGINT NOT NULL,
    ingredients_id BIGINT NOT NULL,
    CONSTRAINT pk_recipes_ingredients PRIMARY KEY (recipe_id, ingredients_id)
);

ALTER TABLE recipes_ingredients
    ADD CONSTRAINT uc_recipes_ingredients_reidinid UNIQUE (recipe_id, ingredients_id);

ALTER TABLE recipes_ingredients
    ADD CONSTRAINT fk_recing_on_ingredient FOREIGN KEY (ingredients_id) REFERENCES ingredients (id);

ALTER TABLE recipes_ingredients
    ADD CONSTRAINT fk_recing_on_recipe FOREIGN KEY (recipe_id) REFERENCES recipes (id);

CREATE TABLE users_created_recipes
(
    user_id            BIGINT NOT NULL,
    created_recipes_id BIGINT NOT NULL
);

ALTER TABLE users_created_recipes
    ADD CONSTRAINT uc_users_created_recipes_usidcrid UNIQUE (user_id, created_recipes_id);

ALTER TABLE users_created_recipes
    ADD CONSTRAINT fk_usecrerec_on_recipe FOREIGN KEY (created_recipes_id) REFERENCES recipes (id);

ALTER TABLE users_created_recipes
    ADD CONSTRAINT fk_usecrerec_on_user FOREIGN KEY (user_id) REFERENCES users (id);

CREATE TABLE users_liked_recipes
(
    user_id          BIGINT NOT NULL,
    liked_recipes_id BIGINT NOT NULL
);

ALTER TABLE users_liked_recipes
    ADD CONSTRAINT uc_users_liked_recipes_usidliid UNIQUE (user_id, liked_recipes_id);

ALTER TABLE users_liked_recipes
    ADD CONSTRAINT fk_uselikrec_on_recipe FOREIGN KEY (liked_recipes_id) REFERENCES recipes (id);

ALTER TABLE users_liked_recipes
    ADD CONSTRAINT fk_uselikrec_on_user FOREIGN KEY (user_id) REFERENCES users (id);

CREATE TABLE users_roles
(
    role_id BIGINT NOT NULL,
    user_id BIGINT NOT NULL,
    CONSTRAINT pk_users_roles PRIMARY KEY (role_id, user_id)
);

ALTER TABLE users_roles
    ADD CONSTRAINT uc_users_roles_user UNIQUE (user_id);

ALTER TABLE users_roles
    ADD CONSTRAINT fk_userol_on_role FOREIGN KEY (role_id) REFERENCES roles (id);

ALTER TABLE users_roles
    ADD CONSTRAINT fk_userol_on_user FOREIGN KEY (user_id) REFERENCES users (id);

INSERT INTO ingredients (name)
VALUES ('Чорний шоколад');
INSERT INTO ingredients (name)
VALUES ('Вершкове масло');
INSERT INTO ingredients (name)
VALUES ('Цукор');
INSERT INTO ingredients (name)
VALUES ('Яйця');
INSERT INTO ingredients (name)
VALUES ('Пшенична мука');
INSERT INTO ingredients (name)
VALUES ('Грецькі горіхи');

INSERT INTO recipes (title, `description`, popularity)
VALUES ('Брауні',
        '1. Увімкніть духовку для попереднього розігріву до 180 градусів. Глибоке деко змастити вершковим маслом. Шоколад розтопити, відставити убік.  2. У великій мисці з''єднати розм''якшене вершкове масло, яйця, цукор та борошно, добре перемішати. Ввести шоколад та ще раз добре перемішати. Ввести розламаний молочний шоколад.  3. Викласти тісто в підготовлене деко, поверхню розрівняти. Зверху посипати тісто волоським горіхом і помістити лист у розігріту духовку, випікати корж близько 20 хвилин.  4. Гарячий корж розрізати на квадратики та подавати на порційних тарілках.',
        0);

INSERT INTO recipes_ingredients (Recipe_id, ingredients_id)
VALUES (0, 0);
INSERT INTO recipes_ingredients (Recipe_id, ingredients_id)
VALUES (0, 1);
INSERT INTO recipes_ingredients (Recipe_id, ingredients_id)
VALUES (0, 2);
INSERT INTO recipes_ingredients (Recipe_id, ingredients_id)
VALUES (0, 3);
INSERT INTO recipes_ingredients (Recipe_id, ingredients_id)
VALUES (0, 4);
INSERT INTO recipes_ingredients (Recipe_id, ingredients_id)
VALUES (0, 5);

INSERT INTO roles (name)
VALUES ('user');
INSERT INTO roles (name)
VALUES ('admin');

INSERT INTO users (username, password)
VALUES ('user', 'userpass');
INSERT INTO users (username, password)
VALUES ('admin', 'adminpass');

INSERT INTO users_roles (role_id, user_id)
VALUES (0, 0);
INSERT INTO users_roles (role_id, user_id)
VALUES (1, 1);