ValueSet: YesNoNullFlavorVS
Title: "Ja, Nein, Nicht ermittelbar, Nicht erhoben Antworten"
Description: "Werteliste mit Ja, Nein, nicht ermittelbar und nicht erhoben"
Id: YesNoNullFlavorVS
* ^url = "https://emiga.rki.de/fhir/ValueSet/YesNoNullFlavorVS"
* insert MetadataTerminology
* ^version = "1.0.0"
* ^date = "2025-02-03"

* $sct#373066001 "Yes" // Ja
* $sct#373067005 "No" // Nein 
* $HL7NullflavorVS#ASKU "asked but unknown" // nicht ermittelbar
* $HL7NullflavorVS#ASKU ^designation[0].use = $HL7DesignationUse#display
* $HL7NullflavorVS#ASKU ^designation[0].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* $HL7NullflavorVS#ASKU ^designation[0].value = "nicht ermittelbar"
* $HL7NullflavorVS#ASKU ^designation[0].language = #de-DE
* $HL7NullflavorVS#NASK "not asked" // nicht erhoben
* $HL7NullflavorVS#NASK ^designation[0].use = $HL7DesignationUse#display
* $HL7NullflavorVS#NASK ^designation[0].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* $HL7NullflavorVS#NASK ^designation[0].value = "nicht erhoben"
* $HL7NullflavorVS#NASK ^designation[0].language = #de-DE