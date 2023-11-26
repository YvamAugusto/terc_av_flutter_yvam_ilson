const http = require('http')
const cors = require('cors')
const express = require('express')
const app = express()
app.use(cors())
app.use(express.json())
const db = require('./database/connection.js')

http.createServer(app).listen(8080, () => {
    console.log('Servidor rodando na porta 8080')
})

app.get('/', (req, res) => {
    res.json('TESTE API NODE-POSTGRESQL!');
})

app.get('/musicas', (req, res) => {
    db.query(`SELECT mus.id, mus.nome, mus.album, mus.autor, mus.genero, mus.ano, mus.duracao 
                FROM musicas mus ORDER BY mus.id DESC`, (err, result) => {
        if (err) {
            console.error(err);
        } else {
            res.status(200).json(result.rows);
        }
        console.log('passou aqui');
    })
})

app.post('/musicas', (req, res) => {
    const musica = req.body;
    db.query(`INSERT INTO musicas(nome, album, autor, genero, ano, duracao) VALUES('${musica.nome}', '${musica.album}', 
                '${musica.autor}', '${musica.genero}', '${musica.ano}', '${musica.duracao}')`, (err, result) => {
        if (err) {
            console.error(err);
        } else {
            res.status(200).json(`Música cadastradas com sucesso!`);
        }
    })
})

app.put('/musicas/:codigoMusica', (req, res) => {
    const musica = req.body;
    db.query(`UPDATE musicas SET nome = '${musica.nome}', album = '${musica.album}', autor = '${musica.autor}', genero = '${musica.genero}',
                 ano = '${musica.ano}', duracao = '${musica.duracao}' WHERE id = ${req.params.codigoMusica}`, (err, result) => {
        if (err) {
            console.error(err);
        } else {
            res.status(200).json(`As informações da música foram atualizadas com sucesso!`);
        }
    })
})

app.delete('/musicas/:codigoMusica', (req, res) => {
    db.query(`DELETE FROM musicas WHERE id = ${req.params.codigoMusica}`, (err, result) => {
        if (err) {
            console.error(err);
        } else {
            res.status(200).json(`Música deletada com sucesso!`);
        }
    })
})