const express = require('express');
const bodyParser = require("body-parser")

const app = express();
app.use(bodyParser.json());
app.use(express.static(`${__dirname}/public`));

app.listen(3001, () => console.log("Servidor iniciado na porta 3001"));

app.get('/', (req, res) => {
    console.log("Recebi uma request GET");
    res.sendFile(`${__dirname}/index.html`);
});

app.post('/', (req, res) => {
    let nome = req.body.nome;
    console.log("Recebi uma request POST");
    res.send(`Olá ${nome}!!`);
})

//Comando para instalar dependencias: yarn install
