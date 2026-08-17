## Example: Patient Match Output Bundle
Dieses Beispiel zeigt die Antwort einer EMIGA `$match`-Operation zur Suche nach möglichen Dubletten einer Person.

Die Rückgabe erfolgt als FHIR `Bundle` vom Typ `searchset` und verwendet das Profil:

```
https://emiga.rki.de/fhir/common/StructureDefinition/MatchOutputBundle
```

Das Beispiel-Bundle enthält zwei gefundene Match-Kandidaten (`Bundle.total = 2`). Die Ergebnisse werden als `Patient`-Ressourcen innerhalb der `Bundle.entry`-Elemente zurückgegeben.

## Match-Kandidaten

Jeder gefundene Kandidat wird mit dem Profil:

```
https://emiga.rki.de/fhir/common/StructureDefinition/AffectedPerson
```

bereitgestellt. Zusätzlich enthalten die Ressourcen Security Labels zur Beschreibung der Sichtbarkeit und Verantwortlichkeit der Daten. Im Beispiel wird die Sichtbarkeit auf die eigene ÖGD-Stelle eingeschränkt und die verantwortliche Stelle als Robert Koch-Institut angegeben.

Die Patient-Ressourcen enthalten die für das Matching relevanten personenbezogenen Merkmale, unter anderem:

* EMIGA-interne Identifikatoren
* Name
* Geschlecht
* Geburtsdatum
* Adresse

Beispielhaft enthält der erste Kandidat die Identifikatoren `EmigaID` und `EmigaFileNumber`, den Namen "Max Mustermann", das Geburtsdatum `1980-01-01` sowie eine Adresse in Berlin.

## Match-Bewertung

Die Bewertung eines Match-Kandidaten wird über das Element `Bundle.entry.search` beschrieben.

Jeder Eintrag wird mit:

```
mode = match
```

gekennzeichnet und enthält einen numerischen Match-Score. Der erste Kandidat besitzt beispielsweise einen Score von `0.92`, der zweite Kandidat einen Score von `0.74`.
Zusätzlich wird der qualitative Match-Grad über die FHIR-Extension:

```
http://hl7.org/fhir/StructureDefinition/match-grade
```

angegeben.

Im Beispiel werden folgende Werte verwendet:

* `probable` für einen wahrscheinlichen Treffer
* `possible` für einen möglichen Treffer

## Duplicate Match Metadata

Zusätzliche Informationen zur Nachvollziehbarkeit des Matching-Prozesses werden über die Extension:

```
https://emiga.rki.de/fhir/common/StructureDefinition/DuplicateMatchMetadata
```

übermittelt.

Die Metadaten enthalten:

* Match-Score des verwendeten Matching-Verfahrens
* Algorithmus und Version
* Auslösegrund des Matches
* übereinstimmende Kriterien (`matchedCriteria`)
* nicht übereinstimmende Kriterien (`nonMatchedCriteria`)

Für den ersten Kandidaten wurde beispielsweise der Algorithmus `person-duplicate` in Version `v1` verwendet. Als Auslösegrund wurde `main-criteria` angegeben.

## Übereinstimmende Kriterien

Die verwendeten Matching-Kriterien werden über das CodeSystem:

```
https://emiga.rki.de/fhir/CodeSystem/DuplicateMatchCriteria
```

referenziert.

Beispiele für übereinstimmende Kriterien im ersten Match:

| Kriterium         | Beschreibung                          |
| ----------------- | ------------------------------------- |
| `birthDateExact`  | Geburtsdatum exakt übereinstimmend    |
| `firstNameFuzzy`  | Vorname ungefähr übereinstimmend      |
| `familyNameFuzzy` | Familienname ungefähr übereinstimmend |

Beim zweiten Kandidaten erfolgte das Matching unter anderem über:

| Kriterium          | Beschreibung                       |
| ------------------ | ---------------------------------- |
| `birthDateExact`   | Geburtsdatum exakt übereinstimmend |
| `streetPhonetic`   | Straße phonetisch übereinstimmend  |
| `houseNumberExact` | Hausnummer exakt übereinstimmend   |
| `postalCodeExact`  | Postleitzahl exakt übereinstimmend |

## Nicht übereinstimmende Kriterien

Neben erfüllten Kriterien können auch nicht erfüllte Kriterien dokumentiert werden.

Beispiele:

* `cityPhonetic` – Stadt phonetisch übereinstimmend (nicht erfüllt)
* `birthNameFuzzy` – Geburtsname ungefähr übereinstimmend (nicht erfüllt)

Diese Informationen ermöglichen eine transparente Bewertung der Match-Entscheidung und unterstützen die fachliche Prüfung durch die empfangende Stelle.




-------------------
-------------------

### Übersicht

Das Beispielprofil **Patient Match Output Bundle** beschreibt die Rückgabe einer `$match`-Operation zur Identifikation möglicher Dubletten einer Person.
Die Antwort wird als FHIR `Bundle` vom Typ `searchset` zurückgegeben. Jede `Bundle.entry` enthält einen gefundenen möglichen Dubletten-Kandidaten als `Patient`-Ressource. Die zugehörigen Such- und Matching-Informationen werden in `Bundle.entry.search` übermittelt.
Das Bundle verwendet das Profil:

```
https://emiga.rki.de/fhir/common/StructureDefinition/MatchOutputBundle
```

### Bundle-Struktur

Das Beispiel-Bundle enthält zwei gefundene Person-Kandidaten:

| Element                         | Beschreibung                                  |
| ------------------------------- | --------------------------------------------- |
| `Bundle.type`                   | `searchset`                                   |
| `Bundle.total`                  | Anzahl der gefundenen Match-Kandidaten        |
| `Bundle.entry.resource`         | gefundene `Patient`-Ressource                 |
| `Bundle.entry.search.mode`      | Kennzeichnung als Match-Ergebnis              |
| `Bundle.entry.search.score`     | numerischer Match-Score                       |
| `Bundle.entry.search.extension` | zusätzliche Informationen zur Match-Bewertung |

Beispiel:

```json
{
  "resourceType": "Bundle",
  "type": "searchset",
  "total": 2
}
```

### Match-Kandidaten

Jeder Kandidat wird als `Patient`-Ressource zurückgegeben.

Die Patient-Ressource verwendet das Profil:

```
https://emiga.rki.de/fhir/common/StructureDefinition/AffectedPerson
```

Die Ressource enthält unter anderem:

* EMIGA-interne Identifikatoren
* Name
* Geschlecht
* Geburtsdatum
* Adresse
* Security Labels zur Steuerung von Sichtbarkeit und Verantwortlichkeit

Beispiel:

```json
{
  "resourceType": "Patient",
  "meta": {
    "profile": [
      "https://emiga.rki.de/fhir/common/StructureDefinition/AffectedPerson"
    ]
  },
  "birthDate": "1980-01-01"
}
```

### Match-Ergebnisinformationen

Die Match-Bewertung wird über `Bundle.entry.search` angegeben.

#### Match-Modus

Jeder Eintrag verwendet:

```json
{
  "mode": "match"
}
```

Dies kennzeichnet die Ressource als Ergebnis einer Matching-Anfrage.

#### Match-Score

Der numerische Score beschreibt die Ähnlichkeit zwischen der angefragten Person und dem gefundenen Kandidaten.

Beispiel:

```json
{
  "score": 0.92
}
```

Der Score liegt im Wertebereich der verwendeten Matching-Implementierung und dient der Priorisierung der Treffer.

### Match-Grade

Zusätzlich zum numerischen Score wird der qualitative Match-Grad über die FHIR-Standard-Extension `match-grade` angegeben:

```
http://hl7.org/fhir/StructureDefinition/match-grade
```

Mögliche Werte:

| Wert       | Bedeutung                |
| ---------- | ------------------------ |
| `probable` | wahrscheinlicher Treffer |
| `possible` | möglicher Treffer        |

Beispiel:

```json
{
  "url": "http://hl7.org/fhir/StructureDefinition/match-grade",
  "valueCode": "probable"
}
```

### Duplicate Match Metadata

Zusätzliche Informationen zur Ermittlung des Match-Ergebnisses werden über die Extension:

```
https://emiga.rki.de/fhir/common/StructureDefinition/DuplicateMatchMetadata
```

bereitgestellt.

Die Extension enthält Informationen über:

* verwendeten Matching-Algorithmus
* Algorithmus-Version
* Auslösegrund des Matches
* übereinstimmende Kriterien
* nicht übereinstimmende Kriterien
* berechneten Match-Score

Struktur:

```text
DuplicateMatchMetadata
 ├── matchScore
 ├── algorithm
 ├── algorithmVersion
 ├── triggerReason
 ├── matchedCriteria
 └── nonMatchedCriteria
```

### Matching-Algorithmus

Das verwendete Verfahren wird über folgende Elemente dokumentiert:

| Element            | Beispielwert       |
| ------------------ | ------------------ |
| `algorithm`        | `person-duplicate` |
| `algorithmVersion` | `v1`               |

Beispiel:

```json
{
  "url": "algorithm",
  "valueString": "person-duplicate"
}
```

### Trigger Reason

Der Trigger beschreibt, warum der Matching-Prozess für diesen Kandidaten ausgelöst wurde.

Beispiel:

```json
{
  "system": "https://emiga.rki.de/fhir/CodeSystem/DuplicateMatchTriggerReasons",
  "code": "main-criteria",
  "display": "Hauptkriterium"
}
```

Mögliche Werte werden im CodeSystem:

```
https://emiga.rki.de/fhir/CodeSystem/DuplicateMatchTriggerReasons
```

definiert.

### Matched Criteria

Die tatsächlich übereinstimmenden Kriterien werden mehrfach über `matchedCriteria` angegeben.

Beispiele:

| Code               | Bedeutung                             |
| ------------------ | ------------------------------------- |
| `birthDateExact`   | Geburtsdatum exakt übereinstimmend    |
| `firstNameFuzzy`   | Vorname ungefähr übereinstimmend      |
| `familyNameFuzzy`  | Familienname ungefähr übereinstimmend |
| `streetPhonetic`   | Straße phonetisch übereinstimmend     |
| `houseNumberExact` | Hausnummer exakt übereinstimmend      |
| `postalCodeExact`  | Postleitzahl exakt übereinstimmend    |

Die Werte stammen aus:

```
https://emiga.rki.de/fhir/CodeSystem/DuplicateMatchCriteria
```

### Non-Matched Criteria

Nicht erfüllte Kriterien werden über `nonMatchedCriteria` dokumentiert.

Beispiel:

```json
{
  "code": "birthNameFuzzy",
  "display": "Geburtsname ungefähr übereinstimmend (fuzzy)"
}
```

Diese Information ermöglicht eine nachvollziehbare Bewertung des Match-Ergebnisses.

### Beispielhafte Bewertung

#### Kandidat 1

* Match-Grade: `probable`
* Match-Score: `0.92`
* Algorithmus: `person-duplicate`
* Trigger: `main-criteria`

Übereinstimmende Kriterien:

* Geburtsdatum exakt
* Vorname fuzzy
* Familienname fuzzy

#### Kandidat 2

* Match-Grade: `possible`
* Match-Score: `0.74`
* Trigger: `address-fallback`

Übereinstimmende Kriterien:

* Geburtsdatum exakt
* Straße phonetisch
* Hausnummer exakt
* Postleitzahl exakt

### Sicherheit und Verantwortlichkeit

Die zurückgegebenen Patient-Ressourcen enthalten Security Labels über `meta.security`.

Diese steuern:

* Sichtbarkeit der Ressource (`ResourceVisibilityType`)
* Verantwortliche Stelle (`ResourceResponsibility`)

Beispiel:

```json
{
  "system": "https://emiga.rki.de/fhir/common/CodeSystem/ResourceVisibilityType",
  "code": "inAgency",
  "display": "Eigene ÖGD-Stelle"
}
```

Damit wird sichergestellt, dass Match-Ergebnisse nur innerhalb der vorgesehenen fachlichen und organisatorischen Grenzen verarbeitet werden.