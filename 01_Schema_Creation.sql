-- Création et utilisation de la base de données
CREATE DATABASE IF NOT EXISTS BookFlow_DB;
USE BookFlow_DB;

-- 1. Table des Auteurs
CREATE TABLE AUTEUR (
    Id_Auteur INT AUTO_INCREMENT PRIMARY KEY,
    Nom VARCHAR(100) NOT NULL,
    Nationalite VARCHAR(50)
);

-- 2. Table des Catégories
CREATE TABLE CATEGORIE (
    Id_Categorie INT AUTO_INCREMENT PRIMARY KEY,
    Libelle VARCHAR(50) NOT NULL UNIQUE
);

-- 3. Table des Livres (Le catalogue)
CREATE TABLE LIVRE (
    Id_Livre INT AUTO_INCREMENT PRIMARY KEY,
    Titre VARCHAR(255) NOT NULL,
    ISBN VARCHAR(13) UNIQUE NOT NULL,
    Annee_Publication INT,
    Id_Auteur INT,
    Id_Categorie INT,
    FOREIGN KEY (Id_Auteur) REFERENCES AUTEUR(Id_Auteur),
    FOREIGN KEY (Id_Categorie) REFERENCES CATEGORIE(Id_Categorie)
);

-- 4. Table des Adhérents (Contrainte CHECK pour l'email)
CREATE TABLE ADHERENT (
    Id_Adherent INT AUTO_INCREMENT PRIMARY KEY,
    Nom VARCHAR(100) NOT NULL,
    Prenom VARCHAR(100) NOT NULL,
    Email VARCHAR(150) UNIQUE NOT NULL,
    Date_Adhesion DATE DEFAULT (CURRENT_DATE),
    CONSTRAINT chk_email CHECK (Email LIKE '%_@__%.__%')
);

-- 5. Table des Exemplaires (Gestion du stock physique)
CREATE TABLE EXEMPLAIRE (
    Id_Exemplaire INT AUTO_INCREMENT PRIMARY KEY,
    Code_Barre VARCHAR(50) UNIQUE NOT NULL,
    Etat ENUM('Neuf', 'Bon', 'Usé', 'Abîmé') DEFAULT 'Neuf',
    Statut ENUM('Disponible', 'Indisponible', 'En maintenance') DEFAULT 'Disponible',
    Id_Livre INT,
    FOREIGN KEY (Id_Livre) REFERENCES LIVRE(Id_Livre) ON DELETE CASCADE
);

-- 6. Table des Emprunts (Historique et gestion des prêts)
CREATE TABLE EMPRUNTER (
    Id_Emprunt INT AUTO_INCREMENT PRIMARY KEY,
    Date_Emprunt DATETIME DEFAULT CURRENT_TIMESTAMP,
    Date_Retour_Prevue DATETIME NOT NULL,
    Date_Retour_Effectif DATETIME NULL,
    Id_Adherent INT,
    Id_Exemplaire INT,
    FOREIGN KEY (Id_Adherent) REFERENCES ADHERENT(Id_Adherent),
    FOREIGN KEY (Id_Exemplaire) REFERENCES EXEMPLAIRE(Id_Exemplaire)
);