Instance: FillingNote
InstanceOf: AdditionalPropertiesQuestionnaire
Usage: #definition
* url = "https://emiga.rki.de/fhir/common/Questionnaire/FillingNote"
* version = "0.3.0"
* meta.profile = "https://emiga.rki.de/fhir/common/StructureDefinition/AdditionalPropertiesQuestionnaire|1.2.0-alpha.6"
* name = "Ablagevermerk"
* title = "Ablagevermerk"
* status = #draft
* publisher = "Robert Koch Institute"
* copyright = "Robert Koch Institute"
* date = "2025-07-04"
* item[0].type = #boolean
* item[=].extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].extension.valueCodeableConcept = $questionnaire-item-control#check-box "Check box"
* item[=].linkId = "690479987243"
* item[=].text = "Öffentlich"
* item[+].type = #date
* item[=].linkId = "637754159837"
* item[=].text = "Datum"
* item[+].type = #text
* item[=].linkId = "344086928467"
* item[=].text = "Kommentar:"
* item[+].type = #reference
* item[=].linkId = "383858025148"
* item[=].text = "Bezugsentität"