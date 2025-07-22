Instance: BatchReadCommunicationPractitioner
InstanceOf: Bundle
Usage: #example
Title: "Batch Bundle: Read Communication and Practitioner"
Description: "A batch bundle to read Communication and Practitioner resources by id."
* type = #batch
* identifier.system = "https://emiga.rki.de/fhir/common/sid/AnnotationBundleId"
* identifier.value = "d317ce08-1da0-48d4-8dd7-8edbe88d51f3"
* meta.profile = "https://emiga.rki.de/fhir/common/StructureDefinition/AnnotationBundle|1.2.0-alpha.6"
* timestamp = "2025-07-03T09:28:36.132+01:00"

* entry[0].request.method = #GET
* entry[0].request.url = "Communication/2"

* entry[1].request.method = #GET
* entry[1].request.url = "Practitioner/5d4b8483-0a7d-471e-b1df-26addf06ff1c"