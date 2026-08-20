# Example: Attachment DocumentReference – Fachlicher Dokumentanhang

## Beispiel (Attachment 441557620)
Das folgende Beispiel zeigt einen Anhang, der als eigenständige `DocumentReference` in EMIGA verwaltet wird.

Bei dem Beispieldokument handelt es sich um eine PNG-Datei mit dem Titel:

```text
Sample Image
```

Die technische Informationen wird über `DocumentReference.content.attachment` beschrieben. Neben dem MIME-Type `image/png` werden unter anderem die Dateigröße, ein Hashwert und der Erstellungszeitpunkt des Dokuments angegeben.

Der Anhang besitzt zudem mehrere Identifier zur fachlichen Zuordnung:

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

Über die Security Labels wird die Ressource außerdem als `transferable` gekennzeichnet und einer verantwortlichen ÖGD-Stelle zugeordnet.

Das Beispiel veranschaulicht damit insbesondere:

* die Abbildung eines Anhangs als `DocumentReference`,
* die Identifikation-Vergabe über fachliche Identifier,
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

------
------

## Beschreibung

Dieses Beispiel zeigt eine `DocumentReference`-Ressource zur Verwaltung eines Dokuments als Bestandteil eines EMIGA-Fachvorgangs.

Die Ressource beschreibt einen Anhang und stellt die zugehörigen Metadaten bereit. Die eigentlichen Dateiinhalte werden nicht direkt in der `DocumentReference` gespeichert, sondern über die Elemente unter `DocumentReference.content.attachment` beschrieben.

Die Ressource verwendet das Profil:

```text
https://emiga.rki.de/fhir/common/StructureDefinition/AttachmentDocumentReference
```

## Beispiel-Szenario

Im Beispiel wird ein Bilddokument innerhalb von EMIGA verwaltet.

Das Dokument trägt den Titel:

> "Sample Image"

und liegt im Format PNG vor.

Die Datei wurde am **13.01.2026 um 14:22:43 Uhr** erstellt.

Die Dokumentreferenz wurde am **01.10.2023 um 12:00:00 Uhr** angelegt und durch einen EMIGA-Benutzer erstellt.

## Fachlicher Kontext

Diese Form der `DocumentReference` dient zur Beschreibung eines fachlich zugeordneten Dokuments.

Die Ressource enthält mehrere Identifier, um die Zuordnung zu unterschiedlichen Fachkontexten und bestehenden Vorgängen zu ermöglichen.

Dadurch kann das Dokument beispielsweise über verschiedene interne oder fachliche Referenznummern wiedergefunden werden.

## Identifikation

Das Dokument wird über mehrere Identifier beschrieben:

| Identifier          | Wert                           |
| ------------------- | ------------------------------ |
| EMIGA ID            | `DEFG-123456789`               |
| EMIGA File Number   | `ABCD-987654321`               |
| SurvNet File Number | `Attachment-SURVNET-987654321` |

Die Identifier dienen der eindeutigen Zuordnung des Dokuments innerhalb verschiedener Verarbeitungskontexte.

## Status

Der aktuelle Zustand der Dokumentreferenz wird über:

```text
DocumentReference.status
```

angegeben.

Im Beispiel:

```json
{
  "status": "current"
}
```

Die Dokumentreferenz beschreibt damit ein aktuell gültiges Dokument.

## Autor

Der Ersteller des Dokuments wird über `DocumentReference.author` angegeben.

Beispiel:

```text
Practitioner/EmigaUser-001
```

Damit kann nachvollzogen werden, welcher EMIGA-Benutzer das Dokument eingestellt hat.

## Dateiinformationen

Die technischen Informationen zur Datei werden über:

```text
DocumentReference.content.attachment
```

bereitgestellt.

Beispiel:

| Element    | Wert                        |
| ---------- | --------------------------- |
| Dateityp   | `image/png`                 |
| Dateigröße | `13577` Bytes               |
| Titel      | `Sample Image`              |
| Erstellung | `2026-01-13T14:22:43+00:00` |

Zusätzlich wird ein Hashwert angegeben, um die Integrität der Datei prüfen zu können.

## Sicherheit und Verantwortlichkeit

Die Ressource enthält Security Labels über `meta.security`.

Diese beschreiben:

* die verantwortliche Stelle
* die Sichtbarkeit beziehungsweise Weitergabemöglichkeit des Dokuments

Im Beispiel ist das Dokument als übertragbar (`transferable`) gekennzeichnet.

## Zusammenfassung

Dieses Beispiel zeigt eine `DocumentReference` für einen fachlich zugeordneten Dokumentanhang mit:

* mehreren fachlichen Identifiern
* Beschreibung einer Bilddatei
* Informationen zum Ersteller
* Dateimetadaten
* Security Labels zur Steuerung von Zugriff und Weitergabe

Der Fokus liegt auf der fachlichen Zuordnung und Nachvollziehbarkeit eines Dokuments innerhalb von EMIGA.
