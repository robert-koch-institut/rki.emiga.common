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
Das Profil `AnnotationCommunication` basiert auf der FHIR-Ressource `Communication` und dient der Abbildung einer **Annotation zu einer fachlichen Entität innerhalb von EMIGA**.

Eine Annotation ermöglicht es, ergänzende fachliche Informationen, Hinweise oder Kommentare zu einem bestehenden fachlichen Kontext zu erfassen. Sie wird als eigenständige FHIR-Ressource verwaltet und kann neben einem Betreff und textuellen Inhalten auch Referenzen auf Anhänge enthalten.

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

wird angegeben, **auf welche fachliche Entität sich die Annotation bezieht**.

Die Annotation bleibt dabei eine eigenständige Ressource. `about` stellt lediglich die fachliche Verknüpfung zum Gegenstand der Annotation her.

Damit kann beispielsweise ein Kommentar oder Hinweis einem bestehenden fachlichen Vorgang zugeordnet werden, ohne dass der Inhalt der Annotation unmittelbar Bestandteil der referenzierten Ressource werden muss.

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

Der eigentliche Inhalt einer Annotation wird über:

```text
Communication.payload
```

abgebildet.

Dabei können insbesondere zwei Arten von Inhalten unterschieden werden.

#### Textueller Inhalt

Ein textueller Kommentar wird über:

```text
Communication.payload.contentString
```

angegeben.

Damit können beispielsweise fachliche Hinweise, Kommentare oder ergänzende Informationen unmittelbar innerhalb der Annotation dokumentiert werden.

#### Anhänge

Dateien werden nicht unmittelbar innerhalb der Annotation gespeichert.

Ein Anhang wird als eigenständige Ressource des Profils:

```text
AttachmentDocumentReference
```

angelegt und über:

```text
Communication.payload.contentReference
```

referenziert.

Die Annotation enthält somit nur die Referenz auf den zugehörigen Anhang:

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

Durch diese Trennung können Annotation und Anhang als eigenständige Ressourcen verwaltet und unabhängig voneinander versioniert werden.

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

Die Referenz verweist auf einen `EmigaUserPractitioner`.

Damit wird nicht die Person beschrieben, **über die** eine fachliche Information vorliegt, sondern die handelnde Person, die die Annotation innerhalb von EMIGA erstellt hat.

Beispiel:

```text
Practitioner/EmigaUser-001
```

### Erstellungszeitpunkt

Der Erstellungszeitpunkt der Annotation wird über die EMIGA-Extension:

```text
https://emiga.rki.de/fhir/common/Extension/DateCreated
```

angegeben.

Davon zu unterscheiden ist `Communication.sent`. Dieses Element beschreibt den Zeitpunkt, zu dem die Kommunikation gesendet beziehungsweise fachlich bereitgestellt wurde.

Sofern beide Angaben vorhanden sind, beschreiben sie unterschiedliche Aspekte des Lebenszyklus der Annotation.

### FHIR-Status und fachlicher Bearbeitungsstatus

Bei einer Annotation sind der technische FHIR-Status und der fachliche Bearbeitungsstatus voneinander zu unterscheiden.

Der FHIR-Status:

```text
Communication.status
```

ist im Profil fest auf:

```text
completed
```

gesetzt.

Dieser Status beschreibt den Zustand der `Communication` als FHIR-Ressource und wird nicht zur Abbildung des fachlichen Bearbeitungszustands der Annotation verwendet.

Der fachliche Bearbeitungsstatus wird stattdessen über die EMIGA-Extension:

```text
https://emiga.rki.de/fhir/common/Extension/ProcessingStatus
```

geführt.

Damit gilt:

| Element                | Bedeutung                                    |
| ---------------------- | -------------------------------------------- |
| `Communication.status` | technischer Status der FHIR-Communication    |
| `ProcessingStatus`     | fachlicher Bearbeitungsstatus der Annotation |

Im Beispiel lautet der fachliche Bearbeitungsstatus:

```text
forinformation – Zur Kenntnis
```

Die Annotation ist damit technisch abgeschlossen (`completed`), während `forinformation` ihre fachliche Einordnung beziehungsweise den vorgesehenen Umgang mit der Annotation beschreibt.

### Identifikation

Eine Annotation kann über `Communication.identifier` mit EMIGA-spezifischen und weiteren fachlichen Identifiern versehen werden.

Damit kann die Annotation eindeutig identifiziert und unterschiedlichen Verarbeitungskontexten zugeordnet werden.

Im Beispiel werden Identifier aus folgenden Namensräumen verwendet:

* `EmigaID`
* `EmigaFileNumber`
* `SurvNetFileNumber`

Die Identifier beziehen sich auf die Annotation selbst.

### Personenbezogene Daten

Über `Communication.meta.tag` kann gekennzeichnet werden, dass eine Annotation personenbezogene Informationen enthält.

Im Beispiel wird hierfür folgende Kennzeichnung verwendet:

```text
ContainsPersonalInformation – Enthält personenbezogene Daten
```

Die Kodierung erfolgt über das EMIGA-CodeSystem:

```text
https://emiga.rki.de/fhir/common/CodeSystem/PersonalInformation
```

Damit kann bereits auf Ressourcenebene kenntlich gemacht werden, dass bei der Verarbeitung der Annotation personenbezogene Informationen zu berücksichtigen sind.

### Sicherheit und Verantwortlichkeit

Über `Communication.meta.security` werden die Sichtbarkeit und Verantwortlichkeit der Annotation beschrieben.

Hierüber kann insbesondere festgelegt werden,

* in welchem organisatorischen Kontext die Annotation sichtbar beziehungsweise übertragbar ist und
* welche Stelle für die Ressource verantwortlich ist.

Im Beispiel ist die Annotation über den `ResourceVisibilityType` als:

```text
transferable
```

gekennzeichnet.

Die Security Labels sind bei der Verarbeitung der Annotation sowie der von ihr referenzierten Ressourcen zu berücksichtigen.

### Versionierung von Annotation und Anhängen

Annotationen und ihre Anhänge werden als eigenständige FHIR-Ressourcen verwaltet und daher unabhängig voneinander versioniert.

Wird der textuelle Inhalt, der Betreff oder eine andere Information der Annotation geändert, entsteht eine neue Version der `Communication`.

Wird einer Annotation ein neuer Anhang hinzugefügt oder eine bestehende Referenz entfernt, ändert sich `Communication.payload`. Dadurch entsteht ebenfalls eine neue Version der Annotation.

Wird dagegen lediglich eine neue Version eines bereits referenzierten `AttachmentDocumentReference` erstellt und bleibt dessen Ressourcen-ID unverändert, muss die Annotation nicht geändert werden.

Vereinfacht:

| Änderung                                              | Neue Version der Annotation |
| ----------------------------------------------------- | --------------------------- |
| Betreff geändert                                      | ja                          |
| Textinhalt geändert                                   | ja                          |
| neuer Anhang hinzugefügt                              | ja                          |
| Anhang entfernt                                       | ja                          |
| Referenz auf einen anderen Anhang geändert            | ja                          |
| neue Version desselben bereits referenzierten Anhangs | nein                        |

Damit können Annotation und Anhang unabhängig voneinander fortgeschrieben werden.
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

## Beispiel
Das folgende Beispiel zeigt eine Annotation, die als eigenständige `Communication`-Ressource innerhalb von EMIGA verwaltet wird.

Die Annotation besitzt den Betreff:

```text
Test Betreff
```

und enthält als textuellen Inhalt:

```text
Das ist ein Test Beschreibung
```

Über:

```text
Communication.about
```

wird die Annotation mit:

```text
Composition/example
```

in einen fachlichen Kontext gestellt.

Als Ersteller wird über `Communication.sender` der EMIGA-Benutzer:

```text
Practitioner/EmigaUser-001
```

referenziert.

Die Annotation ist fachlich als:

```text
comment – Kommentar
```

klassifiziert und besitzt den Bearbeitungsstatus:

```text
forinformation – Zur Kenntnis
```

Zusätzlich zum textuellen Inhalt enthält die Annotation eine Referenz auf einen Anhang:

```text
DocumentReference/Attachment-4691067
```

Der Anhang wird nicht innerhalb der Annotation gespeichert, sondern als eigenständige `AttachmentDocumentReference` verwaltet und über `payload.contentReference` referenziert.

Das Beispiel veranschaulicht damit insbesondere:

* die eigenständige Abbildung einer Annotation als `Communication`,
* die Zuordnung zu einer fachlichen Entität über `about`,
* die Angabe eines Betreffs über `topic.text`,
* die Abbildung eines textuellen Inhalts über `payload.contentString`,
* die Referenzierung eines eigenständigen Anhangs über `payload.contentReference`,
* die Referenz auf den erstellenden EMIGA-Benutzer über `sender`,
* die Trennung zwischen FHIR-Status und fachlichem Bearbeitungsstatus,
* die Kennzeichnung personenbezogener Inhalte,
* sowie die Steuerung von Sichtbarkeit und Verantwortlichkeit über `meta.security`.

<tabs>
    <tab title="Übersicht">      
        {{render:Communication441557618.json}}
    </tab>
    <tab title="XML">      
        {{xml:Communication441557618.json}}
    </tab>
    <tab title="JSON">
        {{json:Communication441557618.json}}
    </tab>
    <tab title="Link">
        {{link:Communication441557618.json}}
    </tab>
</tabs>

<!-- {{json: Communication/441557618}} -->

<TODO>Note for me:
- annotation meta.reference: Person, die das Event als letzes bearbeite hab
- status: in FHIR muss ein Status angegeben werden. dieser wird bei EMIGA standardmäßig auf "final" gesetzt. Feld nicht aktiv benutzt.
- code: ebenfalls: in FHIR ist "type" must-support. diese wird standardmäßig auf "Note" gesetzt.
- Gender: bei Geschlcht der Person sind Werte male, female, other und Divers zur Wahl.
- Annotation.status: ebenfalls ein modelbedingte Angabe. wird immer mit der Wert "completed" belegt.
- Annotation.sent: das hier ist ein frei wählbares Datum"
- Annotation.creation (von attachment): Datum des Hochladens des Anhangs (??)
- Anhang.date: Zeitpunkt der Erstellung des anhangs. Dies ist nicht der Zeitpunkt der Erstellung des Anhangdokuments, sondern der Zeitpunkt, wann der Anhang erstellt wurde.
- Person: anscheinend ist Person die übergeordnete/generische Class. daraus kann über "link" sowhol RelatedPerson als auch Patient dargestellt werden:
    - Link zu einer Bezugsperson (Related Person) Resource die die selbe Person darstellt.
    - Link zu einer betroffenen Person (Patient) Resource die die selbe Person darstellt.