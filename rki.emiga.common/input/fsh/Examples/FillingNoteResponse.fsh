Instance: FillingNoteResponse
InstanceOf: AdditionalPropertiesQuestionnaireResponse
Usage: #example
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/common/StructureDefinition/AdditionalPropertiesQuestionnaireResponse|1.2.0-alpha.9"
* meta.security[responsibility].system = "https://emiga.rki.de/fhir/common/CodeSystem/ResourceResponsibility"
* meta.security[responsibility].code = #1.01.0.01.	
* meta.security[visibility].system = "https://emiga.rki.de/fhir/common/CodeSystem/ResourceVisibilityType"
* meta.security[visibility].code = #public
* questionnaire = "https://emiga.rki.de/fhir/common/Questionnaire/FillingNote"
* status = #completed
* authored = "2025-07-04"
* item[0].linkId = "690479987243"
* item[0].answer.valueBoolean = true
* item[1].linkId = "637754159837"
* item[1].answer.valueDate = "2025-07-04"
* item[2].linkId = "344086928467"
* item[2].answer.valueString = "Dies ist ein Beispiel-Kommentar."
* item[3].linkId = "383858025148"
* item[3].answer.valueReference = Reference(Composition/example)