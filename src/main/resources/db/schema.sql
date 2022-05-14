DROP TABLE IF EXISTS users_created_recipes;
DROP TABLE IF EXISTS users_liked_recipes;
DROP TABLE IF EXISTS users_roles;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS recipes_ingredients;
DROP TABLE IF EXISTS recipes;
DROP TABLE IF EXISTS ingredients;

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
    title       VARCHAR(255)          NULL,
    description longtext              NULL,
    popularity  INT                   NULL,
    CONSTRAINT pk_recipes PRIMARY KEY (id)
);

CREATE TABLE ingredients
(
    id   BIGINT AUTO_INCREMENT NOT NULL,
    name VARCHAR(255)          NULL,
    CONSTRAINT pk_ingredients PRIMARY KEY (id)
);

CREATE TABLE users_roles
(
    role_id BIGINT NOT NULL,
    user_id BIGINT NOT NULL,
    constraint fk_user_to_role_user foreign key (user_id) references users (id),
    constraint fk_user_to_role_role foreign key (role_id) references roles (id)
);

CREATE TABLE recipes_ingredients
(
    recipe_id     BIGINT NOT NULL,
    ingredient_id BIGINT NOT NULL,
    constraint fk_recipes_ingredients_recipe foreign key (recipe_id) references recipes (id),
    constraint fk_recipes_ingredients_ingredient foreign key (ingredient_id) references ingredients (id)
);

CREATE TABLE users_liked_recipes
(
    user_id   BIGINT NOT NULL,
    recipe_id BIGINT NOT NULL,
    constraint fk_users_liked_recipes_user foreign key (user_id) references users (id),
    constraint fk_users_liked_recipes_recipe foreign key (recipe_id) references recipes (id)
);

CREATE TABLE users_created_recipes
(
    user_id   BIGINT NOT NULL,
    recipe_id BIGINT NOT NULL,
    constraint fk_users_created_recipes_user foreign key (user_id) references users (id),
    constraint fk_users_created_recipes_recipe foreign key (recipe_id) references recipes (id)
);

INSERT INTO users (username, password)
VALUES ('user', 'userpass'),
       ('admin', 'adminpass');

INSERT INTO roles (name)
VALUES ('user'),
       ('admin');

INSERT INTO users_roles (role_id, user_id)
VALUES (0, 0),
       (1, 1);