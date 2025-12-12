Extension: FacilityAddressAffectedPerson
Id: FacilityAddressAffectedPerson
Title: "Einrichtungsadresse Betroffene Person"
Description: "Über Einrichtungsadresse kann eine Einrichtung als Aufenthaltsort für die Betroffene Person angegeben werden."
Context: Patient
* ^url = "https://emiga.rki.de/fhir/common/Extension/FacilityAddressAffectedPerson"
* ^version = "0.1.0"
* ^date = "2025-09-03"
* insert MetadataProfile
* url = "https://emiga.rki.de/fhir/common/Extension/FacilityAddressAffectedPerson" (exactly)
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #closed

* extension contains
    facility 1..1 MS and
    associationType 0..1 MS

//* extension[facility].url = "facility"
* extension[facility].value[x] only Reference(Organization or Location)
* extension[facility].value[x] ^short = "Einrichtung"
* extension[facility].value[x] ^definition = "Einrichtung, in der sich die betroffene Person aufhält"
//* extension[facility].value[x] ^type.aggregation = #bundled
* extension[facility].value[x] ^mustSupport = true

//* extension[associationType].url = "associationType"
* extension[associationType].value[x] only CodeableConcept
* extension[associationType].valueCodeableConcept from FacilityAssociationTypeVS (required)
* extension[associationType].valueCodeableConcept ^short = "Verbindungs-Qualifikation"
* extension[associationType].valueCodeableConcept ^definition = "Art der Verbindung der betroffenen Person zur Einrichtung"
* extension[associationType].valueCodeableConcept.coding 1.. MS
* extension[associationType].valueCodeableConcept.coding.code 1..1 MS
//* extension[associationType].valueCodeableConcept.coding.system = "https://emiga.rki.de/fhir/common/CodeSystem/FacilityAssociationType"
* extension[associationType].valueCodeableConcept.coding.system 1..1 MS
* extension[associationType].valueCodeableConcept.coding.display MS
* extension[associationType].valueCodeableConcept.coding.version MS
