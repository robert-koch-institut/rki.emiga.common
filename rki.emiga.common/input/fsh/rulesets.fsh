// Metadaten-Elemente, die sich alle Profile teilen
RuleSet: MetadataProfile
* ^status = #active
* ^experimental = false
* ^publisher = "Robert Koch-Institut"

// Metadaten-Elemente, die sich alle Terminologie-Ressourcen teilen
RuleSet: MetadataTerminology
* ^language = #de-DE
* ^status = #active
* ^experimental = false
* ^publisher = "Robert Koch-Institut"
* ^contact.name = "Robert Koch-Institut"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://rki.de"

// Profil-Regeln, die für alle Ressourcen gelten
RuleSet: ProfileResourceCommon
* id 0..1
* implicitRules 0..0
* language 0..1 

// Profil-Regeln, die für alle Domain-Ressourcen gelten
RuleSet: ProfileDomainResourceCommon
* text 0..0
* contained 0..0
* modifierExtension 0..0

// Profil-Regeln, die für alle Ressourcen, die sicherheitstechnisch eingestuft werden müssen, gelten
RuleSet: ProfileSecurityTags
* meta MS
  * security MS
    * ^slicing.discriminator.type = #value
    * ^slicing.discriminator.path = "system"
    * ^slicing.rules = #open
    * ^slicing.description = "Slicing security attribute by coding system"
    * ^slicing.ordered = false
  * security contains
      visibility 0..1 MS and
      responsibility 0..1 MS
  * security[visibility] from $ResourceVisibilityTypeVS
    * system 1..1 MS
    * system = $ResourceVisibilityType
    * code 1..1 MS
  * security[responsibility] from $ResourceResponsibilityVS
    * system 1..1 MS
    * system = $ResourceResponsibility
    * code 1..1 MS

// Standardprofil für die strikte Ausgestaltung von CodableConcepts, die lediglich ein Coding-Element zulässt
RuleSet: StrictCodableConcept
* coding 1..1 MS
  * system 1..1 MS
  * code 1..1 MS
  * display 0..1
* text 0..0

// Standardprofil für die strikte Ausgestaltung von Codings (system + code sind verpflichtend)
RuleSet: StrictCoding
* system 1..1 MS
* code 1..1 MS
* display 0..1
