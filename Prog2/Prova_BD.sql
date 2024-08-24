SET DATESTYLE = 'DMY';

CREATE TABLE IF NOT EXISTS streaming(
    ids INTEGER NOT NULL,
    names VARCHAR(30) NOT NULL,
    CONSTRAINT pk_streaming PRIMARY KEY (ids)
);

CREATE TABLE IF NOT EXISTS tvshow (
    idts INTEGER NOT NULL,
    title VARCHAR(30) NOT NULL,
    daterts TIMESTAMP NOT NULL,
    ids INTEGER NOT NULL,
    CONSTRAINT pk_tvshow PRIMARY KEY (idts),
    CONSTRAINT fk_tvshow_streaming FOREIGN KEY (ids) REFERENCES streaming(ids)
);

CREATE TABLE IF NOT EXISTS season(
    idts INTEGER NOT NULL,
    idsea INTEGER NOT NULL,
    daters TIMESTAMP NOT NULL,
    CONSTRAINT pk_season PRIMARY KEY (idsea, idts),
    CONSTRAINT fk_season_tvshow FOREIGN KEY (idts) REFERENCES tvshow(idts)
);

CREATE TABLE IF NOT EXISTS people(
    idunion INTEGER NOT NULL,
    namep VARCHAR(30) NOT NULL,
    dbirth TIMESTAMP NOT NULL,
    nationality VARCHAR(20) NOT NULL,
    CONSTRAINT pk_people PRIMARY KEY (idunion)
);

CREATE TABLE IF NOT EXISTS episode(
    idts INTEGER NOT NULL,
    idsea INTEGER NOT NULL,
    idep INTEGER NOT NULL,
    titleep VARCHAR(25) NOT NULL,
    daterep TIMESTAMP NOT NULL,
    duration INTEGER NOT NULL,
    director INTEGER NOT NULL,
    CONSTRAINT pk_episode PRIMARY KEY (idts, idsea, idep),
    CONSTRAINT fk_episode_tvshow FOREIGN KEY (idsea, idts) REFERENCES season(idsea, idts),
    CONSTRAINT fk_episode_director FOREIGN KEY (director) REFERENCES people(idunion)
);

CREATE TABLE IF NOT EXISTS casts(
    idts INTEGER NOT NULL,
    idsea INTEGER NOT NULL,
    idep INTEGER NOT NULL,
    idunion INTEGER NOT NULL,
    role VARCHAR(20) NOT NULL,
    CONSTRAINT pk_cast PRIMARY KEY (idts, idsea, idunion),
    CONSTRAINT fk_cast_tvshow FOREIGN KEY (idts, idsea, idep) REFERENCES episode(idts, idsea, idep),
    CONSTRAINT fk_cast_people FOREIGN KEY (idunion) REFERENCES people(idunion)
);

INSERT INTO streaming(ids, names) VALUES
    (1, 'Netflix'),
    (2, 'Paramount'),
    (3, 'Prime Vídeo'),
    (4, 'Disney+'),
    (5, 'Globo Play');

INSERT INTO people(idunion, namep, dbirth, nationality) VALUES
    (100, 'Elicia Thad', '10-12-1985', 'Britanica'),
    (101, 'Marcelina Baker', '28-01-1995', 'Brasileira'),
    (102, 'Bruna Rhetta', '21-06-2000', 'Brasileria'),
    (104, 'Alexia Corynn', '09-03-1989', 'Russa'),
    (105, 'Eva Kae', '28-10-2001', 'Russa'),
    (106, 'Max Lorri', '08-08-1976', 'Britanica'),
    (107, 'Sky Iriney', '30-11-1969', 'Britanica'),
    (108, 'Victor Michail', '15-03-1993', 'Brasileira'),
    (109, 'Scottie Joleen', '16-12-1999', 'Britanico'),
    (110, 'Amanda Paes', '07-09-2003', 'Brasileira');

INSERT INTO tvshow(idts, title, daterts, ids) VALUES 
    (1001, 'Baking Bread', '01-06-2008', 1),
    (1002, 'Chernobyl', '15-03-2009', 1),
    (1003, 'Avatar', '16-11-2005', 5),
    (1004, 'Planeta Azul II', '12-01-2005', 2),
    (1005, 'Rick e Morty', '11-02-2013', 3),
    (1006, 'Sherlock', '25-09-2007', 4);

INSERT INTO season(idts, idsea, daters) VALUES
    (1001, 1, '09-04-2008'),
    (1001, 2, '10-005-2009'),
    (1001, 3, '09-04-2010'),
    (1001, 4, '09-04-2011'),
    (1002, 1, '17-02-2009'),
    (1002, 2, '17-02-2010'),
    (1003, 1, '17-12-2005'),
    (1003, 2, '18-01-2006'),
    (1003, 3, '17-10-2007'),
    (1004, 1, '01-04-2005'),
    (1005, 1, '23-06-2013'),
    (1005, 2, '24-07-2014'),
    (1005, 3, '25-08-2015'),
    (1006, 1, '21-05-2007'),
    (1006, 2, '21-05-2007');
    
INSERT INTO episode(idts, idsea, idep, titleep, daterep, duration, director) VALUES
    (1001, 1, 1, 'Nome_do_Episódio', '01-01-2001', 100, 101),
    (1001, 2, 2, 'Nome_do_Episódio', '01-01-2001', 100, 101),
    (1001, 3, 3, 'Nome_do_Episódio', '01-01-2001', 100, 101),
    (1001, 4, 4, 'Nome_do_Episódio', '01-01-2001', 100, 101),
    (1001, 1, 5, 'Nome_do_Episódio', '01-01-2001', 100, 101),
    (1001, 2, 6, 'Nome_do_Episódio', '01-01-2001', 100, 101),
    (1001, 3, 7, 'Nome_do_Episódio', '01-01-2001', 100, 101),
    (1001, 4, 8, 'Nome_do_Episódio', '01-01-2001', 100, 101),
    (1001, 1, 9, 'Nome_do_Episódio', '01-01-2001', 100, 101),
    (1001, 2, 10, 'Nome_do_Episódio', '01-01-2001', 100, 101),
    (1001, 3, 11, 'Nome_do_Episódio', '01-01-2001', 100, 101),

    (1002, 1, 1, 'Nome_do_Episódio', '01-01-2001', 100, 101),
    (1002, 2, 2, 'Nome_do_Episódio', '01-01-2001', 100, 101),
    (1002, 1, 3, 'Nome_do_Episódio', '01-01-2001', 100, 101),
    (1002, 2, 4, 'Nome_do_Episódio', '01-01-2001', 100, 101),
    (1002, 1, 5, 'Nome_do_Episódio', '01-01-2001', 100, 101),
    (1002, 2, 6, 'Nome_do_Episódio', '01-01-2001', 100, 101),
    (1002, 1, 7, 'Nome_do_Episódio', '01-01-2001', 100, 101),
    (1002, 2, 8, 'Nome_do_Episódio', '01-01-2001', 100, 101),
    (1002, 1, 9, 'Nome_do_Episódio', '01-01-2001', 100, 101),
    (1002, 2, 10, 'Nome_do_Episódio', '01-01-2001', 100, 101),
    (1002, 1, 11, 'Nome_do_Episódio', '01-01-2001', 100, 101),

    (1003, 1, 1, 'Nome_do_Episódio', '01-01-2001', 100, 101),
    (1003, 2, 2, 'Nome_do_Episódio', '01-01-2001', 100, 101),
    (1003, 3, 3, 'Nome_do_Episódio', '01-01-2001', 100, 101),

    (1004, 1, 1, 'Nome_do_Episódio', '01-01-2001', 100, 101),
    (1004, 1, 2, 'Nome_do_Episódio', '01-01-2001', 100, 101),
    (1004, 1, 3, 'Nome_do_Episódio', '01-01-2001', 100, 101),
    (1004, 1, 4, 'Nome_do_Episódio', '01-01-2001', 100, 101),

    (1005, 1, 1, 'Nome_do_Episódio', '01-01-2001', 100, 101),
    (1005, 2, 2, 'Nome_do_Episódio', '01-01-2001', 100, 101),
    (1005, 3, 3, 'Nome_do_Episódio', '01-01-2001', 100, 101),
    (1005, 1, 4, 'Nome_do_Episódio', '01-01-2001', 100, 101),
    (1005, 2, 5, 'Nome_do_Episódio', '01-01-2001', 100, 101),
    (1005, 3, 6, 'Nome_do_Episódio', '01-01-2001', 100, 101),
    (1005, 1, 7, 'Nome_do_Episódio', '01-01-2001', 100, 101),
    
    (1006, 1, 1, 'Nome_do_Episódio', '01-01-2001', 100, 101),
    (1006, 2, 2, 'Nome_do_Episódio', '01-01-2001', 100, 101),
    (1006, 1, 3, 'Nome_do_Episódio', '01-01-2001', 100, 101),
    (1006, 2, 4, 'Nome_do_Episódio', '01-01-2001', 100, 101);

INSERT INTO casts(idts, idsea, idep, idunion, role) VALUES
    (1001, 1, 1, 100, 'Coadjuvante'),
    (1001, 2, 6, 102, 'Protagonista'),
    (1002, 2, 4, 104, 'Protagonista'),
    (1003, 3, 3, 105, 'Coadjuvante'),
    (1004, 1, 2, 106, 'Protagonista'),
    (1004, 1, 1, 107, 'Coadjuvante'),
    (1005, 2, 5, 108, 'Protagonista');

WITH num_ep AS (SELECT ts.title, COUNT(ep.idep) as n_ep
FROM episode ep NATURAL JOIN season s
JOIN tvshow ts ON ts.idts=s.idts
GROUP BY ts.idts)
SELECT * FROM num_ep
WHERE n_ep = (SELECT MAX(n_ep) FROM num_ep);

INSERT INTO episode(idts, idsea, idep, titleep, daterep, duration, director) VALUES 
    (1001, 4, 12, 'Nome_do_Episódio', '01-01-2001', 100, 101),
    (1001, 1, 13, 'Nome_do_Episódio', '01-01-2001', 100, 101);

WITH num_ep AS (SELECT ts.title, COUNT(ep.idep) as n_ep
FROM episode ep NATURAL JOIN season s
JOIN tvshow ts ON ts.idts=s.idts
GROUP BY ts.idts)
SELECT * FROM num_ep
WHERE n_ep = (SELECT MAX(n_ep) FROM num_ep);
