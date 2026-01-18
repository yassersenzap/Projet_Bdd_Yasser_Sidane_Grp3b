========================================================================
PROJET : BookFlow - Système de Gestion de Librairie
MODULE : Bases de Données
FILIÈRE : LST - Système d’Information et Transformation Digitale (SITD)
ÉTUDIANT : Yasser Sidane
FST Settat - Université Hassan 1er
ENCADRANT : M. Lakhdissi
========================================================================

- DESCRIPTION DU PROJET 
BookFlow est un moteur de base de données relationnelle conçu pour gérer 
le cycle de vie complet d'une librairie moderne. Ce projet met en œuvre 
des concepts avancés d'ingénierie de données : intégrité transactionnelle 
(ACID), sécurité RBAC, optimisation par indexation B-Tree et logique métier 
embarquée via des procédures stockées et triggers.

- DOCUMENTATION JOINTE
L'analyse théorique complète, incluant la modélisation (3NF), l'étude des 
performances, les architectures NoSQL, Cloud DBaaS et Big Data, se trouve 
dans le document : 
"Cours BDD Yasser Sidane.pdf" (99 pages).

- STRUCTURE DES SCRIPTS SQL 
Pour garantir le respect des contraintes d'intégrité (Clés étrangères), 
les scripts doivent être exécutés dans l'ordre numérique suivant :

01_Schema_Creation.sql  : Création de la base et des tables (Normalisation 3NF).
02_Business_Logic.sql   : Procédures stockées et Triggers (Intelligence métier).
03_Security_RBAC.sql    : Gestion des rôles et des privilèges (Gouvernance).
04_Optimizations.sql    : Création des index pour la performance (B-Tree).
05_Sample_Data.sql      : Jeu de données réel et scénarios de test.

- INSTRUCTIONS D'INSTALLATION 
1. Ouvrez votre environnement MySQL (MySQL Workbench ou CLI).
2. Créez une nouvelle connexion ou utilisez l'instance locale.
3. Exécutez les fichiers un par un dans l'ordre (01 à 05) :
   Exemple en ligne de commande : 
   mysql> source 01_Schema_Creation.sql;
   ... (jusqu'au 05)

- VÉRIFICATION DU FONCTIONNEMENT 
Une fois l'installation terminée, vous pouvez tester la logique métier 
de sécurité (quota de 5 livres maximum par adhérent) avec la commande :

   CALL sp_effectuer_emprunt(1, 1);

Cela valide simultanément la procédure de vérification, la mise à jour 
du stock et la création du prêt dans la table EMPRUNTER.

- ARCHITECTURE TECHNIQUE 
- SGBD cible : MySQL 8.0+
- Modélisation : 3ème Forme Normale (3NF)
- Sécurité : Role-Based Access Control (RBAC)
- Performance : Optimisation des requêtes via Indexation B-Tree.

Année Universitaire : 2025 - 2026