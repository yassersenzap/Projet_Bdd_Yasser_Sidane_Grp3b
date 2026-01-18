USE BookFlow_DB;
DELIMITER //

-- Procédure : Effectuer un emprunt avec vérification de quota (Slide 97)
CREATE PROCEDURE sp_effectuer_emprunt(
    IN p_id_adherent INT, 
    IN p_id_exemplaire INT
)
BEGIN
    DECLARE v_nb_emprunts INT;
    DECLARE v_statut VARCHAR(20);

    -- 1. Vérification du statut de l'exemplaire
    SELECT Statut INTO v_statut FROM EXEMPLAIRE WHERE Id_Exemplaire = p_id_exemplaire;
    
    -- 2. Vérification du quota de l'adhérent (Max 5)
    SELECT COUNT(*) INTO v_nb_emprunts 
    FROM EMPRUNTER 
    WHERE Id_Adherent = p_id_adherent AND Date_Retour_Effectif IS NULL;

    IF v_statut != 'Disponible' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Erreur : Cet exemplaire n''est pas disponible.';
    ELSEIF v_nb_emprunts >= 5 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Erreur : Quota de 5 emprunts atteint pour cet adhérent.';
    ELSE
        -- Début de la transaction métier
        INSERT INTO EMPRUNTER (Date_Retour_Prevue, Id_Adherent, Id_Exemplaire)
        VALUES (DATE_ADD(NOW(), INTERVAL 14 DAY), p_id_adherent, p_id_exemplaire);
        
        UPDATE EXEMPLAIRE SET Statut = 'Indisponible' WHERE Id_Exemplaire = p_id_exemplaire;
    END IF;
END //

-- Trigger : Remise en disponibilité automatique lors du retour
CREATE TRIGGER tr_retour_livre
AFTER UPDATE ON EMPRUNTER
FOR EACH ROW
BEGIN
    IF OLD.Date_Retour_Effectif IS NULL AND NEW.Date_Retour_Effectif IS NOT NULL THEN
        UPDATE EXEMPLAIRE SET Statut = 'Disponible' WHERE Id_Exemplaire = NEW.Id_Exemplaire;
    END IF;
END //

DELIMITER ;