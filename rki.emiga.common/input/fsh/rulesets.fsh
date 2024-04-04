
RuleSet: Meta
* ^status = #active
* ^experimental = false
* ^publisher = "Robert Koch-Institut"

RuleSet: MetaTerminology
* ^language = #de-DE
* ^status = #active
* ^experimental = false
* ^publisher = "Robert Koch-Institut"
* ^contact.name = "Robert Koch-Institut"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://rki.de"

RuleSet: Security
* meta
  * security
    * ^slicing.discriminator.type = #value
    * ^slicing.discriminator.path = "system"
    * ^slicing.rules = #open
    * ^slicing.description = "Slicing security attribute by coding system"
    * ^slicing.ordered = false
  * security contains
      visibility 0..1 and
      responsibility 0..1
  * security[visibility] from ResourceVisibilityType
    * system = $ResourceVisibilityType
  * security[responsibility] from ResourceResponsibility
    * system = $ResourceResponsibility
