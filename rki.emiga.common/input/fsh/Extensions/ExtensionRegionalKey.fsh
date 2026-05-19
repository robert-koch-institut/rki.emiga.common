Extension: RegionalKey
Id: RegionalKey
Title: "Regionalschlüssel und Regionalbezugsystem"
Description: "Erweiterung zur Darstellung des Regionalschlüssels und des Regionalbezugsystems"
Context: Patient.address
* ^url = "https://emiga.rki.de/fhir/common/Extension/RegionalKey"
* ^version = "0.2.0"
* ^date = "2026-05-19"
* insert MetadataProfile

* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #closed

* extension contains
    regionKey 0..1 and
    regionReferenceSystem 0..1

* extension[regionKey].value[x] only string
* extension[regionKey].valueString 1..1 
// Regionalschlüssel soll genau 12 Ziffern enthalten
* extension[regionKey].valueString obeys validRegionKey
* extension[regionKey].valueString from RegionKeys (required)
* extension[regionKey].value[x] ^short = "Regionalschlüssel"
* extension[regionKey].value[x] ^definition = "Regionalschlüssel der betroffenen Person"

* extension[regionReferenceSystem].value[x] only string
* extension[regionReferenceSystem].value[x] ^short = "Regionalbezugsystem"
* extension[regionReferenceSystem].value[x] ^definition = "Regionalbezugsystem des Regionschlüssels"


Invariant: validRegionKey
Description: "Der Regionschlüssel soll genau 12 Ziffern enthalten."
* severity = #error
* expression = "$this.matches('^[0-9]{12}$')"