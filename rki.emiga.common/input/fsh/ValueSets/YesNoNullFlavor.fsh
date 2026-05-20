ValueSet: YesNoNullFlavor
Title: "Ja, Nein, Nicht ermittelbar, Nicht erhoben Antworten"
Description: "Werteliste mit Ja, Nein, nicht ermittelbar und nicht erhoben."
Id: YesNoNullFlavor
* ^url = "https://emiga.rki.de/fhir/ValueSet/YesNoNullFlavor"
* insert MetadataTerminology
* ^version = "1.1.0"
* ^date = "2026-04-23"
* ^copyright = "Dieses ValueSet enthält SNOMED Clinical Terms® (SNOMED CT®), die mit Genehmigung der International Health Terminology Standards Development Organisation (IHTSDO) verwendet werden. Alle Rechte vorbehalten. SNOMED CT® wurde ursprünglich vom College of American Pathologists entwickelt. 'SNOMED' und 'SNOMED CT' sind eingetragene Warenzeichen der IHTSDO."

* $sct#373066001 "Yes" // Ja
* $sct#373067005 "No" // Nein 
* $v3-NullFlavor#ASKU "asked but unknown" // nicht ermittelbar
* $v3-NullFlavor#ASKU ^designation[0].use = $HL7DesignationUse#display
* $v3-NullFlavor#ASKU ^designation[0].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* $v3-NullFlavor#ASKU ^designation[0].value = "nicht ermittelbar"
* $v3-NullFlavor#ASKU ^designation[0].language = #de-DE
* $v3-NullFlavor#NASK "not asked" // nicht erhoben
* $v3-NullFlavor#NASK ^designation[0].use = $HL7DesignationUse#display
* $v3-NullFlavor#NASK ^designation[0].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* $v3-NullFlavor#NASK ^designation[0].value = "nicht erhoben"
* $v3-NullFlavor#NASK ^designation[0].language = #de-DE