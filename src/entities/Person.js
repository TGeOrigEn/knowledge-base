export default class Person {
    constructor(fullName) {
        this.fullName = fullName;
    }
}

class FullName {
    constructor(name, patronymic, yearBirth, religion, origin) {
        this.name = name;
        this.patronymic = patronymic;
        this.yearBirth = yearBirth;
        this.religion = religion;
        this.origin = origin;
    }
}