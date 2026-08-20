---
topic: AttachmentDocumentReference
canonical: https://emiga.rki.de/fhir/common/StructureDefinition/AttachmentDocumentReference
---

# {{page-title}}
## Beschreibung
<fql output= "inline" headers="false">
from 
    StructureDefinition
where
    url = %canonical
select
    description
</fql>

<br>&nbsp;<br>

Das Profil `AttachmentDocumentReference` basiert auf der FHIR-Ressource `DocumentReference` und dient der Abbildung von **Anhängen** als eigenständige FHIR-Ressourcen innerhalb von EMIGA.

Hierzu zählen beispielsweise hochgeladene Dateien, beispielsweise Dokumente, die auf Grundlage von Anschreiben-Vorlagen erzeugt wurden.

Die eigenständige Modellierung von Anhänge als `DocumentReference` ermöglicht es, einen Anhang unabhängig von der Ressource zu verwalten, aus der auf ihn verwiesen wird. Ein Anhang kann beispielsweise mit einer Annotation verknüpft werden, ohne den Anhang unmittelbar innerhalb der Communication-Ressource abzubilden.

### Dateiinhalt und Dateimetadaten
<#TODO> Redundancy checken

Die `DocumentReference` enthält die fachlichen und technischen Metadaten des Anhangs. Der binäre Dateiinhalt wird nicht inline in der Ressource übertragen, sondern separat bereitgestellt und über `DocumentReference.content.attachment.url` referenziert.
Eine direkte Einbettung des Dateiinhalts über `DocumentReference.content.attachment.data`ist im Profil ausgeschlossen.

Über `content.attachment` können insbesondere folgende Informationen zum Dokument angegeben werden:

| Element                          | Bedeutung                                                     |
| -------------------------------- | ------------------------------------------------------------- |
| `content.attachment.url`         | Referenz auf den Dateiinhalt                                  |
| `content.attachment.contentType` | MIME-Type der Datei, z. B. `application/pdf` oder `image/png` |
| `content.attachment.size`        | Größe der Datei in Bytes                                      |
| `content.attachment.hash`        | Hashwert zur Prüfung der Dateiintegrität                      |
| `content.attachment.title`       | Name bzw. Betreff des Anhangs                                 |
| `content.attachment.creation`    | Erstellungszeitpunkt des eigentlichen Dokuments               |

**⚠ Hinweis:** Dabei ist zwischen dem Erstellungszeitpunkt des Dokuments und dem Erstellungszeitpunkt der `DocumentReference` zu unterscheiden.

`content.attachment.creation` bezeichnet den **Erstellungszeitpunkt des referenzierten Dokuments**.

`DocumentReference.date` bezeichnet dagegen den **Zeitpunkt, zu dem der Anhang in EMIGA erstellt bzw. als `DocumentReference` angelegt wurde**.

Über `DocumentReference.author` wird die Person referenziert, die den Anhang in EMIGA erstellt hat.

### Identifikation
Ein Anhang kann über `DocumentReference.identifier` mit fachlichen oder technischen Identifiern versehen werden.

Die Identifier beziehen sich auf die `DocumentReference` und ermöglichen eine eindeutige Zuordnung des Anhangs innerhalb des jeweiligen Verarbeitungskontexts.

Je nach Verwendungskontext können beispielsweise EMIGA-spezifische Identifier oder weitere fachliche Referenznummern zur Identifikation und Zuordnung eines Dokuments angefügt werden.

### (move to Usecase) Verwendung mit Annotationen
Anhänge werden als eigenständige `DocumentReference`-Ressourcen verwaltet und können von anderen FHIR-Ressourcen referenziert werden.

Bei Annotationen erfolgt die Verknüpfung über `Communication.payload.contentReference`. Die Annotation enthält damit lediglich die Referenz auf den Anhang:

```text
Communication
      │
      │ payload.contentReference
      ▼
DocumentReference
      │
      │ content.attachment.url
      ▼
   Dateiinhalt
```

Dadurch bleiben Annotation und Anhang voneinander getrennte Ressourcen und können unabhängig voneinander verwaltet werden.

Eine Annotation kann neben ihrem textuellen Inhalt einen oder mehrere Anhänge referenzieren, *sofern dies durch das jeweilige Profil zugelassen ist*.

### Sicherheit und Verantwortlichkeit
Für eine `AttachmentDocumentReference` kann über `meta.security` gekennzeichnet werden, in welchem Einrichtungskontext der Anhang verwendet und übermittelt werden darf. Die Security Labels gelten dabei für den Anhang als eigenständige Ressource und sind unabhängig von den Kennzeichnungen der Ressource zu berücksichtigen, mit der der Anhang verknüpft ist.
Bei der Bereitstellung und Übermittlung eines Anhangs sind daher die für die DocumentReference gesetzten Security Labels zu beachten.

### Versionierung
Die Versionierung von Anhang und Annotation haben folgende Besonderheiten/Eigenschaften:
- Ein Anhang gilt als **neuer Anhang** und erhält eine neue Ressourcen-ID, wenn er unter einem neuen Namen bzw. Betreff (`content.attachment.title`) gespeichert wird. Dies gilt auch dann, wenn der Dateiinhalt gegenüber einem bereits vorhandenen Anhang unverändert ist.

- Wird ein bestehender Anhang bearbeitet und unter demselben Namen bzw. Betreff gespeichert, behält er seine Ressourcen-ID und erhält eine **neue Version**.

- Wird einer Annotation ein **neuer Anhang** hinzugefügt, entsteht eine neue Version der Annotation.

- Entsteht lediglich eine neue Version eines bereits referenzierten **Anhangs**, bleibt die Version der Annotation unverändert.

## Profil
### Metadaten
<fql output="transpose" headers="true">
from
    StructureDefinition
where
    url = %canonical
select
        CanonicalURL: url, Status: status, Version: version, Herausgeber: publisher
</fql>
<br>&nbsp;<br>

### Inhalt
<tabs>
<tab title="Darstellung">{{tree, buttons}}</tab>
<tab title="XML">{{xml}}</tab>
<tab title="JSON">{{json}}</tab>
<tab title="Link">{{link}}</tab>
</tabs>
<br>&nbsp;<br>

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
<br>&nbsp;<br>

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
<br>&nbsp;<br>

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
<br>&nbsp;<br>