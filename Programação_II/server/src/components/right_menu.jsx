import React from "react";
import Btn_follow from "./btn_follow";

function Right_menu(){
    return(
        
        <div className="col-lg-9" id="right_menu">     
                    <h1>Horários dos cursos da UFFS - Chapecó</h1>
                    
                        <h2 id="ccr_CienComp" class="ccr_name">Ciêcia da computação</h2>
                        <Btn_follow />
                    
                        <p class="ccr_desc">O Curso de Ciência da Computação da UFFS é um curso que pretende, através de bases sólidas da área de computação, formar cientistas capazes de terem um papel importante em áreas da tecnologia da informação (TI), tanto na indústria quanto na academia.</p>
                        <h3>1º Semestre</h3>
                            <table>
                            
                                <tr>
                                    <th>CCR</th>
                                    <th>Horário</th>
                                </tr>
                                <tr>
                                    <td>Algoritmos</td>
                                    <td>Seg45 Sex123</td>
                                </tr>
                                <tr>
                                    <td>Matemática C</td>
                                    <td>Qui123 Ter45</td>
                                </tr>
                                <tr>
                                    <td>Introdução à Filosofia</td>
                                    <td>Seg123 Qui45</td>
                                </tr>
                            </table>
                        <h3>2º Semestre</h3>
                            <table>
                                <tr>
                                    <th>CCR</th>
                                    <th>Horário</th>
                                </tr>
                                <tr>
                                    <td>Estrutura de Dados</td>
                                    <td>Seg45 Sex123</td>
                                </tr>
                                <tr>
                                    <td>Programação I</td>
                                    <td>Qua123 Sex45</td>
                                </tr>
                                <tr>
                                    <td>Cálculo I</td>
                                    <td>Sex123 Qua45</td>
                                </tr>
                            </table>
                        <h3>4º Semestre</h3>
                            <table>
                                <tr>
                                    <th>CCR</th>
                                    <th>Horário</th>
                                </tr>
                                <tr>
                                    <td>Programação II</td>
                                    <td>Seg45 Sex123</td>
                                </tr>
                                <tr>
                                    <td>Banco de Dados</td>
                                    <td>Qua123 Sex45</td>
                                </tr>
                            </table>       

                            
                    <h2 id="ccr_CiencSociais" class="ccr_name">Ciências sociais</h2>
                    <Btn_follow />
                        <p class="ccr_desc">O Curso de Graduação em Ciências Sociais - Bacharelado, presencial, noturno, com oferta de 30 vagas anuais, ano, tem como principal objetivo promover a sólida formação nas áreas do conhecimento das Ciências Sociais (Antropologia, Ciência Política e Sociologia), formando indivíduos com capacidade de análise crítica e encorajando-os a desenvolverem novas aptidões além do estímulo ao desenvolvimento das competências próprias de cada um</p>
                        <h3>1º Semestre</h3>
                            <table>
                                <tr>
                                    <th>CCR</th>
                                    <th>Horário</th>
                                </tr>
                                <tr>
                                    <td>Introdução à Filosofia</td>
                                    <td>Seg1234</td>
                                </tr>
                                <tr>
                                    <td>Estudos sociais I</td>
                                    <td>Sex 1234</td>
                                </tr>
                            </table>
                        <h3>2º Semestre</h3>
                            <table>
                                <tr>
                                    <th>CCR</th>
                                    <th>Horário</th>
                                </tr>
                                <tr>
                                    <td>Socioloia I</td>
                                    <td>Seg1234</td>
                                </tr>
                                <tr>
                                    <td>Estudos sociais II</td>
                                    <td>Qui1234</td>
                                </tr>
                                <tr>
                                    <td>Teoria Política I</td>
                                    <td>Qua1234</td>
                                </tr>
                            </table>
                        <h3>3º Semestre</h3>
                            <table>
                                <tr>
                                    <th>CCR</th>
                                    <th>Horário</th>
                                </tr>
                                <tr>
                                    <td>Sociologia II</td>
                                    <td>Te1234</td>
                                </tr>
                                <tr>
                                    <td>Antropologia II</td>
                                    <td>Sex1234</td>
                                </tr>
                                <tr>
                                    <td>Iniciação à Prática Científica</td>
                                    <td>Qua1234</td>
                                </tr>
                            </table>
            </div>
    )
}

export default Right_menu;