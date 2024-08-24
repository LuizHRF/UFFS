import React from "react";
import axios from "axios";

axios.defaults.baseURL = "http://localhost:3010/";
axios.defaults.headers.common["Content-Type"] =
    "application/json;charset=utf-8";

function Left_menu(){

    const [listaCursos, setListaCursos] = React.useState([]);

    React.useEffect(() => {
        const res = axios.get("/cursos");
        res.then((query) => {
            setListaCursos(query.data);
            console.log(query.data);
        });
    }, []);

    return(
        <div class="col-lg-3" id="left_menu">
            <h1>Cursos disponíveis:</h1>
            <ul class="list_group">
            {listaCursos.map((curso) => {
                let cursoRef = "#" + curso.nome;
                return <li class="list-group-item"><a href={cursoRef}>{curso.nome}</a></li>
            })}
            </ul>
        </div>
    );
}

export default Left_menu