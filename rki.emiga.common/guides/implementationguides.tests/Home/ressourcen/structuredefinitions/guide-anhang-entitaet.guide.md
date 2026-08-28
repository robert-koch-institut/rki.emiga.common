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

Die eigenständige Modellierung von Anhänge als `DocumentReference` ermöglicht es, einen Anhang unabhängig von der Ressource zu verwalten, aus der auf ihn verwiesen wird.

### Dateiinhalt und Dateimetadaten
<#TODO> Redundancy checken

Die `DocumentReference` enthält die fachlichen und technischen Metadaten des Anhangs. Der binäre Dateiinhalt wird nicht inline in der Ressource übertragen, sondern separat bereitgestellt und über `DocumentReference.content.attachment.url` referenziert.

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

`DocumentReference.date` bezeichnet den Zeitpunkt, zu dem der Anhang in EMIGA erstellt bzw. als `DocumentReference` angelegt wurde.

Über `DocumentReference.author` wird die Person referenziert, die den Anhang in EMIGA erstellt hat.

### Identifikation
Ein Anhang kann über `DocumentReference.identifier` mit fachlichen oder technischen Identifiern versehen werden.

Je nach Verwendungskontext können beispielsweise EMIGA-spezifische Identifier oder weitere fachliche Referenznummern zur Identifikation und Zuordnung eines Dokuments angefügt werden.

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