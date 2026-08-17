# {{page-title}}

Dieser Abschnitt beschreibt die Anwendungsfälle zur Abbildung betroffener Personen und ihrer Bezugspersonen in EMIGA.

Eine betroffene Person wird als `Patient`-Ressourceninstanz gemäß dem Profil `AffectedPerson` abgebildet. Eine Bezugsperson wird als eigenständige `RelatedPerson`-Ressourceninstanz gemäß dem Profil `AffectedPersonRelatedPerson` geführt. EMIGA-nutzende Personen werden als `EmigaUserPractitioner` abgebildet und können beispielsweise als bearbeitende Personen referenziert werden.

Die folgende Übersicht zeigt die für diese Anwendungsfälle relevanten Profile sowie ihre wesentlichen Beziehungen zueinander.

{{render:guides/implementationguides.common/PlantUML/PNGs/uml-personen-und-bezugspersonen.png}}

Dabei sind insbesondere zwei unterschiedliche Arten von Personenbeziehungen zu unterscheiden:

* `AffectedPersonRelatedPerson.patient` beschreibt die **fachliche Beziehung einer Bezugsperson zu einer betroffenen Person**.
* `AffectedPerson.link[relatedPersonLink]` bzw. `AffectedPerson.link[patientLink]` dienen der **Verknüpfung unterschiedlicher FHIR-Repräsentationen derselben physischen Person**.

## Überblick

Die folgende Darstellung zeigt die Ressourcen, die beim gemeinsamen Anlegen bzw. Verarbeiten einer betroffenen Person in einem FHIR-Transaction-Bundle übermittelt werden können.

{{render:guides/implementationguides.common/PlantUML/PNGs/AffectedPersonBundle.png}}

### Anlegen einer betroffenen Person

Beim Anlegen einer **betroffenen Person** wird eine neue `Patient`-Ressourceninstanz gemäß dem Profil `AffectedPerson` erstellt. Die für einen gemeinsamen Verarbeitungsvorgang benötigten Ressourcen können in einem FHIR-`Bundle` mit `type = transaction` übermittelt werden.

Über `meta.extension:lastModifiedBy` kann die EMIGA-nutzende Person (`EmigaUserPractitioner`) referenziert werden, die die Ressource zuletzt bearbeitet hat. Besteht zusätzlich eine Abbildung derselben physischen Person als Bezugsperson, kann die `AffectedPerson` über `link.relatedPersonLink` auf die entsprechende `AffectedPersonRelatedPerson`-Instanz verweisen.

## Bezugspersonen

{{render:guides/implementationguides.common/PlantUML/PNGs/PersonRelatedPersonOverview.png}}

Eine **Bezugsperson** wird als Instanz des Profils `AffectedPersonRelatedPerson` abgebildet. Die `RelatedPerson`-Instanz selbst repräsentiert dabei die Bezugsperson. Über `patient` wird die betroffene Person referenziert, zu der die Bezugsperson in Beziehung steht. Das Element `relationship` beschreibt die Art dieser Beziehung und ist an das ValueSet `RelatedPersonRelationshipTypeVS` gebunden.

Die `AffectedPerson` kann ihrerseits über `link.relatedPersonLink` auf eine `AffectedPersonRelatedPerson` verweisen, wenn beide Ressourcen dieselbe physische Person in unterschiedlichen FHIR-Kontexten repräsentieren. Der Link dient damit der Verknüpfung von Personenrepräsentationen; die fachliche Beziehung zwischen Bezugsperson und betroffener Person wird dagegen über `AffectedPersonRelatedPerson.patient` und `AffectedPersonRelatedPerson.relationship` ausgedrückt.

## Betroffene Person
{{render:guides/implementationguides.common/PlantUML/PNGs/AffectedPerson.png}}

Das Profil `AffectedPerson` enthält die für EMIGA relevanten personenbezogenen Angaben. Dazu gehören insbesondere Identifikatoren, Name und Anrede, Kontakt- und Adressdaten, Geburtsdaten, Staatsangehörigkeit, Bearbeitungsstatus, Sprachkenntnisse sowie Angaben zu behandelnden Personen und Einrichtungsbezügen.

## Bezugsperson der betroffenen Person
{{render:guides/implementationguides.common/PlantUML/PNGs/AffectedPersonRelatedPerson.png}}

Das Profil `AffectedPersonRelatedPerson` basiert auf `RelatedPerson`. Die Bezugsperson wird durch die Ressource selbst repräsentiert. `patient` verweist auf die zugehörige betroffene Person; mindestens eine Beziehung wird über `relationship` angegeben.