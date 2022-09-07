create TABLE full_name(
    id SERIAL PRIMARY KEY,
    surname VARCHAR(255),
    name VARCHAR(255),
    patronymic VARCHAR(255),
    yearBirth VARCHAR(255),
    religion VARCHAR(255),
    origin VARCHAR(255)
);

create TABLE education(
    id SERIAL PRIMARY KEY,
    person_id INTEGER,
    level VARCHAR(255),
    establishment VARCHAR(255),
    place VARCHAR(255)
);

create TABLE person(
    id SERIAL PRIMARY KEY,
    full_name_id INTEGER,
    education_id INTEGER,
    property TEXT,
    awards TEXT,
    salary TEXT,
    family TEXT,
    FOREIGN KEY (full_name_id) REFERENCES full_name (id),
    FOREIGN KEY (education_id) REFERENCES education (id)
);

create TABLE activity(
    id SERIAL PRIMARY KEY,
    activity VARCHAR(255),
    description VARCHAR(255),
    place VARCHAR(255),   
);



create TABLE career(
    id SERIAL PRIMARY KEY,
    person_id INTEGER,
    startDate VARCHAR(255),
    endDate VARCHAR(255),
    career VARCHAR(255),
    place VARCHAR(255),   
    FOREIGN KEY (person_id) REFERENCES person (id)
);

create TABLE rank(
    id SERIAL PRIMARY KEY,
    person_id INTEGER,
    startDate VARCHAR(255),
    endDate VARCHAR(255),
    degree VARCHAR(255),
    rank VARCHAR(255),   
    FOREIGN KEY (person_id) REFERENCES person (id)
);
