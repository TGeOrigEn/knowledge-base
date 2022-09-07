const database = require('../entities/DataBase');

class PersonController {
    async createPerson(req, res) {
        console.log(req.body);
        const { rank, career, activity, fullName, education, property, awards, salary, family } = req.body;

        const newPerson = await database.query('INSERT INTO person (property, awards, salary, family) values ($1, $2, $3, $4) RETURNING *;', [property, awards, salary, family]);

        const newFullName = await database.query('INSERT INTO full_name (id, surname, name, patronymic, yearBirth, religion, origin) ' +
            'values ($1, $2, $3, $4, $5, $6, $7) RETURNING *;', [newPerson.rows[0].id, fullName.surname, fullName.name, fullName.patronymic, fullName.yearBirth, fullName.religion, fullName.origin]);

        const newEducation = await database.query('INSERT INTO education (id, level, establishment, place) ' +
            'values ($1, $2, $3, $4) RETURNING *;', [newPerson.rows[0].id, education.level, education.establishment, education.place]);

        activity.forEach(async element => {
            await database.query('INSERT INTO activity (person_id, activity, description, place) ' +
                'values ($1, $2, $3, $4) RETURNING *;', [newPerson.rows[0].id, element.activity, element.description, element.place]);
        });

        career.forEach(async element => {
            await database.query('INSERT INTO career (person_id, startDate, endDate, career, place) ' +
                'values ($1, $2, $3, $4, $5) RETURNING *;', [newPerson.rows[0].id, element.startDate, element.endDate, element.career, element.place]);
        });

        rank.forEach(async element => {
            await database.query('INSERT INTO rank (person_id, startDate, endDate, degree, rank) ' +
                'values ($1, $2, $3, $4, $5) RETURNING *;', [newPerson.rows[0].id, element.startDate, element.endDate, element.degree, element.rank]);
        });

        await database.query('UPDATE person SET education_id = ($2) WHERE id = ($1);', [newPerson.rows[0].id, newEducation.rows[0].id]);
        await database.query('UPDATE person SET full_name_id = ($2) WHERE id = ($1);', [newPerson.rows[0].id, newFullName.rows[0].id]);

        res.json(newPerson.rows[0]);
    }

    async getPersons(req, res) {
        const persons = await database.query('SELECT * FROM person;');
        res.json(persons.rows);
    }

    async getPerson(req, res) {
        const id = req.params.id;
        console.log(id);
        const person = await database.query('SELECT * FROM person WHERE id = $1;'[id]);
        res.json(person.rows[0]);
    }

    async updatePerson(req, res) {

    }

    async deletePerson(req, res) {

    }
}

module.exports = new PersonController();