const express = require("express");
const cors = require("cors");

const pgp = require("pg-promise")({});

const usuario = "postgres";
const senha = "postgres";
const db = pgp(`postgres://${usuario}:${senha}@localhost:5432/grade_horarios`);

const app = express();
app.use(cors());
app.use(express.json());

app.listen(3010, () => console.log("Servidor rodando na porta 3010."));

app.get("/", (req, res) => {
    res.send("Hello, world!");
});

app.get("/cursos", async (req, res) => {
    try {
        const cursos = await db.any("SELECT idc as id, nome, descr as desc FROM cursos;");
        console.log('Retornando todos cursos.');
        res.json(cursos).status(200);
    } catch (error) {
        console.log(error);
        res.sendStatus(400);
    }
});

app.get("/horarios", async (req, res) => {
    try {
        const horarios = await db.any("SELECT c.idc as curso, d.nome, h.hora, d.fase, d.idd as id FROM disciplina d JOIN cursos c ON d.idc = c.idc JOIN horarios h ON h.idh = d.idh;");
        console.log('Retornando todos horários.');
        res.json(horarios).status(200);
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

app.post("/cursos", async (req, res) => {
    try {
        const cursoNome = req.body.nome;
        const cursoId = req.body.id;
        const cursoDesc  = req.body.desc;

        db.none(
            "INSERT INTO cursos (idc, nome, descr) VALUES ($1, $2, $3);",
            [cursoId, cursoNome, cursoDesc]
        );

        res.sendStatus(200);
    } catch (error) {
        console.log(error);
        res.sendStatus(400);
    }
});
