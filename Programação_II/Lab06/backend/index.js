const express = require("express");
const cors = require("cors");

const database = {

    cursos: [
        { id: 1, nome: "Ciência da computação", desc: "O Curso de Ciência da Computação da UFFS é um curso que pretende, através de bases sólidas da área de computação, formar cientistas capazes de terem um papel importante em áreas da tecnologia da informação (TI), tanto na indústria quanto na academia."},
        { id: 2, nome: "Ciências sociais", desc: "O Curso de Graduação em Ciências Sociais - Bacharelado, presencial, noturno, com oferta de 30 vagas anuais, ano, tem como principal objetivo promover a sólida formação nas áreas do conhecimento das Ciências Sociais (Antropologia, Ciência Política e Sociologia), formando indivíduos com capacidade de análise crítica e encorajando-os a desenvolverem novas aptidões além do estímulo ao desenvolvimento das competências próprias de cada um"},
        {id: 3, nome: "Medicina", desc: "Curso sem descrição por ora!"}
    ],

    horarios: [ 
        {curso: 1, nome: "Algoritmos", hora:"Seg45 Sex123", fase: 1, id: 0},
        {curso: 1, nome: "Matemática C", hora:"Seg123 Ter45", fase: 1, id: 1},
        {curso: 1, nome: "Introução à Infromática", hora:"Qui123 Sex45", fase: 1, id: 2},
        {curso: 1, nome: "Introdução à Filosofia", hora:"Ter123 Qui45", fase: 1, id: 3},
        {curso: 1, nome: "Estrutura de Dados", hora:"Seg45 Sex123", fase: 2, id: 4},
        {curso: 1, nome: "Circuitos Digitais", hora:"Seg123 Ter45", fase: 2, id: 5},

        {curso: 2, nome: "Estudos Sociais I", hora:"Seg1234", fase: 1, id: 6},
        {curso: 2, nome: "Matemática A", hora:"Ter1234", fase: 1, id: 7},
        {curso: 2, nome: "Sociologia Política I", hora:"Qua1234", fase: 1, id: 8},
        {curso: 2, nome: "Introdução à Filosofia", hora:"Qui1234", fase: 1, id: 9},
        {curso: 2, nome: "Sociologia II", hora:"Seg1234", fase: 2, id: 10},
        {curso: 2, nome: "Antropologia I", hora:"Sex1234", fase: 2, id: 11},

        {curso: 3, nome: "Fisiologia I", hora:"Seg1234", fase: 1, id: 12},
        {curso: 3, nome: "Matemática c", hora:"Ter1234", fase: 1, id: 13},
        {curso: 3, nome: "Introdução ao corpo humano", hora:"Qua1234", fase: 1, id: 14},
        {curso: 3, nome: "Introdução à Filosofia", hora:"Qui1234", fase: 1, id: 15},
        {curso: 3, nome: "Fisiologia II", hora:"Seg1234", fase: 2, id: 16},
        {curso: 3, nome: "Saúde Pública I", hora:"Sex1234", fase: 2, id: 17},
    ]
};

const app = express();
app.use(cors());
app.use(express.json());

app.listen(3010, () => console.log("Servidor rodando na porta 3010."));

app.get("/", (req, res) => {
    res.send("Hello, world!");
});

app.get("/cursos", (req, res) => {
    try {
        res.json(database.cursos).status(200);
    } catch (error) {
        console.log(error);
        res.sendStatus(400);
    }
});

app.get("/horarios", (req, res) => {
    try {
        res.json(database.horarios).status(200);
    } catch (error) {
        console.log(error);
        res.sendStatus(400);
    }
});

app.post('/follow', (req, res) => {
    
    console.log("Recebi um Follow");
})

app.post('/unfollow', (req, res) => {
    
    console.log("Recebi um Unfollow");
})
