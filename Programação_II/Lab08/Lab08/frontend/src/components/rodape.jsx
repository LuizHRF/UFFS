import React from "react";
import Cadastros from "./Cadastros";
import CadastrosHorarios from "./CadastrosHorarios";
import CadastrosDisciplinas from "./CadastrosDisciplinas";

function Rodape(){
    return (
        <box>

            <div class="row">
                <div id="rodape" class="col-lg-12">
                        <h2>CADASTRO DE NOVOS CURSOS</h2>
                        <Cadastros />
                    
                </div>
            </div>
            
            <div class="row">
                <div id="rodape" class="col-lg-12">
                        <h2>CADASTRO DE NOVOS HORÁRIOS</h2>
                        <CadastrosHorarios />
                        <p>Não consegui cadastrar novas disciplinas ainda</p>
                    
                </div>
            </div>

             <div class="row">
                <div id="rodape" class="col-lg-12">
                        <h2>CADASTRO DE NOVAS DISCIPLINAS</h2>
                        <CadastrosDisciplinas />
                    
                </div>
            </div> 

        </box>
    )
}

export default Rodape;