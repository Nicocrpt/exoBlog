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
    date_comment DATE DEFAULT CURRENT_TIMESTAMP,
    auteur VARCHAR(100) NOT NULL,
    contenu VARCHAR(200) NOT NULL,
    id_post INT NOT NULL,
    FOREIGN KEY (id_post) REFERENCES post(id)
);

INSERT INTO post (titre, contenu) VALUES
('Le message', 'Hello_world');

INSERT INTO commentaires (auteur, contenu, id_post) VALUES
('Pierre', 'Pas ouf', 1);

SELECT auteur, commentaires.contenu AS commentaire, titre AS post FROM commentaires JOIN post ON commentaires.id_post = post.id ;

