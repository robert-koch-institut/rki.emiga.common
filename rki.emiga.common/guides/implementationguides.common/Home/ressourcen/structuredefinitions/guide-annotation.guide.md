---
topic: AnnotationCommunication
canonical: https://emiga.rki.de/fhir/common/StructureDefinition/AnnotationCommunication
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
Das Profil `AnnotationCommunication` basiert auf der FHIR-Ressource `Communication` und dient der Abbildung einer **Annotation** zu einer fachlichen Entität innerhalb von EMIGA.

Eine Annotation ermöglicht es, ergänzende fachliche Informationen, Hinweise oder Kommentare zu einem bestehenden fachlichen EMIGA-Entität zu erfassen. Eine Annotation wird als eigenständige FHIR-Ressource verwaltet und kann neben einem Betreff und textuellen Inhalten auch Referenzen auf Anhänge enthalten.

Die grundlegende Struktur einer Annotation ist:

```text
AnnotationCommunication
        │
        ├── about ──────────────► fachliche Entität
        │
        ├── topic.text ─────────► Betreff
        │
        ├── payload
        │     ├── contentString ─► Textinhalt
        │     └── contentReference
        │              │
        │              ▼
        │       AttachmentDocumentReference
        │
        └── sender ─────────────► EmigaUserPractitioner
```

### Bezug zu einer fachlichen Entität

Über:

```text
Communication.about
```

wird angegeben, **auf welche fachliche Entität sich die Annotation bezieht** (die fachliche Verknüpfung zum Gegenstand der Annotation).

### Betreff

Der Betreff einer Annotation wird über:

```text
Communication.topic.text
```

angegeben.

Der Betreff dient als kurze, menschenlesbare Bezeichnung des Inhalts der Annotation.

Beispiel:

```text
Test Betreff
```

### Inhalt der Annotation

Der eigentliche Inhalt einer Annotation wird über `Communication.payload` abgebildet.

Dabei können insbesondere zwei Arten von Inhalten unterschieden werden.

#### Textueller Inhalt

Ein textueller Kommentar wird über `Communication.payload.contentString` angegeben.

#### Anhänge
Eine Anhang-Datei wird nicht unmittelbar innerhalb der Annotation gespeichert, sondern als eigenständige Ressource des Profils `AttachmentDocumentReference` angelegt und über `Communication.payload.contentReference` aus einer Annotation referenziert.

```text
AnnotationCommunication
        │
        │ payload.contentReference
        ▼
AttachmentDocumentReference
        │
        │ content.attachment.url
        ▼
     Dateiinhalt
```

Durch diese Trennung können Annotation und Anhang jeweils als eigenständige Ressourcen verwaltet und unabhängig voneinander versioniert werden.

### Kategorie

Über `Communication.category` wird die fachliche Kategorie der Annotation angegeben.

Im Beispiel wird die Annotation als:

```text
comment – Kommentar
```

klassifiziert.

Die Kategorie ermöglicht die fachliche Unterscheidung verschiedener Arten von Annotationen entsprechend der im Profil vorgesehenen Terminologie.

### Erstellende Person

Die Person, die eine Annotation erstellt hat, wird über:

```text
Communication.sender
```

referenziert.

Die Referenz verweist auf einen `EmigaUserPractitioner`, und wurde erstellt von

```text
Practitioner/EmigaUser-001
```

### Erstellungszeitpunkt

Der Erstellungszeitpunkt der Annotation wird über die EMIGA-Extension:

```text
https://emiga.rki.de/fhir/common/Extension/DateCreated
```

angegeben.

### Sendezeitpunkt
Davon zu unterscheiden ist `Communication.sent`. Dieses Element beschreibt in EMIGA den Zeitpunkt, zu dem die Annotation fachlich bereitgestellt wurde.
Die beiden Zeitangaben beschreiben damit unterschiedliche Aspekte im Lebenszyklus einer Annotation.

### Fachlicher Bearbeitungsstatus vs. "FHIR-Status"
Bei einer Annotation sind der technische FHIR-Status und der fachliche Bearbeitungsstatus voneinander zu unterscheiden.

Der FHIR-Status `Communication.status` ist im Profil fest auf `text
completed` gesetzt.

Dieser Status beschreibt den Zustand der `Communication` als FHIR-Ressource und wird <u>nicht</u> zur Abbildung des fachlichen Bearbeitungszustands der Annotation verwendet.

Der fachliche Bearbeitungsstatus wird stattdessen über die EMIGA-Extension:

```text
https://emiga.rki.de/fhir/common/Extension/ProcessingStatus
```

geführt.


| Element                | Bedeutung                                    | Bemerkung |
| ---------------------- | -------------------------------------------- | --------- |
| `Communication.status` | technischer Status der FHIR-Communication    | immer fest, not used |
| `ProcessingStatus`     | fachlicher Bearbeitungsstatus der Annotation | wird genutzt |

Im Beispiel lautet der fachliche Bearbeitungsstatus `forinformation – Zur Kenntnis`.

### Identifikation

Eine Annotation kann über `Communication.identifier` mit EMIGA-spezifischen und weiteren fachlichen Identifiern versehen werden, damit sie eindeutig identifiziert und unter unterschiedlichen Verarbeitungskontexten zugeordnet werden.

Im Beispiel werden Identifier aus folgenden Name Space verwendet:

* `EmigaID`
* `EmigaFileNumber`
* `SurvNetFileNumber`

### Personenbezogene Daten
Über `Communication.meta.tag` kann gekennzeichnet werden, dass eine Annotation personenbezogene Informationen in Sinne von DSGVO enthält.

Im Beispiel wird hierfür folgende Kennzeichnung verwendet:

```text
ContainsPersonalInformation – Enthält personenbezogene Daten
```

Die Kodierung erfolgt über das EMIGA-CodeSystem:

```text
https://emiga.rki.de/fhir/common/CodeSystem/PersonalInformation
```

Damit kann bereits auf Ressourcenebene kenntlich gemacht werden, dass bei der Verarbeitung der Annotation personenbezogene Informationen zu berücksichtigen sind.

### Versionierung von Annotation und Anhängen

Annotationen und ihre Anhänge werden jeweils als eigenständige FHIR-Ressourcen verwaltet und daher unabhängig voneinander versioniert.

- Wird der textuelle Inhalt, der Betreff (Frage: Betriff ist also nicht Titel?) oder eine andere Information der Annotation geändert, entsteht eine neue Version der `Communication`.

- Wird einer Annotation ein neuer Anhang hinzugefügt oder eine bestehende Referenz entfernt, ändert sich `Communication.payload`. Dadurch entsteht ebenfalls eine neue Version der Annotation.

- Wird dagegen lediglich eine neue Version eines bereits referenzierten `AttachmentDocumentReference` erstellt und bleibt dessen Ressourcen-ID unverändert, muss die Annotation nicht geändert werden.

Vereinfacht:

| Änderung                                              | Neue Version der Annotation |
| ----------------------------------------------------- | --------------------------- |
| Betreff geändert                                      | ja <#TODO: check: correct?>          |
| Textinhalt geändert                                   | ja                          |
| neuer Anhang hinzugefügt                              | ja                          |
| Anhang entfernt                                       | ja                          |
| Referenz auf einen anderen Anhang geändert            | ja                          |
| neue Version desselben bereits referenzierten Anhangs | nein                        |

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


<TODO>Note for me:
- annotation meta.reference: Person, die das Event als letzes bearbeite hab

- code: ebenfalls: in FHIR ist "type" must-support. diese wird standardmäßig auf "Note" gesetzt.
- Annotation.status: ebenfalls ein modelbedingte Angabe. wird immer mit der Wert "completed" belegt.
- Annotation.sent: das hier ist ein frei wählbares Datum" (warum freiwähbar??)
- Annotation.creation (von attachment): Datum des Hochladens des Anhangs (??)
