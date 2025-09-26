Profile: IdentifierEmigaFileNumber
Parent: Identifier
Id: IdentifierEmigaFileNumber
Title: "EMIGA Aktenzeichen Identifier"
Description: "Eindeutiger fachlicher Identifier für EMIGA-Entitäten"
* insert MetadataProfile
* ^version = "0.1.0"
* ^date = "2025-09-26"
* type = $v2-0203#XX "Organization identifier"
* type ^short = "Art des Identifiers"
* type ^definition = "Art des Identifiers, z.B. 'XX' für einen Organization Identifier."
* type MS
* system 1.. MS
* system ^short = "Naming-System des Identifiers"
* system ^definition = "Das System, in dem der Identifier vergeben wurde."
* system = $EmigaFileNumber
* value 1..1 MS
* value ^short = "Wert des Identifiers"
* value ^definition = "Der eigentliche Wert des Identifiers. Das EMIGA Aktenzeichen wird wie folgt generiert: [ENTITÄT][CODE-SITE-ID][JAHR]-[Achtstellige-Zahl]"