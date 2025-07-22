const { Pool } = require('pg');

const pool = new Pool({
    host: 'localhost',
    user: 'postgres',
    password: '1234',
    database: 'api_tareas',
    port: '5432'
});

const getTareas = async (req, res) => {
    const response = await pool.query('SELECT * FROM tareas');
    res.status(200).json(response.rows);
};

const getTareasById = async (req, res) => {
    const id = req.params.id;
    const response = await pool.query('SELECT * FROM tareas WHERE idTarea = $1', [id]);
    res.json(response.rows);
};

const createTareas = async (req, res) => {
    const{ idTarea, titulo, descripcion, completado, fechaCreacion } = req.body;
    const response = await pool.query('INSERT INTO tareas (idTarea, titulo, descripcion, completado, fechaCreacion) VALUES ($1, $2, $3, $4, $5)', [idTarea, titulo, descripcion, completado, fechaCreacion]);
    console.log(response);
    res.json({
        message: "User Addes Succesfully",
        body: {
            user: {idTarea, titulo, descripcion, completado, fechaCreacion}
        }
    })
};

const deletedTareas = async (req, res) => {
    const id = req.params.id;
    const response = await pool.query('DELETE FROM tareas WHERE idTarea = $1', [id]);
    console.log(response);
    res.json('User deleted succesfully');
};

const updateTareas = async (req, res) => {
    const id = req.params.id;
    const{ completado } = req.body;
    const response = await pool.query('UPDATE tareas SET completado = $1 WHERE idTarea = $2', 
        [   
            completado,
            id
        ]);
    console.log(response);
    res.json('User Update Succesfully')
};

module.exports = {
    getTareas,
    getTareasById,
    createTareas,
    deletedTareas,
    updateTareas
}