Instance: EmigaUser-001
InstanceOf: EmigaUserPractitioner
Title: "Beispiel EMIGA Nutzende Person"
Description: "Ein Beispielinstanz einer Practitioner-Ressource basierend auf dem EmigaUserPractitioner-Profil."
Usage: #example
* id = "EmigaUser-001"

* meta.profile = "https://emiga.rki.de/fhir/common/StructureDefinition/EmigaUserPractitioner|1.2.0-alpha.12"
* active = true
* name.family = "Musterfrau"
* name.given = "Erika"

* meta.security[visibility] = $ResourceVisibilityType#inAgency "Eigene ÖGD-Stelle"
* meta.security[responsibility] = $ResourceResponsibility#1. "Robert Koch-Institut"

* identifier.value = "testemail@example.com"

