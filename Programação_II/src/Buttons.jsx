import React from "react";
import Button from '@mui/material/Button';
import Grid from '@mui/material/Grid';

const estiloBotao = {
    color: "blue",
    heigth: "40px",
}

export default function Buttons(){
    return(
        <>

        <Button fullWidth style={estiloBotao} variant="contained">FUNÇÃO 1</Button>
        
        <Button fullWidth style={estiloBotao} variant="contained">FUNÇÃO 2</Button>

        <Button fullWidth style={estiloBotao} variant="contained">FUNÇÃO 3</Button>

        </>
    )
}