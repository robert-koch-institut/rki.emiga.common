Profile: IdentifierSurvNetFileNumber
Parent: Identifier
Id: IdentifierSurvNetFileNumber
Title: "SurvNet Aktenzeichen Identifier"
Description: "SurvNet Aktenzeichen Identifier-Profil"
* insert MetadataProfile
* ^version = "0.1.0"
* ^date = "2025-09-26"
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