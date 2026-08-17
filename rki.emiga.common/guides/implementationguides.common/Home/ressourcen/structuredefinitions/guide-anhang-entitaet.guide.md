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

Das Profil `AttachmentDocumentReference` basiert auf der FHIR-Ressource `DocumentReference` und dient der Abbildung von **Anhängen und Dokumenten als eigenständige FHIR-Ressourcen** innerhalb von EMIGA.

Hierzu zählen beispielsweise hochgeladene Dateien sowie Dokumente, die auf Grundlage von Anschreiben-Vorlagen erzeugt wurden.

Die eigenständige Modellierung als `DocumentReference` ermöglicht es, einen Anhang unabhängig von der Ressource zu verwalten, aus der auf ihn verwiesen wird. Ein Anhang kann beispielsweise mit einer Annotation verknüpft werden, ohne dass der eigentliche Dateiinhalt Bestandteil der `Communication`-Ressource sein muss.

### Dateiinhalt und Dateimetadaten

Der eigentliche binäre Dateiinhalt wird nicht inline innerhalb der `DocumentReference` übertragen. Das Element:

```text
DocumentReference.content.attachment.data
```

ist im Profil ausgeschlossen.

Stattdessen wird die Datei über:

```text
DocumentReference.content.attachment.url
```

referenziert.

Die `DocumentReference` enthält damit die fachlichen und technischen Metadaten des Anhangs, während der eigentliche Dateiinhalt separat bereitgestellt wird.

Über `content.attachment` können insbesondere folgende Informationen zum Dokument angegeben werden:

| Element                          | Bedeutung                                                     |
| -------------------------------- | ------------------------------------------------------------- |
| `content.attachment.url`         | Referenz auf den Dateiinhalt                                  |
| `content.attachment.contentType` | MIME-Type der Datei, z. B. `application/pdf` oder `image/png` |
| `content.attachment.size`        | Größe der Datei in Bytes                                      |
| `content.attachment.hash`        | Hashwert zur Prüfung der Dateiintegrität                      |
| `content.attachment.title`       | Name bzw. Betreff des Anhangs                                 |
| `content.attachment.creation`    | Erstellungszeitpunkt des eigentlichen Dokuments               |

Dabei ist zwischen dem Erstellungszeitpunkt des Dokuments und dem Erstellungszeitpunkt der `DocumentReference` zu unterscheiden.

`content.attachment.creation` bezeichnet den **Erstellungszeitpunkt des referenzierten Dokuments**.

`DocumentReference.date` bezeichnet dagegen den **Zeitpunkt, zu dem der Anhang in EMIGA erstellt bzw. als `DocumentReference` angelegt wurde**.

Über `DocumentReference.author` wird die Person referenziert, die den Anhang in EMIGA erstellt hat.

### Identifikation

Ein Anhang kann über `DocumentReference.identifier` mit fachlichen oder technischen Identifiern versehen werden.

Je nach Verwendungskontext können beispielsweise EMIGA-spezifische Identifier oder weitere fachliche Referenznummern zur Identifikation und Zuordnung eines Dokuments verwendet werden.

Die Identifier beziehen sich auf die `DocumentReference` und ermöglichen eine eindeutige Zuordnung des Anhangs innerhalb des jeweiligen Verarbeitungskontexts.

### Verwendung mit Annotationen

Anhänge werden als eigenständige `DocumentReference`-Ressourcen verwaltet und können von anderen FHIR-Ressourcen referenziert werden.

Bei Annotationen erfolgt die Verknüpfung über:

```text
Communication.payload.contentReference
```

Die Annotation enthält damit lediglich die Referenz auf den Anhang:

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

Eine Annotation kann neben ihrem textuellen Inhalt einen oder mehrere Anhänge referenzieren, sofern dies durch das jeweilige Profil zugelassen ist.

### Sicherheit und Verantwortlichkeit

Wie andere EMIGA-Ressourcen kann auch eine `AttachmentDocumentReference` über `meta.security` Angaben zur Sichtbarkeit und Verantwortlichkeit enthalten.

Hierüber kann insbesondere festgelegt werden,

* in welchem organisatorischen Kontext der Anhang sichtbar ist und
* welche Stelle für die Ressource verantwortlich ist.

Die Security Labels beziehen sich auf die `DocumentReference` und sind bei der Bereitstellung und

### Versionierung

Ein Anhang gilt als **neuer Anhang** und erhält eine neue Ressourcen-ID, wenn er unter einem neuen Namen bzw. Betreff (`content.attachment.title`) gespeichert wird. Dies gilt auch dann, wenn der Dateiinhalt gegenüber einem bereits vorhandenen Anhang unverändert ist.

Wird ein bestehender Anhang bearbeitet und unter demselben Namen bzw. Betreff gespeichert, behält er seine Ressourcen-ID und erhält eine **neue Version**.

Die Versionierung von Anhang und Annotation erfolgt unabhängig voneinander:

- Wird einer Annotation ein **neuer Anhang** hinzugefügt, entsteht eine neue Version der Annotation, da sich deren Referenzen ändern.
- Entsteht lediglich eine **neue Version eines bereits referenzierten Anhangs**, bleibt die Version der Annotation unverändert.


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

## Beispiel
Das folgende Beispiel zeigt einen Anhang, der als eigenständige `DocumentReference` in EMIGA verwaltet wird.

Bei dem Beispieldokument handelt es sich um eine PNG-Datei mit dem Titel:

```text
Sample Image
```

Die Datei wird über `DocumentReference.content.attachment` beschrieben. Neben dem MIME-Type `image/png` werden unter anderem die Dateigröße, ein Hashwert und der Erstellungszeitpunkt des Dokuments angegeben.

Der Anhang besitzt mehrere Identifier zur fachlichen Zuordnung:

| Identifier          | Beispielwert                   |
| ------------------- | ------------------------------ |
| EMIGA ID            | `DEFG-123456789`               |
| EMIGA File Number   | `ABCD-987654321`               |
| SurvNet File Number | `Attachment-SURVNET-987654321` |

Über:

```text
DocumentReference.author
```

wird mit:

```text
Practitioner/EmigaUser-001
```

der EMIGA-Benutzer referenziert, der den Anhang erstellt hat.

Die Ressource ist mit dem Status `current` als aktuell gültige Dokumentreferenz gekennzeichnet.

Über die Security Labels wird die Ressource außerdem als `transferable` gekennzeichnet und einer verantwortlichen Stelle zugeordnet.

Das Beispiel veranschaulicht damit insbesondere:

* die eigenständige Abbildung eines Anhangs als `DocumentReference`,
* die Identifikation über fachliche Identifier,
* die Beschreibung der Datei über `content.attachment`,
* die Angabe des Erstellers über `author`,
* die Unterscheidung zwischen `DocumentReference.date` und `Attachment.creation`,
* sowie die Steuerung von Sichtbarkeit und Verantwortlichkeit über `meta.security`.

<tabs>
    <tab title="Übersicht">      
        {{render:DocumentReference-441557620.json}}
    </tab>
    <tab title="XML">      
        {{xml:DocumentReference-441557620.json}}
    </tab>
    <tab title="JSON">
        {{json:DocumentReference-441557620.json}}
    </tab>
    <tab title="Link">
        {{link:DocumentReference-441557620.json}}
    </tab>
</tabs>

<!-- {{json: DocumentReference/441557620}} -->