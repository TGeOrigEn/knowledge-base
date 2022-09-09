--Личность
create TABLE person(
    --Уникальный номер
    id SERIAL NOT NULL PRIMARY KEY,
    --Фамилия
    surname VARCHAR(32) NOT NULL,
    --Имя
    name VARCHAR(32) NOT NULL,
    --Отчество
    patronymic VARCHAR(32) NOT NULL,
    --Дата рождения
    date_birth VARCHAR(16) NOT NULL,
    --Вероисповедание
    religion VARCHAR(64) NOT NULL,
    --Происхождение
    origin VARCHAR(64) NOT NULL,
    --Уровень образования
    level_education VARCHAR(64) NOT NULL,
    --Учебное учреждение
    educational_institution VARCHAR(64) NOT NULL,
    --Расположение учебного учреждения
    location_educational_institution VARCHAR(64) NOT NULL,
    --Имущество
    property TEXT NOT NULL,
    --Награды
    awards TEXT NOT NULL,
    --Жалование
    salary TEXT NOT NULL,
    --Семейное положение
    marital_status TEXT NOT NULL,
    --Отпуска, отставки, штрафы, суды, военные походы
    other TEXT NOT NULL
);
--Деятельность
create TABLE activity(
    --Уникальный номер
    id SERIAL NOT NULL PRIMARY KEY,
    --Уникальный номер Личности
    person_id SERIAL NOT NULL,
    --Название деятельности
    name VARCHAR(32) NOT NULL,
    --Описание деятельности
    description TEXT NOT NULL,
    --Место деятельности
    place VARCHAR(64) NOT NULL,
    FOREIGN KEY (person_id) REFERENCES person (id)
);
--Карьера
create TABLE career(
    --Уникальный номер
    id SERIAL NOT NULL PRIMARY KEY,
    --Уникальный номер Личности
    person_id SERIAL NOT NULL,
    --Дата начала
    start_date VARCHAR(16),
    --Дата окончания
    end_date VARCHAR(16),
    --Должность
    post VARCHAR(128),
    --Место работы
    place VARCHAR(255),
    FOREIGN KEY (person_id) REFERENCES person (id)
);
--Чин
create TABLE rank(
    --Уникальный номер
    id SERIAL NOT NULL PRIMARY KEY,
    --Уникальный номер Личности
    person_id SERIAL NOT NULL,
    --Дата начала
    start_date VARCHAR(16),
    --Дата окончания
    end_date VARCHAR(16),
    --Степень
    degree VARCHAR(16),
    --Название
    name VARCHAR(255),
    FOREIGN KEY (person_id) REFERENCES person (id)
);