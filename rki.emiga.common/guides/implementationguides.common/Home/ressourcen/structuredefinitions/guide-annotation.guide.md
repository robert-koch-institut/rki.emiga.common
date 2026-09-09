---
topic: AnnotationCommunication
canonical: https://emiga.rki.de/fhir/common/StructureDefinition/AnnotationCommunication
---

# {{page-title}}

## Beschreibung

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

Die Ressource enthält insbesondere folgende fachliche Informationen:

| Element                      | Bedeutung                                                                                                       |
| ---------------------------- | --------------------------------------------------------------------------------------------------------------- |
| `identifier`                 | Fachliche Identifikatoren der Annotation, beispielsweise EMIGA-Aktenzeichen oder SurvNet-Aktenzeichen.          |
| `meta.security`              | Verantwortlichkeit und Sichtbarkeit der Ressource, u. a. `ResourceResponsibility` und `ResourceVisibilityType`. |
| `meta.tag`                   | Kennzeichnung personenbezogener Daten.                                                                          |
| `extension:ProcessingStatus` | Fachlicher Bearbeitungsstatus der Annotation.                                                                   |
| `extension:DateCreated`      | Zeitpunkt der initialen Erstellung der Annotation.                                                              |
| `category`                   | Kategorie der Annotation, beispielsweise Kommentar oder Notiz.                                                  |
| `topic.text`                 | Betreff der Annotation.                                                                                         |
| `about`                      | Referenz auf die fachliche Bezugsentität.                                                                       |
| `sent`                       | Fachliches bzw. benutzerdefiniertes Datum der Annotation.                                                       |
| `sender`                     | Erstellende Person als Referenz auf `EmigaUserPractitioner`.                                                    |
| `payload.contentString`      | Textueller Inhalt der Annotation.                                                                               |
| `payload.contentReference`   | Referenz auf einen Anhang als `AttachmentDocumentReference`.                                                    |

### Inhalt einer Annotation

Der eigentliche Inhalt einer Annotation wird über `AnnotationCommunication.payload` abgebildet. Eine Annotation kann textuelle Inhalte und Anhänge enthalten.

Über `payload.content[x]` sind ausschließlich die Datentypen `string` und `Reference(AttachmentDocumentReference)` vorgesehen.

Textuelle Inhalte werden über `payload.contentString` abgebildet. Anhänge werden als eigenständige `AttachmentDocumentReference`-Ressourcen modelliert und über `payload.contentReference` referenziert.

Eine Annotation kann mehrere `payload`-Elemente enthalten und damit beispielsweise Textinhalte und mehrere Anhänge miteinander kombinieren.

### Bezug zu einer fachlichen Entität

Über `AnnotationCommunication.about` wird angegeben, auf welche fachliche Entität sich die Annotation bezieht. Hierüber kann eine Annotation beispielsweise einem Fall, einem Ausbruch oder einer Person zugeordnet werden.

Die Referenz beschreibt damit, **worauf sich die Annotation fachlich bezieht**.

`Communication.subject` wird für diesen Zweck nicht verwendet und ist im Profil ausgeschlossen.

### Betreff

Der Betreff einer Annotation wird über `topic.text` angegeben.

Der Betreff dient als kurze, menschenlesbare Bezeichnung des Inhalts der Annotation.

Eine codierte Abbildung über `topic.coding` ist nicht vorgesehen.

### Kategorie der Annotation

Über `category` wird die **Kategorie der Annotation** angegeben.

Die zulässigen Kategorien werden durch das ValueSet `AnnotationCategoryVS` festgelegt und ermöglichen die fachliche Unterscheidung verschiedener Arten von Annotationen.

### Erstellende Person

Über `sender` wird die Person referenziert, die die Annotation erstellt hat.

Die Referenz ist auf das Profil `EmigaUserPractitioner` eingeschränkt.

### Datum und Erstellungszeitpunkt

Bei den Datumsangaben einer Annotation sind unterschiedliche Bedeutungen zu unterscheiden.

`sent` enthält das fachliche bzw. benutzerdefinierte Datum der Annotation.

Die Extension `DateCreated` bildet dagegen den Zeitpunkt der initialen Erstellung der Annotation ab.

Die beiden Zeitangaben beschreiben damit unterschiedliche Aspekte im Lebenszyklus einer Annotation.

### Bearbeitungsstatus der Annotation

Bei einer Annotation sind der technische FHIR-Status und der fachliche Bearbeitungsstatus voneinander zu unterscheiden.

Der FHIR-Status `Communication.status` ist im Profil fest auf `completed` gesetzt. Er beschreibt den technischen Zustand der `Communication`-Ressource und wird **nicht** zur Abbildung des fachlichen Bearbeitungsstatus verwendet.

Der fachliche Bearbeitungsstatus wird stattdessen über die Extension `ProcessingStatus` abgebildet.

| Element                | Bedeutung                                    | Verwendung              |
| ---------------------- | -------------------------------------------- | ----------------------- |
| `Communication.status` | Technischer Status der FHIR-Communication    | fest auf `completed`    |
| `ProcessingStatus`     | Fachlicher Bearbeitungsstatus der Annotation | wird fachlich verwendet |

Mögliche fachliche Bearbeitungsstatus sind beispielsweise `inprogress`, `closed`, `cancelled`, `handedover`, `inhandover`, `intakeover` oder `forinformation`.

### Identifikatoren

Eine Annotation kann über `Communication.identifier` mit EMIGA-spezifischen und weiteren fachlichen Identifikatoren versehen werden.

Hierdurch kann sie eindeutig identifiziert und unterschiedlichen Verarbeitungskontexten zugeordnet werden.

Folgende Identifier-Systeme können beispielsweise verwendet werden:

* `EmigaID`
* `EmigaFileNumber`
* `SurvNetFileNumber`

### Kennzeichnung personenbezogener Daten

Über `meta.tag` kann gekennzeichnet werden, dass eine Annotation personenbezogene Informationen im Sinne der DSGVO enthält.

Damit kann bereits auf Ressourcenebene kenntlich gemacht werden, dass bei der Verarbeitung der Annotation personenbezogene Informationen berücksichtigt werden müssen.

Die zulässigen Werte werden durch die hierfür vorgesehene EMIGA-Terminologie festgelegt.

### Sichtbarkeit und Verantwortlichkeit

Die Sichtbarkeit und Verantwortlichkeit einer Annotation wird über `meta.security` gekennzeichnet.

Für Annotationen sind insbesondere Sichtbarkeitsangaben wie `inAgency` und `transferable` relevant. Sie geben an, ob eine Annotation innerhalb der eigenen ÖGD-Stelle verbleibt oder gemeinsam mit der zugehörigen Hauptentität, beispielsweise einem Fall oder Ausbruch, an andere Stellen übermittelt werden darf.

### Anhänge

Anhänge werden als eigenständige Ressourcen des Profils `AttachmentDocumentReference` abgebildet und über `payload.contentReference` mit der Annotation verknüpft.

Die eigentlichen Binärdaten werden nicht unmittelbar innerhalb der Annotation geführt.

Informationen wie Dateigröße, Hashwert, Titel, MIME-Type und Erstellungszeitpunkt unterstützen die Integrität und Nachvollziehbarkeit eines Anhangs.

## Interoperabilitätshinweise

Der fachliche Bearbeitungsstatus einer Annotation ist ausschließlich der Extension `ProcessingStatus` zu entnehmen. `Communication.status` ist im Profil fest auf `completed` gesetzt und darf nicht zur Interpretation des fachlichen Bearbeitungszustands verwendet werden.

Die Sichtbarkeit und Übertragbarkeit einer Annotation wird über `meta.security` gesteuert. Clients müssen diese Angaben insbesondere bei Anzeige, Weitergabe und Übermittlung berücksichtigen.

Annotationen können personenbezogene Daten enthalten. Die entsprechende Kennzeichnung über `meta.tag` sollte bei Anzeige, Übermittlung, Export und Protokollierung berücksichtigt werden.

Anhänge werden über `AttachmentDocumentReference` referenziert und nicht direkt als Binärdaten innerhalb der `AnnotationCommunication` übertragen.

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

# Beispiel

Dieses Beispiel zeigt eine `Communication`-Ressource zur Übermittlung einer Annotation bzw. eines Kommentars innerhalb von EMIGA.
Eine Annotation kann beispielsweise genutzt werden, um Hinweise, Kommentare oder ergänzende Informationen zu einem Fall bereitzustellen.

Die Ressource verwendet das Profil

> https://emiga.rki.de/fhir/common/StructureDefinition/AnnotationCommunication

## Beispiel-Szenario

Im Beispiel erstellt ein EMIGA-Benutzer eine Annotation mit dem Betreff:

> "Test Betreff"

Die Annotation enthält eine textuelle Beschreibung:

> "Das ist ein Test Beschreibung"

Zusätzlich wird eine Referenz auf ein zugehöriges Dokument angegeben.

Die Annotation wurde am **01.10.2024 um 12:00 Uhr** erstellt und befindet sich im Status **"Zur Kenntnis"**.

## Identifikation der Annotation

Die Annotation wird über mehrere Identifier eindeutig referenziert:

| Identifier          | Beispielwert                   |
| ------------------- | ------------------------------ |
| EMIGA ID            | `Annotation-DEFG-123456789`    |
| EMIGA File Number   | `AnnotationABCD-987654321`     |
| SurvNet File Number | `Annotation-SURVNET-987654321` |

Diese Identifier ermöglichen die Zuordnung der Annotation zu unterschiedlichen Fachkontexten und bestehenden Vorgängen.

## Status und Verarbeitung

Der aktuelle Verarbeitungsstatus wird über die Extension:

> https://emiga.rki.de/fhir/common/Extension/ProcessingStatus


angegeben.

Im Beispiel besitzt die Annotation den Status:

```json id="7j9i2s"
{
  "code": "forinformation",
  "display": "Zur Kenntnis"
}
```

Das Erstellungsdatum wird über die Extension:

```id="f7h4o8"
https://emiga.rki.de/fhir/common/Extension/DateCreated
```

dokumentiert.
Beispiel `2024-10-01T12:00:00+00:00`

## Kategorie

Die Annotation wird über die Kategorie `Kommentar` klassifiziert.

Die Kategorie wird über das CodeSystem `https://emiga.rki.de/fhir/CodeSystem/AnnotationCategory` definiert. Beispiel:
   - "code": "comment",
   - "display": "Kommentar"

## Bezug zu einem Vorgang

Die Annotation kann über `Communication.about` mit einem fachlichen Vorgang verknüpft werden.

Im Beispiel verweist die Annotation auf `Composition/example`. Damit kann die Annotation einem bestehenden Dokument oder Fallkontext zugeordnet werden.

## Absender

Die Annotation wurde von einem EMIGA-Nutzende erstellt.
Der Absender wird über `Communication.sender` referenziert `Practitioner/EmigaUser-001`.

## Inhalt der Annotation
Als Inhalt enthält die Annotation im Beispiel zwei Payloads. 
Die textuelle Beschreibung `Das ist ein Test Beschreibung` enthält die eigentliche fachliche Annotation.

Zusätzlich wird ein Dokument über eine Referenz eingebunden `DocumentReference/Attachment-4691067`.
Dadurch können weiterführende Informationen oder Anhänge mit der Annotation verknüpft werden.

## Sicherheit und Datenschutz

Die Ressource enthält Security Labels über `meta.security`.
Diese definieren:

* verantwortliche Organisation bzw. Zuständigkeit
* Sichtbarkeit und Weitergabemöglichkeiten der Information

Im Beispiel wird die Ressource als übertragbar (`transferable`) gekennzeichnet.

Zusätzlich wird über `meta.tag` angegeben, dass die Ressource personenbezogene Informationen enthält:
- "code": "ContainsPersonalInformation",
- "display": "Enthält personenbezogene Daten"

Damit wird transparent gemacht, dass bei der Verarbeitung der Annotation Datenschutzanforderungen berücksichtigt werden müssen.

## Zusammenfassung

Dieses Beispiel zeigt eine vollständige Annotation-Kommunikation mit:

* eindeutiger Identifikation über EMIGA- und SurvNet-Identifier
* fachlicher Klassifikation als Kommentar
* Verarbeitungsstatus "Zur Kenntnis"
* Erstellungsdatum
* Referenz zu einem fachlichen Kontext
* textuellem Kommentar
* optionaler Dokumentreferenz
* Security Labels zur Steuerung von Zugriff und Weitergabe

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