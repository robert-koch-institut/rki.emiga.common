Extension: RegionalKey
Id: RegionalKey
Title: "Regionalschlüssel und Regionalbezugsystem"
Description: "Erweiterung zur Darstellung des Regionalschlüssels und des Regionalbezugsystems"
Context: Patient.address
* ^url = "https://emiga.rki.de/fhir/common/Extension/RegionalKey"
* ^version = "0.1.0"
* ^date = "2025-09-17"
* insert MetadataProfile

* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #closed

* extension contains
    regionKey 0..1 and
    regionReferenceSystem 0..1

//* extension[facility].url = "facility"
* extension[regionKey].value[x] only string
* extension[regionKey].valueString 1..1 MS
//* extension[regionKey].valueString ^pattern = "[0-9]{12}"
//* extension[regionKey].valueString ^minLength = 12
* extension[regionKey].valueString ^maxLength = 12
//* extension[regionKey].valueString ^regex = "[0-9]{12}"
* extension[regionKey].valueString from RegionKeys (required)
* extension[regionKey].value[x] ^short = "Regionschlüssel"
* extension[regionKey].value[x] ^definition = "Regionalschlüssel der betroffenen Person"
//* extension[facility].value[x] ^type.aggregation = #bundled
* extension[regionReferenceSystem].value[x] ^mustSupport = true

* extension[regionReferenceSystem].value[x] only string
* extension[regionReferenceSystem].valueString 1..1 MS
//* extension[associationType].value[x] from FacilityAssociationType (required)
* extension[regionReferenceSystem].value[x] ^short = "Regionalbezugsystem"
* extension[regionReferenceSystem].value[x] ^definition = "Regionalbezugsystem des Regionschlüssels"
