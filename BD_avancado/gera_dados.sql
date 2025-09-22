--==========================================
-- Atvidade sobre funções SQL
-- Luiz Herique Rigo Faccio - 2211100003
--==========================================

CREATE OR REPLACE PROCEDURE gera_dados(n_usuarios int, n_carros int, n_funcionarios int, n_locacoes int) AS $$
BEGIN

    CALL gera_usuarios(n_usuarios);
    CALL gera_carros(n_carros);
    CALL gera_funcionarios(n_funcionarios);
    CALL gera_locacoes(n_locacoes);

END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE insere_dados_iniciais() AS $$
BEGIN

    INSERT INTO Tipos_Veiculos(codTipo, descricao) VALUES (1, 'Veleiro'), 
                                                (2, 'Jet-Ski'),
                                                (3, 'Catamaran'), 
                                                (4, 'Iate');

    INSERT INTO Habilitacoes (tipo, idade_min, descricao) VALUES 
    ('Veleiro',        8,  'Veleiro'),
    ('Motonauta',      18, 'Jet-Ski'),
    ('Arrais-Amador',  18, 'Pode dirigir todas as embarcações exceto Jet-Ski'),
    ('Mestre-Amador',  18, 'Pode dirigir todas as embarcações'),
    ('Capitão-Amador', 18, 'Pode dirigir todas as embarcações');

    INSERT INTO Veiculos_Habilitacoes (codTipo, codH) values 
		
												(1, 1),
												(1, 3),
												(1, 4),
												(1, 5),
												(2, 2),
												(3, 3),
												(3, 4),
												(3, 5),
												(4, 3),
												(4, 4),
												(4, 5);

END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE gera_usuarios(n_usuarios int) AS $$
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
        _nome := 'Cliente_' || i;
        _endereco := 'Endereço_' || i;
        _estado_civil := estados_civis[trunc(random() * array_length(estados_civis, 1) + 1)];
        _num_filhos := trunc(random() * 5);
        _data_nasc := (date '1960-01-01' + (random() * (date '2006-12-31' - date '1960-01-01'))::int);
        _telefone := '(' || 10 + (trunc(random() * 89))::INT || ') ' || lpad((trunc(random() * 99999999))::text, 8, '0');

        SELECT codH INTO _codH FROM Habilitacoes ORDER BY random() LIMIT 1;

        INSERT INTO Clientes (CPF, nome, endereco, estado_civil, num_filhos, data_nasc, telefone, codH) 
        VALUES (_CPF, _nome, _endereco, _estado_civil, _num_filhos, _data_nasc, _telefone, _codH);
    END LOOP;
    
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE gera_carros(n_carros int) AS $$
DECLARE
    _matricula INT;     
    _nome VARCHAR(30);
    _modelo VARCHAR(30);
    _comprimento FLOAT;
    _potMotor FLOAT;
    _vlDiaria FLOAT;
    _codTipo INT;  --(Ler codtipos, escolher aleatório)
    modelos VARCHAR[] := ARRAY[ 'Cutter', 'Flash 165', 'Fluvimar BR 6000', 'Sea Doo GTI 130', 'Yamaha VX 1100 Deluxe', 'VX de Luxe 2021', 'VX Cruiser 2021', 'FX SHO 2021', 'Lavezzi', 'Lipari 41', 'Ocema 42', 'Levefort 40P', 'Prestige 500', 'C38', 
                                'Prestige 500', 'Azimut 740', 'Prestige 440s', 'Prestige 500',  'C38', 'Prestige 500', 'Azimut 740', 'Prestige 440s', 'Open590'];
BEGIN

    FOR i IN 1..n_carros LOOP

        _matricula := i;
        _nome := 'Barco_' || trunc(random() * 9999)::INT;
        _modelo := modelos[trunc(random() * array_length(modelos, 1) + 1)];
        _comprimento := round((random() * 30 + 5)::numeric, 2);
        _potMotor := round((random() * 2000 + 100)::numeric, 2);
        _vlDiaria := round((random() * 7000 + 1000)::numeric, 1);

        SELECT codTipo INTO _codTipo FROM Tipos_Veiculos ORDER BY random() LIMIT 1;

        INSERT INTO Veiculos (matricula, nome, modelo, comprimento, potMotor, vlDiaria, codTipo) 
        VALUES (_matricula, _nome, _modelo, _comprimento, _potMotor, _vlDiaria, _codTipo);
    END LOOP;

END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE gera_funcionarios(n_funcionarios int) AS $$
DECLARE
    _nome VARCHAR(30);
    _telefone VARCHAR(15);
    _endereco VARCHAR(70);
    _idade INT;
    _salario FLOAT;
BEGIN

    FOR i IN 1..n_funcionarios LOOP
    _nome := 'Funcionario_' || i;
    _telefone := '(' || (10 + trunc(random() * 89))::INT || ') ' || lpad((trunc(random() * 99999999))::text, 8, '0');
    _endereco := 'Endereco_' || i;
    _idade := trunc(random() * 40 + 18);
    _salario := round((random() * 5000 + 2000)::numeric, 2);

        INSERT INTO Funcionarios (nome, telefone, endereco, idade, salario) 
        VALUES (_nome, _telefone, _endereco, _idade, _salario);
    END LOOP;

END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE gera_locacoes(n_locacoes int) AS $$
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

        _inicio := (date '2022-01-01' + (random() * (date '2022-12-31' - date '2022-01-01'))::int);
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