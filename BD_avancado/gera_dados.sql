--==========================================
-- Atvidade sobre funções SQL
-- Luiz Herique Rigo Faccio - 2211100003
--==========================================
CREATE SCHEMA faker;
CREATE EXTENSION faker SCHEMA faker CASCADE;

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
DECLARE
    _CPF VARCHAR(11);
    _nome VARCHAR(30);
    _endereco VARCHAR(70);
    _estado_civil VARCHAR(20);
    _num_filhos INT;
    _data_nasc DATE;
    _telefone VARCHAR(15);
    _codH INT;
    estados_civis VARCHAR[] := ARRAY['Solteiro', 'Casado', 'Divorciado', 'Viuvo'];
BEGIN

    FOR i IN 1..n_usuarios LOOP

        _CPF := lpad((trunc(random() * 99999999999))::text, 11, '0');
        _nome := faker.name();
        _endereco := faker.address();
        _estado_civil := estados_civis[trunc(random() * array_length(estados_civis, 1) + 1)];
        _num_filhos := trunc(random() * 5);
        _data_nasc := faker.date_between('1960-01-01', '2006-12-31');
        _telefone := faker.phone_number();   

        SELECT codH INTO _codH FROM Habilitacoes ORDER BY random() LIMIT 1;

        INSERT INTO Clientes (CPF, nome, endereco, estado_civil, num_filhos, data_nasc, telefone, codH) 
        VALUES (_CPF, _nome, _endereco, _estado_civil, _num_filhos, _data_nasc, _telefone, _codH);
    END LOOP;
    RETURN;
    
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION gera_carros(n_carros int)
RETURNS void AS $$
DECLARE
    _matricula INT;     
    _nome VARCHAR(30);
    _modelo VARCHAR(30);
    _comprimento FLOAT;
    _potMotor FLOAT;
    _vlDiaria FLOAT;
    _codTipo INT;  --(Ler codtipos, escolher aleatório)
BEGIN

    FOR i IN 1..n_carros LOOP

        _matricula := trunc(random() * 9999);
        _nome := faker.vehicle_make();
        _modelo := faker.vehicle_model();
        _comprimento := round((random() * 30 + 5)::numeric, 2);
        _potMotor := round((random() * 2000 + 100)::numeric, 2);
        _vlDiaria := round((random() * 7000 + 1000)::numeric, 1);

        SELECT codTipo INTO _codTipo FROM Tipos_Veiculos ORDER BY random() LIMIT 1;

        INSERT INTO Veiculos (matricula, nome, modelo, comprimento, potMotor, vlDiaria, codTipo) 
        VALUES (_matricula, _nome, _modelo, _comprimento, _potMotor, _vlDiaria, _codTipo);
    END LOOP;
    
    RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION gera_funcionarios(n_funcionarios int)
RETURNS void AS $$
DECLARE
    _nome VARCHAR(30);
    _telefone VARCHAR(15);
    _endereco VARCHAR(70);
    _idade INT;
    _salario FLOAT;
BEGIN

    FOR i IN 1..n_funcionarios LOOP

        _nome := faker.name();
        _telefone := faker.phone_number();
        _endereco := faker.address();
        _idade := trunc(random() * 40 + 18);
        _salario := round((random() * 5000 + 2000)::numeric, 2);

        INSERT INTO Funcionarios (nome, telefone, endereco, idade, salario) 
        VALUES (_nome, _telefone, _endereco, _idade, _salario);
    END LOOP;

    RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION gera_locacoes(n_locacoes int)
RETURNS void AS $$
DECLARE
    _valor FLOAT;
    _inicio DATE;
    _fim DATE;
    _obs VARCHAR(100);
    _matricula INT; -- (Ler carros, escolher aleatório)
    _codF INT; -- (Ler funcionarios, escolher aleatório)
    _CPF VARCHAR(11); -- (Ler clientes, escolher aleatório)
    days_diff INT;
BEGIN

    FOR i IN 1..n_locacoes LOOP

        _inicio := faker.date_between('2021-01-01', '2024-12-31');
        days_diff := trunc(random() * 15 + 1);
        _fim := _inicio + days_diff;
        _obs := 'Locação de ' || days_diff || ' dias';

        SELECT matricula, vlDiaria INTO _matricula, _valor FROM Veiculos ORDER BY random() LIMIT 1;
        _valor := _valor * days_diff;
        SELECT codF INTO _codF FROM Funcionarios ORDER BY random() LIMIT 1;
        SELECT CPF INTO _CPF FROM Clientes ORDER BY random() LIMIT 1;

        INSERT INTO Locacoes (valor, inicio, fim, obs, matricula, codF, CPF) 
        VALUES (_valor, _inicio, _fim, _obs, _matricula, _codF, _CPF);
    END LOOP;

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
--     tipo VARCHAR(25),
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