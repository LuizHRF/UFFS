-- BD relacional para o domínio de locação de veículos náuticos

CREATE TABLE Tipos_Veiculos (
    codTipo SERIAL,
    descricao VARCHAR(20),
    PRIMARY KEY (codTipo)
);

CREATE TABLE Habilitacoes (
    codH SERIAL,
    tipo INT,                --????
    idade_min INT,
    descricao VARCHAR(40),
    PRIMARY KEY (codH)
);

CREATE TABLE Veiculos (
    matricula INT,          -- Talvez char?
    nome VARCHAR(25),
    modelo VARCHAR(20),
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
    estado_civil INT2,
    numero_filhos INT2,
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
    matricula INT,
    codF INT,
    CPF VARCHAR(11),
    PRIMARY KEY(codLoc),
    FOREIGN KEY (matricula) REFERENCES Veiculos(matricula),
    FOREIGN KEY (codF) REFERENCES Funcionarios(codF),
    FOREIGN KEY (CPF) REFERENCES Clientes(CPF)
);