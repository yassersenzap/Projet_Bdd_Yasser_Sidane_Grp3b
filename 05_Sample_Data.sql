USE BookFlow_DB;

-- Insertion d'auteurs et catégories
INSERT INTO AUTEUR (Nom, Nationalite) VALUES ('Dan Brown', 'Américain'), ('Alex Michaelides', 'Britannique');
INSERT INTO CATEGORIE (Libelle) VALUES ('Thriller'), ('Psychologique');

-- Insertion de livres et exemplaires
INSERT INTO LIVRE (Titre, ISBN, Id_Auteur, Id_Categorie) VALUES ('Origin', '9781101874127', 1, 1);
INSERT INTO EXEMPLAIRE (Code_Barre, Id_Livre, Etat) VALUES ('CB-ORIG-001', 1, 'Neuf'), ('CB-ORIG-002', 1, 'Bon');

-- Insertion d'un adhérent
INSERT INTO ADHERENT (Nom, Prenom, Email) VALUES ('Sidane', 'Yasser', 'yasser.sidane@fst.ma');

-- Test de la procédure (Lancer cette commande pour vérifier)
-- CALL sp_effectuer_emprunt(1, 1);