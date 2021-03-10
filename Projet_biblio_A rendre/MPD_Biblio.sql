drop database Biblio;
create database Biblio;
use Biblio;


CREATE TABLE Gest_biblio(
   Titre_l VARCHAR(50),
   Etat_usure INT,
   N_abonnee INT,
   PRIMARY KEY(Titre_l)
);  

CREATE TABLE Date_l(
   Delai_emprunt DATE,
   Date_acquisition DATE,
   Date_adhesion DATE,
   PRIMARY KEY(Delai_emprunt)
);   

CREATE TABLE Abonnee(
   N_abonnee INT,
   Nom_ab VARCHAR(50),
   Prenom_ab VARCHAR(50),
   Adresse VARCHAR(50),
   N_tel VARCHAR(50),
   Date_adhesion DATE,
   Date_naissance VARCHAR(50),
   Cat_pro VARCHAR(50),
   Delai_emprunt_ VARCHAR(50),
   Titre_l VARCHAR(50) NOT NULL,
   PRIMARY KEY(N_abonnee),
   UNIQUE(Titre_l)
);   

CREATE TABLE Auteur(
   Code_auteur VARCHAR(50),
   Nom_auteur VARCHAR(50),
   Prenom_auteur VARCHAR(50),
   PRIMARY KEY(Code_auteur)
);

CREATE TABLE Editeur(
   Code_ed INT,
   Annee_ed DATE,
   Nom_ed VARCHAR(50),
   Prenom_ed VARCHAR(50)
);

CREATE TABLE Genre(
   Code_genre INT,
   Titre_l VARCHAR(50),
   PRIMARY KEY(Code_genre)
);

CREATE TABLE Mots_cle(
   Code__motsclé VARCHAR(50),
   code_catalogue INT,
   code_ed VARCHAR(50),
   PRIMARY KEY(Code__motsclé)
);   

CREATE TABLE Livres(
   Code_catalogue INT,
   Titre_l VARCHAR(50),
   Code_auteur INT,
   Code_genre INT,
   Code_rayon INT,
   Titre_l_1 VARCHAR(50),
   Code_genre_1 INT NOT NULL,
   PRIMARY KEY(Code_catalogue)
);   

CREATE TABLE Exemplaire(
   Code_rayon VARCHAR(50),
   Titre_e VARCHAR(50),
   N_abonnee VARCHAR(50),
   Etat_usure INT,
   Code_catalogue INT NOT NULL,
   Code_ed INT NOT NULL,
   Delai_emprunt DATE NOT NULL,
   PRIMARY KEY(Code_rayon),
   UNIQUE(Delai_emprunt)
);   

CREATE TABLE Concerner(
   Delai_emprunt DATE,
   N_abonnee INT,
   PRIMARY KEY(Delai_emprunt, N_abonnee)   
);   

CREATE TABLE Verifier(
   Titre_l VARCHAR(50),
   N_abonnee INT,
   PRIMARY KEY(Titre_l, N_abonnee)
);

CREATE TABLE Rediger(
   Code_catalogue INT,
   Code_auteur VARCHAR(50),
   PRIMARY KEY(Code_catalogue, Code_auteur)
);   

CREATE TABLE Rechercher(
   Code__motsclé VARCHAR(50),
   Code_catalogue INT NOT NULL,
   PRIMARY KEY(Code__motsclé)
);

CREATE TABLE Periode(
   Titre_l VARCHAR(50),
   Delai_emprunt DATE,
   PRIMARY KEY(Titre_l, Delai_emprunt)
);

ALTER TABLE Abonnee ADD FOREIGN KEY(Titre_l) REFERENCES Gest_biblio(Titre_l);
ALTER TABLE Livres ADD FOREIGN KEY(Titre_l_1) REFERENCES Gest_biblio(Titre_l);
ALTER TABLE Livres ADD FOREIGN KEY(Code_genre_1) REFERENCES Genre(Code_genre);
ALTER TABLE Exemplaire ADD FOREIGN KEY(Code_catalogue) REFERENCES Livres(Code_catalogue);
ALTER TABLE Exemplaire ADD FOREIGN KEY(Delai_emprunt) REFERENCES Date_l(Delai_emprunt);
ALTER TABLE Concerner ADD FOREIGN KEY(Delai_emprunt) REFERENCES Date_l(Delai_emprunt);
ALTER TABLE Concerner ADD FOREIGN KEY(N_abonnee) REFERENCES Abonnee(N_abonnee);
ALTER TABLE Verifier ADD FOREIGN KEY(Titre_l) REFERENCES Gest_biblio(Titre_l);
ALTER TABLE Verifier ADD FOREIGN KEY(N_abonnee) REFERENCES Abonnee(N_abonnee);
ALTER TABLE Rediger ADD FOREIGN KEY(Code_catalogue) REFERENCES Livres(Code_catalogue);
ALTER TABLE Rediger ADD FOREIGN KEY(Code_auteur) REFERENCES Auteur(Code_auteur);
ALTER TABLE Rechercher ADD FOREIGN KEY(Code__motsclé) REFERENCES Mots_cle(Code__motsclé);
ALTER TABLE Rechercher ADD FOREIGN KEY(Code_catalogue) REFERENCES Livres(Code_catalogue);
ALTER TABLE Periode ADD FOREIGN KEY (Titre_l) REFERENCES Gest_biblio(Titre_l);
ALTER TABLE Periode ADD FOREIGN KEY (Delai_emprunt) REFERENCES Date_l(Delai_emprunt);


