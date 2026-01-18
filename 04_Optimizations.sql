USE BookFlow_DB;

-- Indexation du titre pour les recherches catalogue
CREATE INDEX idx_livre_titre ON LIVRE(Titre);

-- Indexation de l'email pour l'authentification rapide
CREATE INDEX idx_adherent_email ON ADHERENT(Email);

-- Index composite pour optimiser le suivi des emprunts non rendus
CREATE INDEX idx_emprunt_actif ON EMPRUNTER(Id_Adherent, Date_Retour_Effectif);