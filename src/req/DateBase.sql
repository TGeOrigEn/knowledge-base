--Личность
create TABLE Person(
    --Уникальный номер
    ID SERIAL NOT NULL PRIMARY KEY,
    --Фамилия
    Surname VARCHAR(32) NOT NULL,
    --Имя
    Name VARCHAR(32) NOT NULL,
    --Отчество
    Patronymic VARCHAR(32) NOT NULL,
    --Дата рождения
    DateBirth VARCHAR(16) NOT NULL,
    --Вероисповедание
    Religion VARCHAR(64) NOT NULL,
    --Происхождение
    Origin VARCHAR(64) NOT NULL,
    --Уровень образования
    LevelEducation VARCHAR(64) NOT NULL,
    --Учебное учреждение
    EducationalInstitution VARCHAR(64) NOT NULL,
    --Расположение учебного учреждения
    LocationEducationalInstitution VARCHAR(64) NOT NULL,
    --Имущество
    Property TEXT NOT NULL,
    --Награды
    Awards TEXT NOT NULL,
    --Жалование
    Salary TEXT NOT NULL,
    --Семейное положение
    MaritalStatus TEXT NOT NULL,
    --Отпуска, отставки, штрафы, суды, военные походы
    Other TEXT NOT NULL
);
--Деятельность
create TABLE Activity(
    --Уникальный номер
    ID SERIAL NOT NULL PRIMARY KEY,
    --Уникальный номер Личности
    PersonID SERIAL NOT NULL,
    --Название деятельности
    Name VARCHAR(32) NOT NULL,
    --Описание деятельности
    Description TEXT NOT NULL,
    --Место деятельности
    Place VARCHAR(64) NOT NULL,
    FOREIGN KEY (PersonID) REFERENCES Person (ID)
);
--Карьера
create TABLE Career(
    --Уникальный номер
    ID SERIAL NOT NULL PRIMARY KEY,
    --Уникальный номер Личности
    PersonID SERIAL NOT NULL,
    --Дата начала
    StartDate VARCHAR(16),
    --Дата окончания
    EndDate VARCHAR(16),
    --Должность
    Post VARCHAR(128),
    --Место работы
    Place VARCHAR(255),
    FOREIGN KEY (PersonID) REFERENCES Person (ID)
);
--Чин
create TABLE Rank(
    --Уникальный номер
    ID SERIAL NOT NULL PRIMARY KEY,
    --Уникальный номер Личности
    PersonID SERIAL NOT NULL,
    --Дата начала
    StartDate VARCHAR(16),
    --Дата окончания
    EndDate VARCHAR(16),
    --Степень
    Degree VARCHAR(8),
    --Название
    Name VARCHAR(255),
    FOREIGN KEY (PersonID) REFERENCES Person (ID)
);