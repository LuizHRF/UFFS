import React from "react";
import Btn_follow from "./btn_follow";

function Titulo(props){

    console.log(props.estilos.style_h2);
    return(
        <>
            <h2 id={props.nome} style={props.estilos.style_h2} >{props.nome}</h2>

            <Btn_follow />

            <p style={props.estilos.style_p} >{props.desc}</p>
                        
        </>
    )

}

export default Titulo;