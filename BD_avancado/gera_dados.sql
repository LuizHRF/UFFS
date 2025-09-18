--==========================================
-- Atvidade sobre funções SQL
-- Luiz Herique Rigo Faccio - 2211100003
--==========================================

CREATE OR REPLACE FUNCTION gera_dados(n_usuarios int, n_carros int, n_funcionarios int, n_locacoes int)
RETURNS void AS $$
BEGIN

    PERFORM gera_usuarios(n_usuarios);
    PERFORM gera_carros(n_carros);
    PERFORM gera_funcionarios(n_funcionarios);
    PERFORM gera_locacoes(n_locacoes);

    RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION gera_usuarios(n_usuarios int)
RETURNS void AS $$
BEGIN
    -- CPF VARCHAR(11),
    -- nome VARCHAR(30),
    -- endereco VARCHAR(70),
    -- estado_civil VARCHAR(20),
    -- num_filhos INT2,
    -- data_nasc DATE,
    -- telefone VARCHAR(15),
    -- codH INT (Ler habilitacoes, escolher aleatório)
    RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION gera_carros(n_carros int)
RETURNS void AS $$
BEGIN

    -- matricula INT,      
    -- nome VARCHAR(30),
    -- modelo VARCHAR(30),
    -- comprimento FLOAT,
    -- potMotor FLOAT,
    -- vlDiaria FLOAT,
    -- codTipo INT (Ler codtipos, escolher aleatório)
    
    RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION gera_funcionarios(n_funcionarios int)
RETURNS void AS $$
BEGIN
    -- codF SERIAL,
    -- nome VARCHAR(30),
    -- telefone VARCHAR(15),
    -- endereco VARCHAR(70),
    -- idade INT,
    -- salario FLOAT,
    RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION gera_locacoes(n_locacoes int)
RETURNS void AS $$
BEGIN
    -- codLoc SERIAL,
    -- valor FLOAT,
    -- inicio DATE,
    -- fim DATE,
    -- obs VARCHAR(100),
    -- matricula INT (Ler carros, escolher aleatório)
    -- codF INT (Ler funcionarios, escolher aleatório)
    -- CPF VARCHAR(11) (Ler clientes, escolher aleatório)
    RETURN;
END;
$$ LANGUAGE plpgsql;


--=================================
-- Geração de dados para o banco:
--=================================

-- CREATE TABLE Tipos_Veiculos (
--     codTipo SERIAL,
--     descricao VARCHAR(25),
--     PRIMARY KEY (codTipo)
-- );

-- CREATE TABLE Habilitacoes (
--     codH SERIAL,
--     tipo VARCHAR(25),                --????
--     idade_min INT,
--     descricao VARCHAR(60),
--     PRIMARY KEY (codH)
-- );

-- CREATE TABLE Veiculos (
--     matricula INT,      
--     nome VARCHAR(30),
--     modelo VARCHAR(30),
--     comprimento FLOAT,
--     potMotor FLOAT,
--     vlDiaria FLOAT,
--     codTipo INT,
--     PRIMARY KEY (matricula),
--     FOREIGN KEY (codTipo) REFERENCES Tipos_Veiculos(codTipo)
-- );	

-- CREATE TABLE Funcionarios (
--     codF SERIAL,
--     nome VARCHAR(30),
--     telefone VARCHAR(15),
--     endereco VARCHAR(70),
--     idade INT,
--     salario FLOAT,
--     PRIMARY KEY (codF)
-- );

-- CREATE TABLE Veiculos_Habilitacoes(
--     codTipo INT,
--     codH INT,
--     PRIMARY KEY (codTipo, codH),
--     FOREIGN KEY (codTipo) REFERENCES Tipos_Veiculos(codTipo),
--     FOREIGN KEY (codH) REFERENCES Habilitacoes(codH)
-- );

-- CREATE TABLE Clientes (
--     CPF VARCHAR(11),
--     nome VARCHAR(30),
--     endereco VARCHAR(70),
--     estado_civil VARCHAR(20),
--     num_filhos INT2,
--     data_nasc DATE,
--     telefone VARCHAR(15),
--     codH INT,
--     PRIMARY KEY (CPF),
--     FOREIGN KEY (codH) REFERENCES Habilitacoes(codH)
-- );

-- CREATE TABLE Locacoes(
--     codLoc SERIAL,
--     valor FLOAT,
--     inicio DATE,
--     fim DATE,
--     obs VARCHAR(100),
--     matricula INT,
--     codF INT,
--     CPF VARCHAR(11),
--     PRIMARY KEY(codLoc),
--     FOREIGN KEY (matricula) REFERENCES Veiculos(matricula),
--     FOREIGN KEY (codF) REFERENCES Funcionarios(codF),
--     FOREIGN KEY (CPF) REFERENCES Clientes(CPF)
-- );