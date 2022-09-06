const Router = require('express');
const router = new Router();
const personController = require('../controllers/PersonController');

router.post('/person', personController.createPerson);
router.get('/person', personController.getPersons);
router.get('/person/:id', personController.getPerson);
router.put('/person', personController.updatePerson);
router.delete('/person/:id', personController.deletePerson);

module.exports = router;