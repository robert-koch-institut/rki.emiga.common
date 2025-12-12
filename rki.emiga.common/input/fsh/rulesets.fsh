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

RuleSet: ProfileSecurityTagsPerson
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
  * security[visibility] from PersonResourceVisibilityType
    * system 1..1 MS
    * system = $ResourceVisibilityType
    * code 1..1 MS
  * security[responsibility] from $ResourceResponsibilityVS
    * system 1..1 MS
    * system = $ResourceResponsibility
    * code 1..1 MS






RuleSet: ProfileSecurityTagsAnnotation
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
  * security[visibility] from $ResourceVisibilityTypeAnnotation
    * system 1..1 MS
    * system = $ResourceVisibilityType
    * code 1..1 MS
  * security[responsibility] from $ResourceResponsibilityVS
    * system 1..1 MS
    * system = $ResourceResponsibility
    * code 1..1 MS

RuleSet: ProfileSecurityTagVisibility
* meta MS
  * security MS
    * ^slicing.discriminator.type = #value
    * ^slicing.discriminator.path = "system"
    * ^slicing.rules = #open
    * ^slicing.description = "Slicing security attribute by coding system"
    * ^slicing.ordered = false
  * security contains
      visibility 0..1 MS
  * security[visibility] from $ResourceVisibilityTypeVS
    * system 1..1 MS
    * system = $ResourceVisibilityType
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

RuleSet: IdentifierCommon
* identifier MS 
* identifier
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #open
  * ^slicing.description = "slicing patient identifier by system"
  * ^slicing.ordered = false
* identifier contains EmigaID 0..1 MS and EmigaFileNumber 0..1 MS and SurvNetFileNumber 0..1 MS

* identifier[EmigaID] only IdentifierEmigaID
* identifier[EmigaID].use 0..1 MS
* identifier[EmigaID].use = #official (exactly)
* identifier[EmigaID].system 1..1 MS
* identifier[EmigaID].system = "https://emiga.rki.de/fhir/sid/EmigaID"
* identifier[EmigaID].value 1..1 MS
* identifier[EmigaID].value ^short = "Wert des Identifiers"
* identifier[EmigaID].value ^definition = "Der eigentliche Wert des Identifiers."

* identifier[EmigaFileNumber] only IdentifierEmigaFileNumber
* identifier[EmigaFileNumber].use 0..1 MS
* identifier[EmigaFileNumber].use = #official (exactly)
* identifier[EmigaFileNumber].system 1..1 MS
* identifier[EmigaFileNumber].system = "https://emiga.rki.de/fhir/sid/EmigaFileNumber"
* identifier[EmigaFileNumber].value 1..1 MS
* identifier[EmigaFileNumber].value ^short = "Wert des Identifiers"
* identifier[EmigaFileNumber].value ^definition = "Der eigentliche Wert des Identifiers. Das EMIGA Aktenzeichen wird wie folgt generiert: [ENTITÄT][CODE-SITE-ID][JAHR]-[Achtstellige-Zahl]"

* identifier[SurvNetFileNumber] only IdentifierSurvNetFileNumber
* identifier[SurvNetFileNumber].use 0..1 MS
* identifier[SurvNetFileNumber].use = #temp (exactly)
* identifier[SurvNetFileNumber].system 1..1 MS
* identifier[SurvNetFileNumber].system = "https://emiga.rki.de/fhir/sid/SurvNetFileNumber"
* identifier[SurvNetFileNumber].value 1..1 MS
* identifier[SurvNetFileNumber].value ^short = "Wert des Identifiers"
* identifier[SurvNetFileNumber].value ^definition = "Der eigentliche Wert des Identifiers."




RuleSet: ProfileMetaTags
* meta.tag MS
* meta.tag ^slicing.discriminator.type = #pattern
* meta.tag ^slicing.discriminator.path = "system"
* meta.tag ^slicing.rules = #open
* meta.tag contains relevance 0..* MS
* meta.tag[relevance] from $RelevanceVS (required)
* meta.tag[relevance].system 1.. MS
* meta.tag[relevance].system = $RelevanceCS
* meta.tag[relevance].code 1.. MS
* meta.tag[relevance].display MS


RuleSet: ProfileMetaProfileTags
* meta.profile ^slicing.discriminator.type = #value
* meta.profile ^slicing.discriminator.path = "$this"
* meta.profile ^slicing.rules = #open
* meta.profile contains emigaprofile 0..*

