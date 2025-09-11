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
    facility 0..* MS and
    associationType 0..* MS

* extension[facility].value[x] only Reference(Organization or Location)
* extension[facility].value[x] ^short = "Einrichtung"
* extension[facility].value[x] ^definition = "Einrichtung, in der sich die betroffene Person aufhält"
//* extension[facility].value[x] ^type.aggregation = #bundled
* extension[facility].value[x] ^mustSupport = true

* extension[associationType].value[x] only Coding
* extension[associationType].valueCoding from FacilityAssociationType (required)
* extension[associationType].valueCoding ^short = "Verbindungs-Qualifikation"
* extension[associationType].valueCoding ^definition = "Art der Verbindung der betroffenen Person zur Einrichtung"