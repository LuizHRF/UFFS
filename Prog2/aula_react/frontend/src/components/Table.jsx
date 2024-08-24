import React from "react";
import { DataGrid } from "@mui/x-data-grid"

const colunas = [
    {field: "id", headerName: "ID", width: "90"},
    {field: "nome", headeName: "Nome", flex:1},
    {field: "email", headerName: "E-mail", flex: 1} 
];

function Table(Props){
    
    return(
        <DataGrid rows={Props.clientes} columns={colunas} />
    )

}

export default Table;