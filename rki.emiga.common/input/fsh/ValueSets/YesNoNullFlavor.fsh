ValueSet: YesNoNullFlavor
Title: "Ja, Nein, Nicht ermittelbar, Nicht erhoben Antworten"
Description: "Werteliste mit Ja, Nein, nicht ermittelbar und nicht erhoben"
Id: YesNoNullFlavor
* ^url = "https://emiga.rki.de/fhir/ValueSet/YesNoNullFlavor"
* insert MetadataTerminology
* ^version = "1.0.0"
* ^date = "2025-02-03"
* $sct#373066001 "Yes" // Ja
* $sct#373067005 "No" // Nein 
* $nullflavorVS#ASKU "asked but unknown" // nicht ermittelbar
* $nullflavorVS#ASKU ^designation[0].use = $HL7DesignationUse#display
* $nullflavorVS#ASKU ^designation[0].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* $nullflavorVS#ASKU ^designation[0].value = "nicht ermittelbar"
* $nullflavorVS#ASKU ^designation[0].language = #de-DE
* $nullflavorVS#NASK "not asked" // nicht erhoben
* $nullflavorVS#NASK ^designation[0].use = $HL7DesignationUse#display
* $nullflavorVS#NASK ^designation[0].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* $nullflavorVS#NASK ^designation[0].value = "nicht erhoben"
* $nullflavorVS#NASK ^designation[0].language = #de-DE