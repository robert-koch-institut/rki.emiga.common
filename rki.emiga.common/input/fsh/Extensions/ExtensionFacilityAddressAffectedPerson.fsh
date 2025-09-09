Extension: FacilityAddressAffectedPerson
Id: FacilityAddressAffectedPerson
Title: "Einrichtungsadresse Betroffene Person"
Description: "Über Einrichtungsadresse kann eine Einrichtung als Aufenthaltsort für die Betroffene Person angegeben werden."
Context: Patient.address
* ^url = "https://emiga.rki.de/fhir/common/Extension/FacilityAddressAffectedPerson"
* ^version = "0.1.0"
* ^date = "2025-09-03"
* insert MetadataProfile

* extension contains
    facility 1..1 MS and
    associationType 1..1 MS

* extension[facility].valueReference only Reference(Organization or Location)
* extension[facility].valueReference ^short = "Einrichtung"
* extension[facility].valueReference ^definition = "Einrichtung, in der sich die betroffene Person aufhält"
* extension[facility].valueReference ^type.aggregation = #bundled

* extension[associationType].valueCoding only Coding
* extension[associationType].valueCoding from AssociationType (required)
* extension[associationType].valueCoding ^short = "Verbindungs-Qualifikation"
* extension[associationType].valueCoding ^definition = "Art der Verbindung der betroffenen Person zur Einrichtung"