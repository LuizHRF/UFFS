import React from "react";
import Btn_follow from "./btn_follow";

function Titulo(props){

    return(
        <>
            <h2 id={props.nome} class="ccr_name">{props.nome}</h2>

            <Btn_follow />

            <p class="ccr_desc">{props.desc}</p>
                        
        </>
    )

}

export default Titulo;