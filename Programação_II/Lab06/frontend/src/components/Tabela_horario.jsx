import React from "react";
import { DataGrid } from "@mui/x-data-grid"

const colunas = [
    {field: "nome", headerName: "Nome", flex: 1},
    {field: "hora", headerName: "Horário", flex:1},
    //{field: "id", headerName: "ID", with: "10"},
    {field: "fase", headerName: "Fase", with: "15"}
];  

function Tabela_horario(Props){

    return(
        <DataGrid autoHeight rows={Props.horarios} columns={colunas} />
    )
}

export default Tabela_horario;