# Beispiel: Anhangsdokument 4691067

Dieses Beispiel zeigt eine `DocumentReference`-Ressource zur Verwaltung eines Datei-Anhangs innerhalb von EMIGA.
Die Datei selbst wird nicht in der FHIR-Ressource gespeichert, sondern über `DocumentReference.content.attachment` referenziert.

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
<TODO: check Datum richtigkeit:>
Die Dokumentreferenz wurde am **14.01.2026 um 18:34:42 Uhr** erstellt.

Die Identifikation erfolgt über eine dedizierte Attachment-ID `4b5755cd-da8f-4b34-b78c-4b3ead465b39`. 
Damit kann die Datei unabhängig von fachlichen Vorgängen eindeutig referenziert werden.

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
