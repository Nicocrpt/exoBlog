DROP DATABASE IF EXISTS posts ;

CREATE DATABASE posts CHARACTER SET = 'utf8' COLLATE = 'utf8_general_ci' ;

USE posts ;

CREATE TABLE post(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    date_post DATETIME DEFAULT CURRENT_TIMESTAMP,
    titre VARCHAR(100) NOT NULL,
    contenu VARCHAR(400) NOT NULL
);

CREATE TABLE commentaires(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    date_comment DATETIME DEFAULT CURRENT_TIMESTAMP,
    auteur VARCHAR(100) NOT NULL,
    contenu VARCHAR(200) NOT NULL,
    id_post INT NOT NULL,
    FOREIGN KEY (id_post) REFERENCES post(id)
);

INSERT INTO post (titre, contenu) VALUES
('EQ', "Il sert à gerer le volume des differentes fréquences d'une source audio"),
('Compresseur', "Le compresseur permet d'influer sur la dynamique d'un son, pour tasser celle ci par exemple"),
('Reverb', "La reverb permet d'ajouter de la profondeur à un son, en le 'localisant' dans un espace");

INSERT INTO commentaires (auteur, contenu, id_post) VALUES
('Pierre', 'Pas ouf', 1),
('Tom', 'super (y)', 1),
('Bill', 'meh', 2),
('Laurent', 'génial', 3);

SELECT date_comment AS date, auteur, commentaires.contenu AS commentaire, titre AS post FROM commentaires JOIN post ON commentaires.id_post = post.id ;

