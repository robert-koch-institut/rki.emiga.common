Extension: Citizenship
Parent: http://hl7.org/fhir/StructureDefinition/patient-citizenship
Id: Citizenship
Title: "Staatsangehörigkeit"
Description: "Profiles the patient-citizenship extension to bind the code slice to a country code ValueSet."
Context: Patient
* insert MetadataProfile

* ^url = "https://emiga.rki.de/fhir/common/Extension/Citizenship"
* ^version = "0.3.0"
* ^date = "2025-09-08"
* extension.url = "https://emiga.rki.de/fhir/common/Extension/Citizenship"
* extension[code] 1..1 MS
* extension[code].valueCodeableConcept 1..1
* extension[code].valueCodeableConcept from http://hl7.org/fhir/ValueSet/iso3166-1-2 (extensible)