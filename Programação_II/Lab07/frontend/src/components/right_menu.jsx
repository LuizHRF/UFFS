import React from "react";
import axios from "axios";
import Tabela_horario from "./Tabela_horario";
import Titulo from "./Titulo";

axios.defaults.baseURL = "http://localhost:3010/";
axios.defaults.headers.common["Content-Type"] =
    "application/json;charset=utf-8";

function Right_menu(){

    const [listaHorarios, setlistaHorarios] = React.useState([]);

    React.useEffect(() => {
        const res = axios.get("/horarios");
        res.then((query) => {
            setlistaHorarios(query.data);
            console.log(query.data);
        });
    }, []);
    
    const [listaCursos, setListaCursos] = React.useState([]);

    React.useEffect(() => {
        const res = axios.get("/cursos");
        res.then((query) => {
            setListaCursos(query.data);
            console.log(query.data);
        });
    }, []);

    let estilos = {
        style_p: {color:'rgb(105, 101, 101)'},
        style_h2: {fontStyle: 'bold', color: '#00693E', marginTop: '20px'}
    }

    console.log(estilos);

    return(
        
        <div className="col-lg-9" id="right_menu">  

                    <h1>Horários dos cursos da UFFS - Chapecó</h1>
                    { listaCursos.map((curso, index) => {
                        return (<div>
                                    <Titulo estilos={estilos} nome={curso.nome} desc={curso.desc} />
                                    <Tabela_horario horarios={listaHorarios.filter((h) => h.curso === curso.id)} />
                                </div>)
                    })}
                    

                    
        </div>
    )
}

export default Right_menu;