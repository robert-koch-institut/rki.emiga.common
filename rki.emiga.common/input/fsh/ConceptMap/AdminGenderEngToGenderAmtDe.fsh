// Define the ConceptMap that maps AdministrativeGender (English) to GenderAmtlichDE (German)
Instance: AdminGenderEngToGenderAmtDe
InstanceOf: ConceptMap
Usage: #definition
Title: "ConceptMap AdministrativeGender (Eng) to GenderAmtlichDE"
Description: "ConceptMap zur Übersetzung von AdministrativeGender (englisch) zu GenderAmtlichDE (deutsch)."
//* insert MetadataTerminology

* url = "https://emiga.rki.de/fhir/ConceptMap/AdminGenderEngToGenderAmtDe"
* version = "0.1.0"
* name = "AdministrativeGenderToGenderAmtlichDE"
* date = "2025-11-19"
* status = #active
* sourceCanonical = "http://hl7.org/fhir/administrative-gender"
* targetCanonical = "http://fhir.de/CodeSystem/gender-amtlich-de"

* group[0].source = "http://hl7.org/fhir/administrative-gender"
* group[0].target = "http://fhir.de/CodeSystem/gender-amtlich-de"

* group[0].element[0].code = #male
* group[0].element[0].display = "Male"
* group[0].element[0].target[0].code = #M
* group[0].element[0].target[0].display = "männlich"
* group[0].element[0].target[0].equivalence = #equivalent

* group[0].element[1].code = #female
* group[0].element[1].display = "Female"
* group[0].element[1].target[0].code = #W
* group[0].element[1].target[0].display = "weiblich"
* group[0].element[1].target[0].equivalence = #equivalent

* group[0].element[2].code = #other
* group[0].element[2].display = "Other"
* group[0].element[2].target[0].code = #D
* group[0].element[2].target[0].display = "divers"
* group[0].element[2].target[0].equivalence = #equivalent

* group[0].element[3].code = #unknown
* group[0].element[3].display = "Unknown"
* group[0].element[3].target[0].code = #X
* group[0].element[3].target[0].display = "unbestimmt"
* group[0].element[3].target[0].equivalence = #equivalent