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
* $nullflavour#ASKU "asked but unknown" // nicht ermittelbar
* $nullflavour#ASKU ^designation[0].use = $HL7DesignationUse#display
* $nullflavour#ASKU ^designation[0].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* $nullflavour#ASKU ^designation[0].value = "nicht ermittelbar"
* $nullflavour#ASKU ^designation[0].language = #de-DE
* $nullflavour#NASK "not asked" // nicht erhoben
* $nullflavour#NASK ^designation[0].use = $HL7DesignationUse#display
* $nullflavour#NASK ^designation[0].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* $nullflavour#NASK ^designation[0].value = "nicht erhoben"
* $nullflavour#NASK ^designation[0].language = #de-DE