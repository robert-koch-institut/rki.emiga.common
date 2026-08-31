---
topic: AnnotationCommunication
canonical: https://emiga.rki.de/fhir/common/StructureDefinition/AnnotationCommunication
---

# {{page-title}}


<fql output="inline" headers="false">
from 
    StructureDefinition
where
    url = %canonical
select
    description
</fql>

<br> <br>

Das Profil `AnnotationCommunication` basiert auf der FHIR-Ressource `Communication` und dient der Abbildung von **Annotationen** in EMIGA. Annotationen ermöglichen es, fachliche Entitäten, beispielsweise Fälle, Ausbrüche oder Personen, mit Notizen, Kommentaren und Anhängen zu versehen.

Die Annotation wird als eigenständige FHIR-Ressource modelliert. Die Entität, auf die sich die Annotation bezieht, wird über `AnnotationCommunication.about` referenziert.

### Inhalt einer Annotation

Der eigentliche Inhalt einer Annotation wird über `AnnotationCommunication.payload` abgebildet. Eine Annotation kann dabei textuelle Inhalte und Anhänge enthalten.

| Element                    | Bedeutung                                                     |
| -------------------------- | ------------------------------------------------------------- |
| `topic.text`               | Betreff der Annotation                                        |
| `about`                    | Referenz auf die Entität, auf die sich die Annotation bezieht |
| `payload.contentString`    | Textueller Inhalt der Annotation                              |
| `payload.contentReference` | Referenz auf einen Anhang (`AttachmentDocumentReference`)     |
| `sender`                   | Person, die die Annotation erstellt hat                       |
| `sent`                     | Benutzerdefiniertes Datum der Annotation                      |

Über `payload.content[x]` sind ausschließlich die Datentypen `string` und `Reference(AttachmentDocumentReference)` zulässig. Textuelle Inhalte werden über `payload.contentString` abgebildet. Anhänge werden dagegen als eigenständige `AttachmentDocumentReference`-Ressourcen modelliert und über `payload.contentReference` referenziert.

Eine Annotation kann mehrere `payload`-Elemente enthalten und damit beispielsweise Textinhalte und mehrere Anhänge miteinander kombinieren.

### Bezug zu einer fachlichen Entität

Über `AnnotationCommunication.about` wird die **Bezugsentität** der Annotation angegeben. Hierüber kann eine Annotation beispielsweise einem Fall, einem Ausbruch oder einer Person zugeordnet werden.

Die Referenz beschreibt damit, **worauf sich die Annotation fachlich bezieht**.

`Communication.subject` wird für diesen Zweck nicht verwendet und ist im Profil ausgeschlossen.

### Betreff

Der Betreff einer Annotation wird über `topic.text` angegeben. Für `topic` ist genau ein Eintrag erforderlich. Eine codierte Abbildung über `topic.coding` ist nicht vorgesehen.

### Kategorie

Über `category` wird die **Kategorie der Annotation** angegeben. Die zulässigen Kategorien werden durch das ValueSet `AnnotationCategoryVS` festgelegt.

Die Codierung erfolgt über das EMIGA-spezifische CodeSystem für Annotationskategorien.

### Erstellende Person

Über `sender` wird die Person referenziert, die die Annotation erstellt hat. Die Referenz ist auf das Profil `EmigaUserPractitioner` eingeschränkt.

### Datum und Erstellungszeitpunkt

Bei den Datumsangaben einer Annotation sind unterschiedliche Bedeutungen zu unterscheiden.

`sent` enthält ein **benutzerdefiniertes Datum** der Annotation.

Die Extension `dateCreated` kann dagegen den Erstellungszeitpunkt der Annotation abbilden.

### Verarbeitungsstatus

Der fachliche Verarbeitungsstatus der Annotation wird über die Extension `processingStatus` abgebildet. Hierfür ist das ValueSet `ProcessingStatusAnnotation` verbindlich vorgegeben.

Der FHIR-Status `Communication.status` wird dagegen fest auf `completed` gesetzt. Er bildet somit nicht den fachlichen Verarbeitungsstatus der Annotation ab.

### Kennzeichnung personenbezogener Daten

Über `meta.tag[personalInformation]` wird gekennzeichnet, ob bzw. in welcher Form die Annotation personenbezogene Daten enthält. Die zulässigen Werte werden durch das ValueSet `PersonalInformation` vorgegeben.

Diese Kennzeichnung ist für `AnnotationCommunication` verpflichtend.

## Profil

### Metadaten

<fql output="transpose" headers="true">
from
    StructureDefinition
where
    url = %canonical
select
    CanonicalURL: url,
    Status: status,
    Version: version,
    Herausgeber: publisher
</fql>

<br> <br>

### Inhalt

<tabs>
<tab title="Darstellung">{{tree, buttons}}</tab>
<tab title="XML">{{xml}}</tab>
<tab title="JSON">{{json}}</tab>
<tab title="Link">{{link}}</tab>
</tabs>

<br> <br>

### Constraints/Invarianten

<fql headers="true">
from 
    StructureDefinition 
where 
    url = %canonical
for 
    differential.element 
    where
        constraint.exists()
    select 
        Name: constraint.key,
        Element: id,
        Schweregrad: constraint.severity,
        Beschreibung: constraint.human,
        Ausdruck: constraint.expression
</fql>

<br> <br>

### Terminology-Bindings

<fql headers="true">
from 
    StructureDefinition
where 
    url = %canonical
for 
    differential.element
    where 
        binding.exists()
    select
        Element: id,
        Staerke: binding.strength,
        ValueSet: binding.valueSet
</fql>

<br> <br>

## Anmerkungen zu Must-Support Elementen

<fql>
from
    StructureDefinition
where 
    url = %canonical
for differential.element
where mustSupport = true
select
    Feldname: id,
    Kurzbeschreibung: short,
    Beschreibung: definition,
    Hinweise: comment
</fql>

<br> <br>
