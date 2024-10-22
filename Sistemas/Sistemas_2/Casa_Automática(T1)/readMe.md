# Trabalho 2 - Sistemas Digitais
*Luiz Faccio - 2211100003*

Este .zip contém:

    - 1 arquivos VHDL (Main), que é utilizado no Digital para simular o funcionamento do exercício;
    - 1 arquvio .dig que é a representação do circuito no Digital;
    - Pasta (FPGA) que contém:
        -  3 arquivos VHDL, utilizados na compilação do projeto na FPGA;

A única diferença entre a representação do projeto no Digital e na FPGA é que no digital existe um estado de alerta extra, que serve para diferenciar dois alertas: 
    Quando o modo seguro foi ativado com alguma passagem aberta e
    quando o modo seguro já estava ativado e alguma passagem foi aberta depois;

Essa diferenciação não ocorre na FPGA pois quando tentei utilizar o código nela, o comportamento estava diferente do esperado - então o removi.

Além disso, a lógica das caixas da água possuem uma saída extra: estado de erro. Ela é ativada quando a entrada da caixa de água A não corresponde a nenhuma entrada descrita nos requisitos do trabalho (A = '10')

## Link para o vídeo:

[https://drive.google.com/file/d/1iNDut_Hba-r9TMhkcOgGrtGsvimU6ATw/view?usp=sharing]