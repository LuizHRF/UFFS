import React from "react";

function Left_menu(){
    return(
        <div class="col-lg-3" id="left_menu">
            <h1>Cursos disponíveis:</h1>
            <ul class="list_group">
                <li class="list-group-item"><a href="#ccr_CienComp"> Ciência da Computação</a></li>
                <li class="list-group-item"><a href="#ccr_CiencSociais"> Ciências da Sociais</a></li>
            </ul>
        </div>
    );
}

export default Left_menu