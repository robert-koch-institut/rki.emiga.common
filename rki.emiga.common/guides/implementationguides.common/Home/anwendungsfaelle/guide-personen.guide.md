# {{page-title}}

Dieser Abschnitt beschreibt die Anwendungsfälle zur Abbildung von betroffenen Personen und Bezugspersonen in EMIGA, beispielsweise eine Fallperson/Patient. Davon abzugrenzen sind EMIGA-nutzende Personen. Diese werden über das Profil `EmigaUserPractitioner` (Paket rki.emiga.vzd) abgebildet.

Eine betroffene Person wird als `Patient`-Ressourceninstanz gemäß dem Profil `AffectedPerson` abgebildet. Eine Bezugsperson wird als eigenständige `RelatedPerson`-Ressourceninstanz gemäß dem Profil `AffectedPersonRelatedPerson` geführt. 

{{render:guides/implementationguides.common/PlantUML/PNGs/uml-personen-und-bezugspersonen.png}}

Dabei sind insbesondere zwei Arten von Referenzen bzw. Verknüpfungen zu unterscheiden:
* `AffectedPersonRelatedPerson.patient` beschreibt die **fachliche Beziehung einer Bezugsperson zu einer betroffenen Person**.
* `AffectedPerson.link[relatedPersonLink]` bzw. `AffectedPerson.link[patientLink]` dienen dagegen der **Verknüpfung unterschiedlicher FHIR-Repräsentationen <u>derselben</u> physischen Person**.

## Überblick
Die folgende Darstellung zeigt die Ressourcen, die beim gemeinsamen Anlegen bzw. Verarbeiten einer betroffenen Person in einem FHIR-Transaction-Bundle übermittelt werden können.

{{render:guides/implementationguides.common/PlantUML/PNGs/AffectedPersonBundle.png}}

## Betroffene Person
{{render:guides/implementationguides.common/PlantUML/PNGs/AffectedPerson.png}}

Das Profil `AffectedPerson` enthält die für EMIGA relevanten personenbezogenen Angaben zu einer Fallperson (Patient). Dazu gehören insbesondere Identifikatoren, Name und Anrede, Kontakt- und Adressdaten, Geburtsdaten, Staatsangehörigkeit, Bearbeitungsstatus, Sprachkenntnisse sowie Angaben zu behandelnden Personen und Einrichtungsbezügen.

Beim Anlegen einer **betroffenen Person** wird eine neue `Patient`-Ressourceninstanz gemäß dem Profil `AffectedPerson` erstellt. Weitere zugehörige Ressourcen, beispielsweise eine `RelatedPerson`, können gemeinsam mit der Patient-Ressource in einem FHIR-Bundle mit type = transaction übermittelt und in einer Transaktion verarbeitet werden.

Besteht zusätzlich eine Repräsentation derselben physischen Person als Bezugsperson, kann die `AffectedPerson` über `link.relatedPersonLink` mit der entsprechenden AffectedPersonRelatedPerson-Instanz verknüpft werden.
Unabhängig davon kann über `meta.extension:lastModifiedBy` die EMIGA-nutzende Person (`EmigaUserPractitioner`) referenziert werden, die die Ressource zuletzt bearbeitet hat. 

## Bezugsperson der betroffenen Person
Eine **Bezugsperson** wird als Instanz des Profils `AffectedPersonRelatedPerson` abgebildet. Über `patient` wird die betroffene Person referenziert, auf die sich die Bezugsperson bezieht.

{{render:guides/implementationguides.common/PlantUML/PNGs/AffectedPersonRelatedPerson.png}}

Das Element `relationship` beschreibt die Art dieser Beziehung und ist an das ValueSet `RelatedPersonRelationshipTypeVS` gebunden.

## Unterschiedliche Repräsentationen derselben Person
In Situationen, in denen dieselbe physische Person sowohl als betroffene Person als auch als Bezugsperson einer anderen betroffenen Person auftritt, wird sie in unterschiedlichen fachlichen Kontexten durch eine `AffectedPerson`- und eine `AffectedPersonRelatedPerson`-Instanz repräsentiert.
Die `AffectedPerson` kann über `link.relatedPersonLink` mit der entsprechenden `AffectedPersonRelatedPerson`-Instanz verknüpft werden. Der Link kennzeichnet, dass beide Ressourcen dieselbe physische Person repräsentieren.