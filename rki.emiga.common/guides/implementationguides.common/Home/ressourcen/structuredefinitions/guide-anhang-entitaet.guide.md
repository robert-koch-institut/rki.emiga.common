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
Hierzu zählen beispielsweise hochgeladene Dateien, Dokumente, die auf Grundlage von Anschreiben-Vorlagen erzeugt wurden.

Die `DocumentReference` enthält die fachlichen und technischen Metadaten des Anhangs. Der binäre Dateiinhalt wird nicht inline mit der Ressource übertragen, sondern separat verwaltet und über `DocumentReference.content.attachment.url` referenziert.

Über `content.attachment` können insbesondere folgende Informationen zum Dokument angegeben werden:

| Element                          | Bedeutung                                                     |
| -------------------------------- | ------------------------------------------------------------- |
| `content.attachment.url`         | Referenz auf den Dateiinhalt                                  |
| `content.attachment.contentType` | MIME-Type der Datei, z. B. `application/pdf` oder `image/png` |
| `content.attachment.size`        | Größe der Datei in Bytes                                      |
| `content.attachment.hash`        | Hashwert zur Prüfung der Dateiintegrität                      |
| `content.attachment.title`       | Name bzw. Betreff des Anhangs                                 |
| `content.attachment.creation`    | Erstellungszeitpunkt des eigentlichen Dokuments               |

**⚠ Bemerkung:** 

Dabei ist zwischen dem Erstellungszeitpunkt des Dokuments und dem Erstellungszeitpunkt der Anhangsentität zu unterscheiden:

- `content.attachment.creation` bezeichnet den **Erstellungszeitpunkt des referenzierten Dokuments**.

- `DocumentReference.date` bezeichnet den Zeitpunkt, zu dem der Anhang in EMIGA erstellt bzw. als `DocumentReference` angelegt wurde.

Über `DocumentReference.author` wird die Person referenziert, die den Anhang in EMIGA erstellt hat.

### Identifikation
Ein Anhang kann über `DocumentReference.identifier` mit fachlichen oder technischen Identifiern versehen werden.
Je nach Verwendungskontext können beispielsweise EMIGA-spezifische Identifier oder weitere fachliche Referenznummern zur Identifikation und Zuordnung des Dokuments angefügt werden.

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
Die Must-Support-Kennzeichnungen ergeben sich zum Teil aus der zugrunde liegenden FHIR-Basisressource und werden zum Teil durch das jeweilige EMIGA-Profil festgelegt. Im Folgenden sind alle für dieses Profil geltenden Must-Support-Elemente aufgeführt:

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

# Beispie l: Anhangsdokument 4691067

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

# Beispiel 2: Anhangsdokument 441557620

Das folgende Beispiel zeigt die Abbildung eines Anhangs als eigenständige `DocumentReference`-Ressource in EMIGA. Der Anhang ist eine PNG-Datei mit dem Titel:

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

Das Beispiel veranschaulicht die Abbildung eines Anhangs als `DocumentReference`, die Vergabe fachlicher Identifikatoren sowie die Beschreibung der Datei über `content.attachment`. Darüber hinaus zeigt es die Angabe der erstellenden Person über `author`, die Unterscheidung zwischen dem Erstellungszeitpunkt der `DocumentReference` (`DocumentReference.date`) und dem Erstellungszeitpunkt des eigentlichen Dokuments (`Attachment.creation`) sowie die Steuerung von Sichtbarkeit und Verantwortlichkeit über `meta.security`.

<tabs>
    <tab title="Übersicht">      
        {{render:DocumentReference-Attachment-441557620.json}}
    </tab>
    <tab title="XML">      
        {{xml:DocumentReference-Attachment-441557620.json}}
    </tab>
    <tab title="JSON">
        {{json:DocumentReference-Attachment-441557620.json}}
    </tab>
    <tab title="Link">
        {{link:DocumentReference-Attachment-441557620.json}}
    </tab>
</tabs>

<!-- {{json: DocumentReference/441557620}} -->
