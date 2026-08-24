Profile: IdentifierSurvNetFileNumber
Parent: Identifier
Id: IdentifierSurvNetFileNumber
Title: "SurvNet Aktenzeichen Identifier"
Description: "SurvNet Aktenzeichen Identifier-Profil."

* ^version = "0.1.1"
* ^date = "2026-08-18"

* insert MetadataProfile

* type = $v2-0203#XX "Organization identifier"
* type MS
* type ^short = "Art des Identifiers"
* type ^definition = "Art des Identifiers, z.B. 'MR' für Medical Record Number oder 'XX' für einen Organization Identifier."
* system 1.. MS
* system ^short = "Naming-System des Identifiers"
* system ^definition = "Das System, in dem der Identifier vergeben wurde."
* system = $SurvNetFileNumber
* value 1.. MS
* value ^short = "Wert des Identifiers"
* value ^definition = "Der eigentliche Wert des Identifiers."