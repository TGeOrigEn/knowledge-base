class Person {
    constructor(fullName, awards, salary, property, family, activity, education, career, rank) {
        this.fullName = fullName;
        this.awards = awards;
        this.salary = salary;
        this.property = property;
        this.family = family;
        this.activity = activity;
        this.education = education;
        this.career = career;
        this.rank = rank;
    }
}

class FullName {
    constructor(surname, name, patronymic, yearBirth, religion, origin) {
        this.surname = surname;
        this.name = name;
        this.patronymic = patronymic;
        this.yearBirth = yearBirth;
        this.religion = religion;
        this.origin = origin;
    }
}

class Activity {
    constructor(activity, description, place) {
        this.activity = activity;
        this.description = description;
        this.place = place;
    }
}

class Education {
    constructor(level, establishment, place) {
        this.level = level;
        this.establishment = establishment;
        this.place = place;
    }
}

class Career {
    constructor(startDate, endDate, career, place) {
        this.startDate = startDate;
        this.endDate = endDate;
        this.career = career;
        this.place = place;
    }
}

class Rank {
    constructor(startDate, endDate, degree, rank) {
        this.startDate = startDate;
        this.endDate = endDate;
        this.degree = degree;
        this.rank = rank;
    }
}

export default {Person, FullName, Activity, Education, Career, Rank }