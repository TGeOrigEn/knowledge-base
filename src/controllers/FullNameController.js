const database = require('../entities/DataBase');

class FullNameController {
    async get(req, res) {
        const id = req.params.id;
        const person = await database.query('SELECT * FROM full_name WHERE person_id = $1;', [id]);
        res.json(person.rows[0]);
    }

    async update(req, res) {
        const { id, person_id,   } = req.body;
        const person = await database.query('UPDATE full_name SET WHERE person_id = $1;', [id]);
        res.json(person.rows[0]);
    }
}

module.exports = new FullNameController();