## {{page-title}}
Im Folgenden werden UML-Diagramme dargestellt, die die für dieses Modul relevanten Anwendungsfälle in komprimierter Form abbilden. Der Schwerpunkt liegt auf den zentralen Use Cases und den dafür erforderlichen Funktionen, um eine klare und gut nachvollziehbare Übersicht zu gewährleisten.


## Annotation
 <!--Falls wir Gerade Lienien im UML haben möchten, dann folgendes einfügen:  skinparam linetype ortho -->

<plantuml>
  set namespaceSeparator none
  skinparam backgroundcolor transparent
  skinparam classBackgroundColor #FFFFCC
  skinparam classBorderColor black
  skinparam classAttributeIconSize 1
  skinparam nodesep 50
  skinparam ranksep 50

  class AffectedPerson{
  <b>+</b> active: boolean [0..1]
  <b>+</b> contained: Resource [0..*] 
  <b>+</b> id: string [0..1]
  <b>+</b> language: code [0..1] 
  <b>+</b> text: Narrative [0..1]
  -- Meta --
  <b>+</b> meta.extension:lastModifiedBy.value[x]: Reference(Practitioner) [1..1]
  <b>+</b> meta.lastUpdated: instant [0..1] 
  <b>+</b> meta.profile:emigaprofile: canonical(StructureDefinition) [0..*]
  <b>+</b> meta.security:responsibility.display: string [0..1]
  <b>+</b> meta.security:visibility.display: string [0..1]
  <b>+</b> meta.source: uri [0..1] 
  <b>+</b> meta.tag: Coding [0..*] 
  <b>+</b> meta.versionID: id [0..1] 
  -- Identifiers --
  <b>+</b> identifier:EmigaFileNumber.value: string [1..1] 
  <b>+</b> identifier:EmigaID.value: string [1..1] 
  <b>+</b> identifier:SurvNetFileNumber.value: string [0..1] 
  -- Personal Information --
  <b>+</b> birthDate: date [0..1]
  <b>+</b> deceasedBoolean: boolean [0..1]
  <b>+</b> deceasedDateTime: dateTime [0..1]
  <b>+</b> extension.citizenship:citizenship: Extension(Complex) [0..*]
  <b>+</b> extension:landOfBirth: Extension(Coding) [0..1]
  <b>+</b> extension:processingStatus: Extension(Coding) [0..1]
  <b>+</b> gender: code [0..1]
  <b>+</b> gender.extension:null-flavor: Extension(Coding) [0..1]
  <b>+</b> gender.extension:other-amtlich: Extension(Coding) [0..1]
  -- Name --
  <b>+</b> name.extension:salutation: Extension(Coding) [0..1]
  <b>+</b> name.family.extension:namenszusatz: Extension(string) [0..1]
  <b>+</b> name.family.extension:nachname: Extension(string) [0..1]
  <b>+</b> name.family.extension:vorsatzwort: Extension(string) [0..1]
  <b>+</b> name.given: string [0..*]
  <b>+</b> name.period: Period [0..1]
  <b>+</b> name.prefix.extension:prefix-qualifier: Extension(code) [0..*]
  <b>+</b> name.suffix: string [0..*]
  <b>+</b> name.text: string [0..1]
  <b>+</b> name.use: code [0..1]
  -- Communication --
  <b>+</b> address.city: string [0..1]
  <b>+</b> address.country: string [0..1]
  <b>+</b> address.extension:addressUse: Extension(Coding) [0..*]
  <b>+</b> address.extension:facilityAssociation: Extension(Complex) [0..*]
  <b>+</b> address.extension:geolocation: Extension(Complex) [0..1]
  <b>+</b> address.extension:regionalKey: Extension(Complex) [0..1]
  <b>+</b> address.extension:Stadtteil: Extension(string) [0..1]
  <b>+</b> address.line.extension:Adresszusatz: Extension(string) [0..1]
  <b>+</b> address.line.extension:Hausnummer: Extension(string) [0..1]
  <b>+</b> address.line.extension:Postfach: Extension(string) [0..1]
  <b>+</b> address.line.extension:Strasse: Extension(string) [0..1]
  <b>+</b> address.period.end: dateTime [0..1]
  <b>+</b> address.period.start: dateTime [0..1]
  <b>+</b> address.postalCode: string [0..1]
  <b>+</b> address.state: string [0..1]
  <b>+</b> address.text: string [0..1]
  <b>+</b> address.type: code [0..1]
  <b>+</b> telecom:Email.value: string [0..*]
  <b>+</b> telecom:Fax.value: string [0..*]
  <b>+</b> telecom:Phone.value: string [0..*]
  -- Contact --
  <b>+</b> contact.address: Address [0..1]
  <b>+</b> contact.gender: code [0..1]
  <b>+</b> contact.name: HumanName [0..1]
  <b>+</b> contact.organization: Reference(Organization) [0..1]
  <b>+</b> contact.period: Period [0..1]
  <b>+</b> contact.relationship: CodeableConcept [0..*]
  <b>+</b> contact.telecom: ContactPoint [0..*]
  <b>+</b> communication.language: CodeableConcept [0..1]
  <b>+</b> communication.preferred: boolean [0..1]
  -- Links --
  <b>+</b> generalPractitoner: Reference(Organization | Practitoner | PractitionerRole) [0..*]
  <b>+</b> link:patientLink.other: Reference(Patient) [0..*]
  <b>+</b> link:relatedPersonLink.other: Reference(RelatedPerson) [0..*]
  }
</plantuml>


## Betroffene Person
 <!--Falls wir Gerade Lienien im UML haben möchten, dann folgendes einfügen:  skinparam linetype ortho -->

<plantuml>
  set namespaceSeparator none
  skinparam backgroundcolor transparent
  skinparam classBackgroundColor #FFFFCC
  skinparam classBorderColor black
  skinparam classAttributeIconSize 1
  skinparam nodesep 50
  skinparam ranksep 50

  class AnnotationCommunication{
  <b>+</b> id: string [0..1]
  -- Meta --
  <b>+</b> meta.lastUpdated: instant [0..1] 
  <b>+</b> meta.profile:emigaprofile: canonical(StructureDefinition) [0..*]
  <b>+</b> meta.security:responsibility.display: string [0..1]
  <b>+</b> meta.security:visibility.display: string [0..1]
  <b>+</b> meta.source: uri [0..1] 
  <b>+</b> meta.versionID: id [0..1] 
  -- Identifiers --
  <b>+</b> identifier:EmigaFileNumber.value: string [1..1] 
  <b>+</b> identifier:EmigaID.value: string [1..1] 
  <b>+</b> identifier:SurvNetFileNumber.value: string [0..1] 
  -- Communication Content --
  <b>+</b> about: Reference(Resource) [0..*] 
  <b>+</b> category: CodeableConcept [0..*]
  <b>+</b> extension:processingStatus: Extension(Coding) [1..1]
  <b>+</b> extension:dateCreated: Extension(instant) [1..1]
  <b>+</b> note: Annotation [0..*]
  <b>+</b> payload.content[x]:contentReference: Reference(AttachmentDocumentReference) [0..1]
  <b>+</b> payload.content[x]:contentString: string [0..1]
  <b>+</b> sender: Reference(EmigaUserPractitioner) [1..1] 
  <b>+</b> sent: dateTime [0..1]
  <b>+</b> status: code [1..1]
  <b>+</b> topic.text: string [1..1] 
  }
  
</plantuml>