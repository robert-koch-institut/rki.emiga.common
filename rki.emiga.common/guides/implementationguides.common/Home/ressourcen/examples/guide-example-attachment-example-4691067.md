# Example: Attachment DocumentReference – Technischer Datei-Anhang

## Beschreibung

Dieses Beispiel zeigt eine `DocumentReference`-Ressource zur Verwaltung eines konkreten Datei-Anhangs innerhalb von EMIGA.

Die Ressource beschreibt eine einzelne Datei und deren technische Metadaten. Die Datei selbst wird nicht direkt in der FHIR-Ressource gespeichert, sondern über `DocumentReference.content.attachment` referenziert.

Die Ressource verwendet das Profil:

```text
https://emiga.rki.de/fhir/common/StructureDefinition/AttachmentDocumentReference
```

## Beispiel-Szenario

Im Beispiel wird eine PDF-Datei als Anhang verwaltet.

Die Datei trägt den Titel:

> "test.pdf"

und besitzt folgende Eigenschaften:

* Dateiformat: PDF
* Dateigröße: 16.577 Bytes
* Erstellung der Datei: 13.01.2026 14:22:43 Uhr

Die Dokumentreferenz wurde am **12.01.2026 um 18:34:42 Uhr** erstellt.

## Technischer Datei-Kontext

Diese Form der `DocumentReference` dient zur eindeutigen Verwaltung eines einzelnen Datei-Anhangs.

Die Identifikation erfolgt über eine dedizierte Attachment-ID:

```text
EmigaAttachmentId
```

Damit kann die Datei unabhängig von fachlichen Vorgängen eindeutig referenziert werden.

## Identifikation

Das Attachment wird über folgende Identifier beschrieben:

| Identifier          | Wert                                   |
| ------------------- | -------------------------------------- |
| EMIGA Attachment ID | `4b5755cd-da8f-4b34-b78c-4b3ead465b39` |

Die `EmigaAttachmentId` stellt eine technische eindeutige Identifikation des gespeicherten Datei-Anhangs dar.

## Verwendung als referenzierbarer Anhang

Ein solcher Datei-Anhang kann durch andere FHIR-Ressourcen referenziert werden.

Beispielsweise kann eine fachliche Information auf dieses Dokument verweisen, indem die `DocumentReference` als Referenz genutzt wird.

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

Die Datei ist damit als aktuelle Dokumentreferenz verfügbar.

## Autor

Der Ersteller wird über `DocumentReference.author` angegeben.

Beispiel:

```text
Practitioner/EmigaUser-001
```

## Dateiinformationen

Die Dateimetadaten werden über:

```text
DocumentReference.content.attachment
```

bereitgestellt.

Beispiel:

| Element    | Wert                        |
| ---------- | --------------------------- |
| Dateityp   | `application/pdf`           |
| Dateigröße | `16577` Bytes               |
| Titel      | `test.pdf`                  |
| Erstellung | `2026-01-13T14:22:43+00:00` |

Zusätzlich wird ein Hashwert gespeichert, um die Integrität der Datei zu überprüfen.

## Sicherheit und Verantwortlichkeit

Die Ressource enthält Security Labels über `meta.security`.

Diese definieren:

* verantwortliche Stelle
* Sichtbarkeit beziehungsweise Weitergabemöglichkeit

Im Beispiel ist die Ressource als übertragbar (`transferable`) gekennzeichnet.

## Zusammenfassung

Dieses Beispiel zeigt eine `DocumentReference` für einen technischen Datei-Anhang mit:

* eindeutiger `EmigaAttachmentId`
* PDF-Datei als Anhang
* technischen Dateiinformationen
* Möglichkeit zur Referenzierung durch andere FHIR-Ressourcen
* Security Labels zur Steuerung von Verantwortlichkeit und Weitergabe

Der Fokus liegt auf der eindeutigen Verwaltung und Wiederverwendbarkeit eines einzelnen Datei-Anhangs innerhalb von EMIGA.
