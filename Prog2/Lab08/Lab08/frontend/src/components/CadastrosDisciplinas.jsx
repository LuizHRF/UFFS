import React from "react";
import axios from "axios";

import InputLabel from '@mui/material/InputLabel';
import MenuItem from '@mui/material/MenuItem';
import FormControl from '@mui/material/FormControl';
import Select from '@mui/material/Select';

import { Alert, Box, Button, Snackbar, Stack, TextField } from "@mui/material";


function CadastrosDisciplinas() {

    const [nome, setNome] = React.useState("");
    const [idd, setIdd] = React.useState("");
    const [fase, setFase] = React.useState("");
    const [idh, setIdh] = React.useState("");
    const [idc, setIdc] = React.useState("");

    const [openMessage, setOpenMessage] = React.useState(false);
    const [messageText, setMessageText] = React.useState("");
    const [messageSeverity, setMessageSeverity] = React.useState("success");

    const [listaCursos, setListaCursos] = React.useState([]);
    const [listaHorarios, setListaHorarios] = React.useState([]);

    React.useEffect(() => {
        getData();
    }, []);

    async function getData() {
        try {
            const res = await axios.get("/cursos");
            console.log(res.data);
            setListaCursos(res.data);

            const res2 = await axios.get("/horarios2");
            setListaHorarios(res2.data);
            //console.log(res.data);
        } catch (error) {
            setListaCursos([]);
            setListaHorarios([]);
        }
    }

    function clearForm() {
        setNome("");
        setIdd("");
        setFase("");
        setIdc("");
        setIdh("");
    }

    function handleCancelClick() {
        if (nome !== "") {
            setMessageText("Cadastro de curso cancelado!");
            setMessageSeverity("warning");
            setOpenMessage(true);
        }
        clearForm();
    }

    const handleChange = (event) => {
        setIdc(event.target.value);
    };

    async function handleSubmit() {
        if (nome !== "") {
            try {
                await axios.post("/cursos", {
                    nome: nome,
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

    function renderCursos() {
        const acc;
        listaCursos.map((curso) => {
            acc.push(<MenuItem key={curso.id} value={curso.id}>{curso.nome}</MenuItem>)  
        })
        return acc;
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
                        label="ID da disciplina"
                        size="small"
                        onChange={(e) => setIdd(e.target.value)}
                        value={idd}
                    />
                    <TextField
                        required
                        id="desc-input"
                        label="Fase"
                        size="small"
                        onChange={(e) => setFase(e.target.value)}
                        value={fase}
                    />
                    <FormControl fullWidth>
                        <InputLabel id="select-curso">Curso</InputLabel>
                        <Select
                            labelId="select-curso"
                            id="select-curso-id"
                            value={idc}
                            label="Curso"
                            onChange={handleChange}
                            >
                            {renderCursos}
                        </Select>
                     </FormControl>
                    
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

export default CadastrosDisciplinas;
