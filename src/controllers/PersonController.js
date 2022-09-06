const database = require('../entities/DataBase');

class PersonController {
    async createPerson(req, res) {
        console.log(req.body);
        const { name, surname } = req.body;
        const newPerson = await database.query('INSERT INTO test (name, surname) values ($1, $2) RETURNING *', [name, surname]);
        console.log(name, surname);
        res.json(newPerson.rows[0]);
    }

    async getPersons(req, res) {
        
    }

    async getPerson(req, res) {

    }

    async updatePerson(req, res) {

    }

    async deletePerson(req, res) {

    }
}

module.exports = new PersonController();