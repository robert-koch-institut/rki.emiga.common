Profile: IdentifierEmigaID
Parent: Identifier
Id: IdentifierEmigaID
Title: "EMIGA-ID Identifier"
Description: "Technischer Indentifikator für EMIGA-Entitäten."
* insert MetadataProfile
* ^version = "0.2.0"
* ^date = "2025-09-26"
* type = $v2-0203#XX "Organization identifier"
* type MS
* type ^short = "Art des Identifiers"
* type ^definition = "Art des Identifiers, z.B. 'MR' für Medical Record Number oder 'XX' für Organization Identifier."
* system 1.. MS
* system ^short = "Naming-System des Identifiers"
* system ^definition = "Das System, in dem der Identifier vergeben wurde."
* system = $EmigaID
* value 1..1 MS
* value ^short = "Wert des Identifiers"
* value ^definition = "Der eigentliche Wert des Identifiers."