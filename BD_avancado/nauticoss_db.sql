-- BD relacional para o domínio de locação de veículos náuticos

CREATE TABLE Tipos_Veiculos (
    codTipo SERIAL,
    descricao VARCHAR(25),
    PRIMARY KEY (codTipo)
);

CREATE TABLE Habilitacoes (
    codH SERIAL,
    tipo VARCHAR(25),                --????
    idade_min INT,
    descricao VARCHAR(60),
    PRIMARY KEY (codH)
);

CREATE TABLE Veiculos (
    matricula INT,      
    nome VARCHAR(30),
    modelo VARCHAR(30),
    comprimento FLOAT,
    potMotor FLOAT,
    vlDiaria FLOAT,
    codTipo INT,
    PRIMARY KEY (matricula),
    FOREIGN KEY (codTipo) REFERENCES Tipos_Veiculos(codTipo)
);


CREATE TABLE Funcionarios (
    codF SERIAL,
    nome VARCHAR(30),
    telefone VARCHAR(15),
    endereco VARCHAR(70),
    idade INT,
    salario FLOAT,
    PRIMARY KEY (codF)
);


CREATE TABLE Veiculos_Habilitacoes(
    codTipo INT,
    codH INT,
    PRIMARY KEY (codTipo, codH),
    FOREIGN KEY (codTipo) REFERENCES Tipos_Veiculos(codTipo),
    FOREIGN KEY (codH) REFERENCES Habilitacoes(codH)
);


CREATE TABLE Clientes (
    CPF VARCHAR(11),
    nome VARCHAR(30),
    endereco VARCHAR(70),
    estado_civil VARCHAR(20),
    num_filhos INT2,
    data_nasc DATE,
    telefone VARCHAR(15),
    codH INT,
    PRIMARY KEY (CPF),
    FOREIGN KEY (codH) REFERENCES Habilitacoes(codH)
);


CREATE TABLE Locacoes(
    codLoc SERIAL,
    valor FLOAT,
    inicio DATE,
    fim DATE,
    obs VARCHAR(100),
    matricula INT,
    codF INT,
    CPF VARCHAR(11),
    PRIMARY KEY(codLoc),
    FOREIGN KEY (matricula) REFERENCES Veiculos(matricula),
    FOREIGN KEY (codF) REFERENCES Funcionarios(codF),
    FOREIGN KEY (CPF) REFERENCES Clientes(CPF)
);
