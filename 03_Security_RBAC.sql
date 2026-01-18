-- Création des rôles
CREATE ROLE IF NOT EXISTS 'admin_librairie', 'bibliothecaire', 'lecteur_stats';

-- Permissions Administrateur
GRANT ALL PRIVILEGES ON BookFlow_DB.* TO 'admin_librairie';

-- Permissions Bibliothécaire (Gestion opérationnelle)
GRANT SELECT, INSERT, UPDATE ON BookFlow_DB.EMPRUNTER TO 'bibliothecaire';
GRANT SELECT, UPDATE ON BookFlow_DB.EXEMPLAIRE TO 'bibliothecaire';
GRANT EXECUTE ON PROCEDURE BookFlow_DB.sp_effectuer_emprunt TO 'bibliothecaire';

-- Permissions Lecteur (Consultation catalogue)
GRANT SELECT ON BookFlow_DB.LIVRE TO 'lecteur_stats';
GRANT SELECT ON BookFlow_DB.CATEGORIE TO 'lecteur_stats';

FLUSH PRIVILEGES;