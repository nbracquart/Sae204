DROP SCHEMA IF EXISTS parcoursup CASCADE;

CREATE SCHEMA parcoursup;

CREATE TABLE Formation(
   cod_aff_form VARCHAR(255) PRIMARY KEY,
   filiere_libelle_detaille VARCHAR(255) NOT NULL,
   coordonnees_gps VARCHAR(255) NOT NULL,
   list_com VARCHAR(255) NOT NULL,
   concours_communs_banque_epreuve VARCHAR(255) NOT NULL,
   url_formation VARCHAR(255) NOT NULL,
   tri VARCHAR(255) NOT NULL
);

CREATE TABLE Departement(
   departement_code VARCHAR(255) PRIMARY KEY,
   departement_nom VARCHAR(255) NOT NULL
);

CREATE TABLE Commune(
   commune_nom VARCHAR(255) PRIMARY KEY
);

CREATE TABLE Filiere(
   filiere_id INTEGER PRIMARY KEY,
   filiere_libelle VARCHAR(255) NOT NULL,
   filiere_libelle_tres_abrege VARCHAR(255) NOT NULL,
   filiere_libelle_abrege VARCHAR(255) NOT NULL,
   filiere_libelle_detaille_bus VARCHAR(255) NOT NULL
);

CREATE TABLE Admissions_generalites(
   selectivite VARCHAR(255) NOT NULL,
   capacite INTEGER NOT NULL,
   effectif_total_candidats INTEGER NOT NULL,
   effectif_total_candidates INTEGER NOT NULL
);

CREATE TABLE Mention_bac(
   libelle_mention VARCHAR(255) NOT NULL
);

CREATE TABLE Admissions_selon_type_neo_bac(
   effectif_candidat_neo_bac_classes INTEGER PRIMARY KEY
);


CREATE TABLE Etablissement(
   etablissement_code_uai VARCHAR(50) PRIMARY KEY,
   etablissement_nom VARCHAR(50) NOT NULL,
   etablissement_statut VARCHAR(50) NOT NULL
);

CREATE TABLE Academie(
   academie_nom VARCHAR(50) PRIMARY KEY
);

CREATE TABLE Type_bac(
   type_bac VARCHAR(50) PRIMARY KEY
);

CREATE TABLE Region(
   region_nom VARCHAR(50) PRIMARY KEY
);

CREATE TABLE Session(
   session_annee INTEGER PRIMARY KEY
);

CREATE TABLE Regroupement(
   libelle_regroupement VARCHAR(50) PRIMARY KEY
);

CREATE TABLE rang_dernier_appele_selon_regroupement(
   rang_dernier_appele INTEGER NOT NULL
);

CREATE TABLE effectif_selon_mention(
   effectif_admis_neo_bac_selon_mention INTEGER NOT NULL
);


/* ça marche */
insert into _region(region_nom) select distinct region_nom from import_data; 

insert into _session(session_annee) select distinct session_annee from import_data;

insert into _academie(academie_nom) select distinct academie_nom from import_data;

/* marche pas */
insert into _mention_bac(libelle_mention) select distinct libelle_mention from import_data;

insert into _type_bac(type_bac) select distinct type_bac from import_data;

insert into _regroupement(libelle_regroupement) select distinct libelle_regroupement from import_data;

insert into _admissions_generalites(cod_aff_form,session_annee,selectivite,capacite,effectif_total_candidats,effectif_total_candidates) select distinct cod_aff_form,session_annee,selectivite,capacite,effectif_total_candidats,effectif_total_candidates from import_data;
