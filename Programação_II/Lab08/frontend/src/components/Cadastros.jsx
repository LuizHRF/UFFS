import React from "react";
import axios from "axios";

import { Alert, Box, Button, Snackbar, Stack, TextField } from "@mui/material";
import { DataGrid } from "@mui/x-data-grid";

function Cadastros() {

    const [nome, setNome] = React.useState("");
    const [id, setId] = React.useState("");
    const [desc, setDesc] = React.useState("");

    const [openMessage, setOpenMessage] = React.useState(false);
    const [messageText, setMessageText] = React.useState("");
    const [messageSeverity, setMessageSeverity] = React.useState("success");

    const [listaCursos, setListaCursos] = React.useState([]);

    React.useEffect(() => {
        getData();
    }, []);

    async function getData() {
        try {
            const res = await axios.get("/cursos");
            setListaCursos(res.data);
            //console.log(res.data);
        } catch (error) {
            setListaCursos([]);
        }
    }

    function clearForm() {
        setNome("");
        setId("");
        setDesc("");
    }

    function handleCancelClick() {
        if (nome !== "" || id !== "" || desc !== "") {
            setMessageText("Cadastro de curso cancelado!");
            setMessageSeverity("warning");
            setOpenMessage(true);
        }
        clearForm();
    }

    async function handleSubmit() {
        if (nome !== "" || id !== "" || desc !== "") {
            try {
                await axios.post("/cursos", {
                    nome: nome,
                    desc: desc,
                    id: id,
                });
                
                setMessageText("Curso cadastrado com sucesso!");
                setMessageSeverity("success");
                clearForm(); // limpa o formulário apenas se cadastrado com sucesso
            } catch (error) {
                console.log(error);
                setMessageText("Falha no cadastro do curso!");
                setMessageSeverity("error");
            } finally {
                setOpenMessage(true);
                await getData();
            }
        } else {
            setMessageText("Dados de Curso inválidos!");
            setMessageSeverity("warning");
            setOpenMessage(true);
        }
    }

    function handleCloseMessage(_, reason) {
        if (reason === "clickaway") {
            return;
        }
        setOpenMessage(false);
    }

    return (
        <Box>
            <Stack spacing={2}>
                <Stack spacing={2}>
                    <TextField
                        required
                        id="nome-input"
                        label="Nome"
                        size="small"
                        onChange={(e) => setNome(e.target.value)}
                        value={nome}
                    />
                    <TextField
                        required
                        id="id-input"
                        label="ID do curso"
                        size="small"
                        onChange={(e) => setId(e.target.value)}
                        value={id}
                    />
                    <TextField
                        required
                        id="desc-input"
                        label="Descrição do curso"
                        size="small"
                        onChange={(e) => setDesc(e.target.value)}
                        value={desc}
                    />
                </Stack>
                <Stack direction="row" spacing={3}>
                    <Button
                        variant="contained"
                        style={{
                            maxWidth: "100px",
                            minWidth: "100px",
                        }}
                        onClick={handleSubmit}
                        type="submit"
                        color="primary"
                    >
                        Enviar
                    </Button>
                    <Button
                        variant="outlined"
                        style={{
                            maxWidth: "100px",
                            minWidth: "100px",
                        }}
                        onClick={handleCancelClick}
                        color="error"
                    >
                        Cancelar
                    </Button>
                </Stack>

                <Snackbar
                    open={openMessage}
                    autoHideDuration={6000}
                    onClose={handleCloseMessage}
                >
                    <Alert
                        severity={messageSeverity}
                        onClose={handleCloseMessage}
                    >
                        {messageText}
                    </Alert>
                </Snackbar>
                
            </Stack>
        </Box>
    );
}

export default Cadastros;
