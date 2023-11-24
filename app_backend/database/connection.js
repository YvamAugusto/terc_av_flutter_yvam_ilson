const { Pool } = require('pg');

const db = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'app-musica-autor',
    password: '12345',
    port: 5432
})

db.query('SELECT NOW()', (err, res) => {
    if (err) {
      console.error(err);
    } else {
      console.log(`Conexão estabelecida com sucesso! A hora atual do servidor é: ${res.rows[0].now}`);
    }
});

module.exports = db;