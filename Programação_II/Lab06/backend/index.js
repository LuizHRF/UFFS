const express = require("express");
const cors = require("cors");

const database = {

    cursos: [
        { id: 1, nome: "Ciência da computação",},
        { id: 2, nome: "Ciências sociais"},
    ],

    horarios: [
        {curso: 1, nome: "Algoritmos", hora:"Seg45 Sex123", fase: 1},
        {curso: 1, nome: "Matemática C", hora:"Seg123 Ter45", fase: 1},
        {curso: 1, nome: "Introução à Infromática", hora:"Qui123 Sex45", fase: 1},
        {curso: 1, nome: "Introdução à Filosofia", hora:"Ter123 Qui45", fase: 1},
        {curso: 1, nome: "Estrutura de Dados", hora:"Seg45 Sex123", fase: 2},
        {curso: 1, nome: "Circuitos Digitais", hora:"Seg123 Ter45", fase: 2},
        {curso: 2, nome: "Estudos Sociais I", hora:"Seg1234", fase: 1},
        {curso: 2, nome: "Matemática A", hora:"Ter1234", fase: 1},
        {curso: 2, nome: "Sociologia Política I", hora:"Qua1234", fase: 1},
        {curso: 2, nome: "Introdução à Filosofia", hora:"Qui1234", fase: 1},
        {curso: 2, nome: "Sociologia II", hora:"Seg1234", fase: 2},
        {curso: 2, nome: "Antropologia I", hora:"Sex1234", fase: 2},
    ]
};

const app = express();
app.use(cors());
app.use(express.json());

app.listen(3010, () => console.log("Servidor rodando na porta 3010."));

app.get("/", (req, res) => {
    res.send("Hello, world!");
});

app.get("/clientes", (req, res) => {
    try {
        res.json(database.clientes).status(200);
    } catch (error) {
        console.log(error);
        res.sendStatus(400);
    }
});

app.get("/cliente", (req, res) => {
    try {
        const clienteId = parseInt(req.query.id);
        console.log(`Retornando ID: ${clienteId}`);
        res.json(database.clientes[clienteId - 1]).status(200);
    } catch (error) {
        console.log(error);
        res.sendStatus(400);
    }
});
