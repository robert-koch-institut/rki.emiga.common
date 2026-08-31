# Beispiel: Annotation Communication

## Beschreibung

Dieses Beispiel zeigt eine `Communication`-Ressource zur Übermittlung einer Annotation bzw. eines Kommentars innerhalb von EMIGA.
Eine Annotation kann beispielsweise genutzt werden, um Hinweise, Kommentare oder ergänzende Informationen zu einem Fall bereitzustellen.

Die Ressource verwendet das Profil:

```id="3p8n8j"
https://emiga.rki.de/fhir/common/StructureDefinition/AnnotationCommunication
```

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

```id="j0f1x7"
https://emiga.rki.de/fhir/common/Extension/ProcessingStatus
```

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

Beispiel:

```id="e5k3s0"
2024-10-01T12:00:00+00:00
```

## Kategorie

Die Annotation wird über die Kategorie:

```id="d9m3x1"
Kommentar
```

klassifiziert.

Die Kategorie wird über das CodeSystem:

```id="l5r8v2"
https://emiga.rki.de/fhir/CodeSystem/AnnotationCategory
```

definiert.

Beispiel:

```json id="1n6f0m"
{
  "code": "comment",
  "display": "Kommentar"
}
```

## Bezug zu einem Vorgang

Die Annotation kann über `Communication.about` mit einem fachlichen Vorgang verknüpft werden.

Im Beispiel verweist die Annotation auf:

```id="3u4j9k"
Composition/example
```

Damit kann die Annotation einem bestehenden Dokument oder Fallkontext zugeordnet werden.

## Absender

Die Annotation wurde von einem EMIGA-Nutzende erstellt.

Der Absender wird über `Communication.sender` referenziert:

```id="9q2t6v"
Practitioner/EmigaUser-001
```

## Inhalt der Annotation
Als Inhalt enthält die Annotation im Beispiel zwei Payloads:

### Textuelle Beschreibung

```id="s8w1c4"
Das ist ein Test Beschreibung
```

Dieser Inhalt enthält die eigentliche fachliche Annotation.

### Referenziertes Dokument

Zusätzlich wird ein Dokument über eine Referenz eingebunden:

```id="k7p5d2"
DocumentReference/Attachment-4691067
```

Dadurch können weiterführende Informationen oder Anhänge mit der Annotation verknüpft werden.

## Sicherheit und Datenschutz

Die Ressource enthält Security Labels über `meta.security`.

Diese definieren:

* verantwortliche Organisation bzw. Zuständigkeit
* Sichtbarkeit und Weitergabemöglichkeiten der Information

Im Beispiel wird die Ressource als übertragbar (`transferable`) gekennzeichnet.

Zusätzlich wird über `meta.tag` angegeben, dass die Ressource personenbezogene Informationen enthält:

```json id="r2v8m6"
{
  "code": "ContainsPersonalInformation",
  "display": "Enthält personenbezogene Daten"
}
```

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