import React from "react";
import Cabecalho from "./cabecalho";
import Left_menu from "./left_menu";
import Right_menu from "./right_menu";
import Rodape from "./rodape";

function Page(){
    return (
        <div class="container-sm">

            <div class="row">

                <Cabecalho />
                
            </div>

            <div class="row">

                <Left_menu />

                <Right_menu />

            </div>

            <div class="row">

                <Rodape />
                
            </div>

        </div>
    );
}

export default Page;