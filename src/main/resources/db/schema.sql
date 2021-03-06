DROP TABLE IF EXISTS users_liked_recipes;
DROP TABLE IF EXISTS users_roles;
DROP TABLE IF EXISTS recipes cascade;
DROP TABLE IF EXISTS users cascade;
DROP TABLE IF EXISTS roles cascade;


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
    time        varchar(225)          not null,
    difficulty  varchar(225)          not null,
    creator_id  BIGINT                not null,
    CONSTRAINT pk_recipes PRIMARY KEY (id)
);

CREATE TABLE users_roles
(
    role_id BIGINT NOT NULL,
    user_id BIGINT NOT NULL
);

CREATE TABLE users_liked_recipes
(
    user_id          BIGINT NOT NULL,
    liked_recipes_id BIGINT NOT NULL,
    CONSTRAINT pk_users_likedrecipes PRIMARY KEY (user_id, liked_recipes_id)
);

ALTER TABLE users_liked_recipes
    ADD CONSTRAINT uc_users_liked_recipes_usidliid UNIQUE (user_id, liked_recipes_id);

ALTER TABLE users_liked_recipes
    ADD CONSTRAINT fk_uselikrec_on_recipe FOREIGN KEY (liked_recipes_id) REFERENCES recipes (id);

ALTER TABLE users_liked_recipes
    ADD CONSTRAINT fk_uselikrec_on_user FOREIGN KEY (user_id) REFERENCES users (id);

INSERT INTO users (username, password)
VALUES ('user', 'userpass'),
       ('admin', 'adminpass');

INSERT INTO roles (name)
VALUES ('user'),
       ('admin');

INSERT INTO users_roles (role_id, user_id)
VALUES (1, 1),
       (2, 2);

INSERT INTO recipes (title, description, popularity, img, time, difficulty, creator_id)
VALUES ('Шоколадна ковбаска', 'Якщо вам хочеться чогось нового та незвичного до ранкової кави – ось вам рецепт шоколадної ковбаски : простий, швидкий, недорогий та цікавий. В оригінальному рецепті використовується печиво савоярді, воно продається в кожному великому супермаркеті, коштує небагато і мати його під рукою завжди варто, якщо ви любите готувати Тірамісу та схожі десерти, але може підійти й інше просте печиво типу «До кави».

 180 гр вершкового масла кімнатної температури
 200 гр печива Савоярді, поламаного на шматочки розміром біля 1 см
 4 жовтки
 160 гр цукру
 100 гр пудри какао
 200 гр будь який горіхів нарізаних невеликими кусочками
 150 гр нарізаних невеликими кусочками сухофруктів
 щіпка солі
1
Жовтки збити з цукром. Додати масло, какао, сіль та збивати до отримання однорідної гладкої маси.

2
Горіхи, сухофрукти та печиво додати до маси та ретельно вимішати.

3
Взяти листок фольги, викласти туди шоколадну масу та загорнути ковбаскою, товщиною біля 5 см. Покласти в холодильник на ніч.

4
Подавати, нарізаючи скибочками.', 0,
        'https://fayni-recepty.com.ua/wp-content/uploads/2021/04/kovbasa-shokoladna-1024x683.jpg', '35 хвилин', 'легко', 2);

INSERT INTO recipes (title, description, popularity, img, time, difficulty, creator_id)
VALUES ('Шоколад з какао й молока', 'Коли хочеться поласувати плиткою шоколаду, необов''язково йти до магазину. Якщо у вас є какао порошок, цукор, молоко й трохи вершкового масла, можна приготувати шоколад в домашніх умовах. Успіх переважно залежить від якості какао. Готові суміші найкраще підійдуть для приготування какао та гарячого шоколаду. А без гарного справжнього какао шоколад просто не застигне.

 100 мл молока
 100 гр порошку какао
 50 гр вершкового масла
 50 гр цукру
 0,50 ч. л. ванільного цукру
 горішки, родзинки, цукати
1
Вершкове масло нарізаємо невеликими кубиками, додаємо у сотейник з молоком. Ставимо сотейник на невеликий вогонь та доводимо молоко до кипіння. Але кип''ятити не потрібно!

2
Знімаємо сотейник з вогню й помішуємо масу, поки все масло не розтане. Велике значення для хорошого застигання шоколадної плитки має якість та жирність вершкового масла, найкраще 82,5%.

3
Всипаємо у гаряче молоко цукор, перемішуємо до розчинення. З кількістю цукру у даному рецепті вийде не дуже солодкий шоколад. Якщо бажаєте отримати солодший шоколад, можна додати цукру більше.

4
Далі всипаємо порошок какао, обережно перемішуємо до однорідного стану. Якість какао у порошку у всіх виробників різна, й переконатися у ній доведеться лише досвідченим шляхом. Якщо суміш виходить занадто густою, радимо закип’ятити трохи молока й поступово доливати його до шоколадної маси, розмішуючи до отримання потрібної консистенції.

5
Має вийти блискуча однорідна суміш, густа, як жирна сметана, що не стікає з вінчика. Якщо вийшла рідка й плинна суміш, як глазур, шоколад не застигне. У такому випадку можна додати какао або випаровувати суміш на водяній бані, постійно помішуючи.

6
Додаємо ванільний цукор, за бажанням – горішки, цукати, родзинки до смаку та перемішуємо. Розливаємо гарячу шоколадну масу по формах для цукерок або просто на лист пергаменту.

7
Охолоджуємо шоколад при кімнатній температурі, а потім ставимо форми у морозилку на 1-2 години для повного застигання. Варто врахувати, що такий шоколад швидко тане, адже в ньому немає різних стабілізаторів, які додають при промисловому виробництві шоколадок.

Насолоджуємося натуральним шоколадом власного приготування! Смачного!', 0,
        'https://fayni-recepty.com.ua/wp-content/uploads/2022/04/shokolad-z-kakao-1024x765.jpg', '25 хвилин', 'середня', 2);

INSERT INTO recipes (title, description, popularity, img, time, difficulty, creator_id)
VALUES ('Десерт з творогу без цукру','Солодке люблять майже всі. Цукерки, тортики, кексики, шоколадки - ці солодощі завжди подають на десерт, щоб завершити трапезу солодким акордом. Утім, солодке може зашкодити вашій фігурі. Відмовитися від смакоти не просто, а допомогти може десерт без цукру, борошна та олії. Ось рецепт десерта без цукру.

 600 гр творогу
 2 яйця
 1 щіпка ваніліну
 20 гр желатину
 100 гр меду
 40 гр крохмалу
 500 мл молока
1
Залийте желатин 100 мл молока та залиште набухати на 10 хвилин.

2
Змішайте яйця, крохмаль і трохи молока до однорідної маси. По тому долийте молоко, що залишилося, і перемішайте.

3
Поставте суміш на середній вогонь та варіть її, постійно помішуючи. Після того як маса дійде до кипіння, варіть ще хвилину. Коли крем охолоне, додайте мед та ваніль.

4
Збийте сир блендером і додайте крем і нагрітий до 60°С желатин. Збийте до однорідної маси.

5
Перемістіть масу у форму, накрийте плівкою та поставте у холодильник щонайменше на 6 годин. І ось ваш смачний десерт без цукру - готовий!

6
Якщо хочете зробити низькокалорійний десерт дещо солодшим, додайте більше меду. Зверху можна прикрасити частування фруктами чи ягодами.', 0,
        'https://fayni-recepty.com.ua/wp-content/uploads/2021/11/desert-bez-tsukru-1024x666.jpg', '50 хвилин', 'середня', 2);

INSERT INTO recipes (title, description, popularity, img, time, difficulty, creator_id)
VALUES ('Флан','Що таке флан? Флан – це традиційний європейський десерт з дуже давньою історією, який сьогодні набув великої популярності по цілому світу. Готується флан нескладно, а його легка тестура підійде до будь якого сезону. Флан можна готувати у вигляді пирога на крихому тісті чи просто у формах для десерту.

 Крухе тісто
 1 л молока
 150 гр цукру
 90 гр кукурудзяного крохмалю
 ванільний цукор або ванільний екстракт
 4 яйця
1
Закип’ятити молоко разом з ваніллю

2
Змішати цукор з крохмалем, додати збиті яйця. Все ретельно вимішати в однорідну масу.

3
До маси влити молоко і перемішати.

4
Нагріти духовку до 200 градусів. У змащену масло круглу форму з високими стінками викласти розкачане тісто і наколоти його виделкою.

5
Вилити молочну суміш поверх тіста.

6
Випікати протягом 30-40 хв

7
Подавати після повного вистигання', 0,
        'https://fayni-recepty.com.ua/wp-content/uploads/2021/07/flan-1024x683.jpg', '1 година 5 хвилин', 'легко', 2);

INSERT INTO recipes (title, description, popularity, img, time, difficulty, creator_id)
VALUES ('Полуничне тірамісу','Якщо вам хочеться приготувати щось літньо-полуничне, але водночас не дуже відходити від класики, то пропонуємо рецепт полуничного тірамісу. Цей рецепт технологічно дуже близький до традиційного тірамісу, але ви можете додати фруктової легкості та свіжості. Замочіть печиво не в каві, а в помаранчевому соці, додайте свіжі стиглі полуниці і ви побачите, які нові нотки відкриються вам в смаку цього класичного десерта.

 3 яйця
 3 жовтки
 500 гр маскарпоне
 250 гр печива савоярді
 130 гр цукру
 500 гр полуниць
 200 мл апельсинового соку
1
Всі інгредієнти дістати з холодильника за годину до приготування

2
Відділити білки від жовтків. Жовтки збити з цукром до густої білої. Ввести маскарпоне і ретельно вимішати.

3
Збити білки до піків і дуже ніжно, мішаючи зверху вниз, ввести у суміш.

4
Полуниці розрізати навпіл чи на чотири частини.

5
На дно форми викласти перший шар крему. Викласти шар печива, попередньо кожне занурюючи в апельсиновий сік. Робити це дуже швидко, щоби печиво не розмокало занадто сильно. Зверху викласти половину полуниць.

6
Розділити крем на половину і рівномірно викласти шар крему, тоді решту полуниць, ще шар печива і зверху вкрити кремом, що залишився.

7
Накрити харчовою плівкою і поставити в холодильник на 4 год або на ніч.

8
Перед подачею прикрасити полуницями. Можна посипати какао, при бажанні.', 0,
        'https://fayni-recepty.com.ua/wp-content/uploads/2021/07/polunychne-tiramisu-1-1024x680.jpg', '1 година 30 хвилин', 'середня', 2);

INSERT INTO recipes (title, description, popularity, img, time, difficulty, creator_id)
VALUES ('Шоколадний мус','Лише 4 інгредієнти, лише 15 хв для приготування і наступного дня у вас на столі повітряний, насичений і дуже смачний десерт. Ви можете використовувати той шоколад, який найбільше до вподоби: чорний з високим вмістом какао, щоби отримати інтенсивний смак з характерною гірчинкою, молочний, аби насолодитись ніжним легким смаком, такий мус буде особливо до вподоби дітям чи білий шоколад. Або й навіть суміш всіх трьох. Можна додати карамель, прянощі, помаранчеві цукати (фантастично смакують з чорним шоколадом), пару листочків м''яти і створити свій власний рецепт. Якщо ви не любитель надто солодкого - візьміть шоколад з максимальним вмістом какао і солоне масло. Не бійтесь експериментів, вам не вдасться зіпсувати рецепт шоколадного мусу, ви його лише покращите!

 150 гр Шоколаду (чорного, білого, молочного)
 25 гр Масла
 4 шт Яйця
 25 гр Цукру
1
Поламати чи нарізати шматочками шоколад і розтопити його на паровій бані або в мікрохвильовій печі.

2
Відділити жовтки від білків, білки можна поставити в холодильник, а жовтки збити з цукром до глянцевої, шовковистої маси.

3
Додати жовтки до шоколаду, дуже добре вимішати масу і дати повністю вистигнути.

4
До білків додати щіпку солі і збити до піків.

5
Дуже ніжно і акуратно ввести білки до шоколадної маси. Мішати поки маса не стане однорідною, але дуже плавно, згори до низу, щоби білки не осіли.

6
Розкласти у креманки і поставити в холодильник на ніч.', 0,
        'https://fayni-recepty.com.ua/wp-content/uploads/2021/03/shokoladny-mus-1024x683.jpg', '35 хвилин', 'легко', 2);

INSERT INTO recipes (title, description, popularity, img, time, difficulty, creator_id)
VALUES ('Шоколадний брауні','Насичений шоколадно-горіховий смак, швидкість та простота в приготуванні, універсальність подачі - все це наш ідеальний рецепт класичного шоколадного брауні. Легендарний десерт, що ніколи вас не зрадить. Його можна подавати гарячим з кулькою морозива, вистудити і нарізавши квадратиками, брати з собою в дорогу, до школи, на роботу і просто частувати тих, кого любимо.

 200 гр Кулінарного або звичайного шоколаду
 100 гр Горіхів (волоських, лісових, пекан, мигдалю)
 150 гр Вершкового масла
 150 гр Борошна
 150 гр Цукру 2
 2 шт Яйця
 Ванільний цукор
 Щіпка солі, щіпка соди
1
Нагріти духовку до 180 градусів.

2
Подрібнити шоколад, помістити в посудину, відповідну для мікрохвильової печі чи для водяної бані, додати масло і розтопити (1.5 хв в мікрохвильовій печі). Якщо розтоплювати на водяній бані, то слідкувати, щоби дно посудини з шоколадом не було занурене у воду. Коли шоколад з маслом розтануть, вимішати масу до однорідності.

3
Окремо збити яйця з цукром і ваніллю до однорідної, гладкої маси і змішати разом з шоколадом.

4
Додати муку з сіллю та содою. Вимішати.

5
Грубо нарізати горіхи, жменьку відкласти, а решту додати до маси.

6
Вилити тісто у змащену маслом форму діаметром біля 20 см. Присипати залишками горіхів.

7
Випікати 25 хв. Перевірити готовність зубочисткою - проколоти тісто посередині, якщо зубочистка вийде фактично сухою і чистою, то брауні готовий.', 0,
        'https://fayni-recepty.com.ua/wp-content/uploads/2021/03/shokoladny-brownie-1024x682.jpg', '1 год 25 хвилин', 'легко', 2);

INSERT INTO recipes (title, description, popularity, img, time, difficulty, creator_id)
VALUES ('Бельгійські вафлі','Рецепт бельгійських вафель, як ми можемо здогадатися по назві, прийшов з Бельгії, а точніше з Брюсселя. Сталося це в середині ХХ століття і відтоді бельгійські вафлі не втрачають своєї популярності. У класичному варіанті бельгійські вафлі подаються зі збитими вершками і трускавками, але такої особливої популярності вони набули також завдяки своїй універсальності - ви зустрінете бельгійські вафлі в меню дорогих ресторанів, на ятках з вуличною їжею, їх можна їсти на сніданок, на десерт, як перекус, давати дітям до школи, супроводжувати основну страву і так далі. Особливість бельгійських вафель в тому, що вони доволі товсті, з легкою повітряною текстурою, хрусткі зверху і ніжні всередині. Готувати їх просто, рецептів безліч і єдине, що вам потрібно - це вафельниця та фантазія. Для того, аби приготувати бельгійські вафлі, достатньо 15-20 хвилин і дуже простий набір інгредієнтів. Ми підготували рецепт бельгійських вафель без молока, з додаванням йогурту та підручних компонентів.

 300 гр муки
 100 гр вершкового масла
 100 гр цукру
 300 мл йогурту без наповнювачів
 2 ч. л. розпушувача для тіста
 2 яйця
1
Змішуємо муку з розпушувачем

2
Яйця збиваємо з цукром

3
Змішуємо всі інгредієнти разом. Масло повинно бути дуже м”яким, але не розтопленим. Можна скористатись комбайном на режимі замішування тіста або блендером з відповідним вінчиком

4
Випікаємо в нагрітій вафельниці 3-4 хв', 0,
        'https://fayni-recepty.com.ua/wp-content/uploads/2021/02/beligum-wafli-1024x683.jpg', '19 хвилин', 'легко', 2);

INSERT INTO recipes (title, description, popularity, img, time, difficulty, creator_id)
VALUES ('Бите скло','Іноді хочеться приготувати на десерт щось легке і швидке. Один з таких необтяжливих рецептів – торт без випічки «бите скло». Рецепт дуже простий – містить желе й сметану, варіацій можна запропонувати безліч. Завдяки яскравим кольорам десерт стане чудовою прикрасою будь-якого столу. А щоб приготувати торт «бите скло», зовсім не потрібно великого кулінарного досвіду.

 500 мл сметани 20%
 3 ст. л. желатину швидкорозчинного
 100 гр цукру
 3 пакети желе різних кольорів
 6 шт одноразових пластикових стаканчиків
1
Замочуємо желатин водою, перемішуємо й залишаємо для набухання на 15-20 хвилин.

2
З желе у пакетах – кожну порцію окремо, приготуємо желе для десерту «бите скло», але використовуємо води вдвічі менше.

3
Виливаємо готове желе у пластикові скляночки й охолоджуємо у холодильнику.

4
Коли желе охолоне, ножицями розрізаємо пластик, щоб отримати желе цілим. Нарізаємо його на шматочки – кубики, трикутники, й викладаємо у глибокий посуд, у який попередньо вкладаємо харчову плівку. Так потім можна буде легко вийняти готовий торт «бите скло» з форми.

5
Желатин розігріємо на водяній бані до повного розчинення.

6
Збиваємо сметану з цукром до пишної маси. Поступово додаємо, продовжуючи збивати, розчинений желатин.

7
Готовою сумішшю заливаємо наш десерт «бите скло» й відправляємо у холодильник на 3-4 години.

8
Готовий желейний торт обережно перевертаємо на блюдо й прикрашаємо.', 0,
        'https://fayni-recepty.com.ua/wp-content/uploads/2020/07/tort-byte-sklo-1024x683.jpg', '1 год 25 хвилин', 'легко', 2);

INSERT INTO recipes (title, description, popularity, img, time, difficulty, creator_id)
VALUES ('Яблучний пиріг','Якщо ви шукаєте, як приготувати яблучний пиріг, ми поділимося дуже смачним рецептом. Звичайно, яблучний пиріг на кефірі – рецепт абсолютно легкий. Тож розповімо, як приготувати пиріг з яблуками справжній і найніжніший – на дріжджовому тісті. Навіть на другий день спечений за цим рецептом яблучний пиріг не зачерствіє, якщо, звичайно, раптом щось залишиться.

 150 мл молока
 300 гр борошна
 50 гр вершкового масла
 ½ ч. л. сухих дріжджів
 3 яйця
 4 ст. л. цукру
 4 яблука
 ½ ч. л. кориці
 сіль
1
Спочатку приготуємо опару для тіста на яблучний пиріг: у теплому молоці розмішаємо ложкою дріжджі, 1 ст. л. борошна й по щіпці цукру й солі. Накриємо рушником і залишимо на 15-20 хвилин.

2
Додаємо до опари просіяне борошно, м’яке масло, 2 яйця і 2 ст. л. цукру. Замішуємо еластичне тісто й ставимо у тепле місце на 1-1,5 години.

3
А тим часом яблука очищаємо від шкірки, нарізаємо тонкими скибками й перемішуємо з рештою цукру та корицею.

4
Тісто, що вже піднялося, розділимо на 2 частини. Одну частину розкатуємо і вкладаємо у високу форму так, щоб з тіста утворився ніби кошик.

5
Рівномірно розподіляємо яблука по тісту.

6
З другої частини тіста виробляємо довгасті тоненькі смужки й гарно прикрашаємо пиріг зверху. Залишаємо на розстоювання на 20-25 хвилин.

7
Змащуємо збитим яйцем і випікаємо при температурі 200°С.', 0,
        'https://fayni-recepty.com.ua/wp-content/uploads/2020/07/pyrih-yabluchnyi-1024x824.jpg', '2 год 40 хвилин', 'середня', 2);



INSERT INTO recipes (title, description, popularity, img, time, difficulty, creator_id)
VALUES ('Налисники з сиром','Тісто для налисників на молоці – це той самий рецепт тоненьких млинців, якими можна насолоджуватися зі сметаною, медом, варенням. Або передивитися рецепти налисників з різними начинками й приготувати ті, які найбільш подобаються вашим домашнім. Для начинки можна взяти домашній сир, джем, мак, шоколад. І не обов’язково солодкі начинки, у налисники загортають відварне м''ясо, тушковану капусту, гриби, ікру, паштети, салати.

 500 мл молока
 4 яйця
 8 ст. л. борошна
 80 мл води
 1 ст. л. цукру
 1 ст. л. олії
 30 гр вершкового масла
 сіль - за смаком
1
Всі інгредієнти вкладаємо у глибоку миску та збиваємо міксером до однорідного стану. Вершкове масло попередньо розтоплюємо.

2
Якщо вам більше подобається рецепт налисників на молоці з ручним збиванням, потрібно спочатку ретельно перемішати всі компоненти, а вже до них всипати просіяне борошно й продовжувати збивати. Можете спробувати інший варіант – у борошно вбивати яйця, доливати молоко, а тоді перемішувати. Ви переконаєтеся, що 1-й спосіб кращий, тісто стає однорідним майже одразу.

3
Тісто для налисників залишаємо на 10-15 хвилин, щоб млинці вийшли більш еластичними.

4
Занадто густе тісто для налисників на молоці можна розвести молоком або водою. Його консистенція має бути текучою.

5
Відповідальний момент – гарна сковорода! Деякі господині навіть мають окрему пательню для смаження налисників. Змащуємо сковорідку олією для першого млинчика, гарно нагріваємо. Надалі змащувати не потрібно, адже до тіста ми вже додали достатньо олії та масла.

6
Швидко наливаємо черпаком тісто й смажимо млинці з обох сторін.', 0,
        'https://fayni-recepty.com.ua/wp-content/uploads/2020/07/nalysnyky-syrom-1024x684.jpg', '42 хвилини', 'легко', 2);


INSERT INTO recipes (title, description, popularity, img, time, difficulty, creator_id)
VALUES ('Панкейк: швидкий десерт','У кожній національній кухні є схожі рецепти смачних десертів. Так і американські панкейки, які дуже подібні до наших оладок. Інколи їх називають японськими оладками. Щоб приготувати такий швидкий десерт, знадобиться лише декілька хвилин, проте матимете повноцінну страву на сніданок або простий десерт на обід. Зовсім просто – спробуйте!

 200 гр борошна
 200 мл молока
 2 ст. л. олії
 2 ст. л. цукру
 1 яйце
 1 ч. л. розпушувача
 1 кр. солі
 1 кр. ванілі
1
Розбиваємо у миску яйце, додаємо сіль, цукор, ваніль та перемішуємо.

2
Додаємо молоко, олію та збиваємо.

3
В окремому посуді ретельно перемішуємо розпушувач з просіяною мукою.

4
Додаємо борошно з розпушувачем до суміші з молоком та збиваємо.

5
Смажимо на сухій, добре розігрітій сковороді, щоб панкейки вийшли рум’яними й матовими. Намагаємося швидко наливати на сковорідку певну кількість тіста, так панкейки будуть однакового розміру – діаметром 6-8 см.

6
На другу сторону перевертаємо, коли на тісті з’являться бульбашки.

7
Подаємо панкейки з варенням, сметаною, медом чи соком, фруктами – як вам заманеться. Смакуємо прямо зараз, не чекаючи, поки прохолонуть!', 0,
        'https://fayni-recepty.com.ua/wp-content/uploads/2020/05/pankeik-recept-1024x683.jpg', '30 хвилин', 'легко', 2);

INSERT INTO recipes (title, description, popularity, img, time, difficulty, creator_id)
VALUES ('Вишуканий десерт бламанже','Точно невідомо, коли у Європі з’явився мигдаль, рис, східні прянощі. Найстаріші рецепти французького желе були вже відомі у 12 столітті. Спитаєте, до чого тут мигдаль? Все просто: розтовчений необсмажений мигдаль змішували з водою й отримували мигдальне молоко. Щось ніби сучасного соєвого молока або протеїнових напоїв. З мигдального молока та рисового борошна й готували французьке желе бламанже – простий десерт.

 150 гр мигдалю
 0,50 л води
 100 гр цукрової пудри
 15 гр желатину
1
Мигдаль заливаємо окропом на декілька хвилин, очищаємо.

2
Мигдаль подрібнюємо у блендері, підливаючи потрошку воду.

3
Мигдальне молоко виливаємо у каструльку й доводимо до кипіння, охолоджуємо.

4
Желатин для желе заливаємо невеликою кількістю води.

5
Холодне мигдальне молоко проціджуємо через декілька шарів марлі або щільну тканину.

6
Ставимо відціджене молоко на вогонь, додаємо розбухлий желатин, варимо до розчинення, але не кип’ятимо.

7
Додаємо цукрову пудру, розмішуємо. Охолоджуємо.

8
Вершки збиваємо у піну й викладаємо у мигдальне молоко, перемішуємо.

9
Викладаємо у формочки – й на холод.', 0,
        'https://fayni-recepty.com.ua/wp-content/uploads/2020/04/blanmanzh-1024x691.jpg', '26 хвилин', 'легко', 2);

INSERT INTO recipes (title, description, popularity, img, time, difficulty, creator_id)
VALUES ('Сирний пудинг – дієтичний простий десерт','Сирний пудинг, сирна запіканка, сирна бабка, чізкейк – називати можна, як завгодно. Готуємо сирний пудинг на основі манки – десерт за 5 хвилин, нічого складного, це швидкий дуже збалансований рецепт. Виходить смачно у всіх і завжди!

 500 гр сиру
 350 гр молока
 150 гр цукру
 4 яйця
 50 гр родзинок
 150 гр манної крупи
 ванільний цукор
1
У холодне молоко всипаємо манку, розмішуємо.

2
Варимо манну кашу, після остигання вона має добре загуснути.

3
Родзинки заливаємо холодною водою.

4
Збиваємо міксером білки з щіпкою солі й 2-3 краплями лимонного соку.

5
Жовтки з цукром збиваємо окремо, додаємо ванільний цукор.

6
Додаємо у сир жовтки, ретельно збиваємо до однорідної маси.

7
Додаємо родзинки, збиті білки й акуратно перемішуємо ложкою рухами зверху вниз.

8
Викладаємо масу у форму, змащену олією й випікаємо при температурі 180 °С.

9
Прикрашаємо і підсолоджуємо карамеллю. Подаємо в охолодженому виді.', 0,
        'https://fayni-recepty.com.ua/wp-content/uploads/2020/04/syrnyi-pudynh-1024x683.jpg', '1 година 30 хвилин', 'важко', 2);