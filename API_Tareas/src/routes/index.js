const { Router } = require('express');
const router = Router();

const { getTareas, getTareasById, createTareas, deletedTareas, updateTareas } = require('../Controllers/index.controller')

router.get('/tareas', getTareas);
router.get('/tareas/:id', getTareasById);
router.post('/tareas', createTareas);
router.delete('/tareas/:id', deletedTareas);
router.put('/tareas/:id', updateTareas);

module.exports = router;