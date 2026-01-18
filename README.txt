# 📚 BookFlow — Système de Gestion de Librairie (SITD)
## 📖 Présentation du Projet
**BookFlow** est une infrastructure de base de données relationnelle avancée conçue pour la gestion d'une librairie moderne. Ce projet a été réalisé dans le cadre du module **Bases de Données** de la licence **SITD (Systèmes d'Information et Transformation Digitale)** à la FST de Settat.

L'objectif est de démontrer la maîtrise du cycle de vie de la donnée : de la modélisation conceptuelle à l'optimisation des performances et la sécurisation des accès.

## 🏗️ Piliers de l'Architecture
Le système repose sur trois piliers fondamentaux étudiés durant le module :
1. **Modélisation Robuste** : Architecture en **3ème Forme Normale (3NF)** pour garantir l'intégrité et éliminer la redondance.
2. **Intelligence Métier** : Logique embarquée via des **Procédures Stockées** et des **Triggers** (gestion des quotas d'emprunt et automatisation des stocks).
3. **Gouvernance & Sécurité** : Contrôle d'accès basé sur les rôles (**RBAC**).

## 📂 Inventaire des Livrables & Ordre d'Exécution
Pour reconstruire l'environnement complet et respecter les contraintes d'intégrité (Clés étrangères), veuillez exécuter les scripts dans l'ordre numérique suivant :

### 🛠️ Scripts SQL (Moteur de Données)
| Ordre | Fichier | Rôle Technique |
| **1** | `01_Schema_Creation.sql` | **DDL** : Création de la structure, des tables et des contraintes. |
| **2** | `02_Business_Logic.sql` | **Intelligence** : Procédures stockées (`sp_effectuer_emprunt`) et Triggers. |
| **3** | `03_Security_RBAC.sql` | **Sécurité** : Configuration des rôles (`admin`, `bibliothecaire`, `lecteur`). |
| **4** | `04_Optimizations.sql` | **Performance** : Indexation **B-Tree** stratégique. |
| **5** | `05_Sample_Data.sql` | **Validation** : Jeu de données de test et scénarios réels. |

### 📄 Documentation & Synthèse
* **`00.Fiche_Synthese_SITD_Yasser_Sidane.pdf`** : Résumé exécutif du projet (À lire en priorité).
* **`01.Cours_BDD_Yasser_Sidane_GRP3B.pdf`** : Support théorique approfondi (99 pages).
* **`02.Compte_Rendu_BookFlow_Yasser_Sidane.pdf`** : Rapport technique de conception.

---

## 🎙️ Innovation & Multimédia
Pour illustrer la dimension **Transformation Digitale**, le projet inclut :
* 🎬 **Vidéo de Démonstration** : Présentation du fonctionnement du système (`Presentation_SQL_Yasser_Sidane.mp4`).
* 🎙️ **Podcast d'Expertise** : Analyse des enjeux stratégiques de la donnée (`Expertise_Architecture_Donnees_Yasser_Sidane.m4a`).

> 🔗 Accéder au dossier complet sur Google Drive** : 


## 🧪 Test de Validation
Une fois les scripts exécutés, vous pouvez tester la logique métier (quota de 5 livres maximum par adhérent) avec cette commande :
