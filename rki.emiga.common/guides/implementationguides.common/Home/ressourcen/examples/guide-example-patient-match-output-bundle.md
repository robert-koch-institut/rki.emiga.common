## Beispiel: Patient Match Output Bundle
Dieses Beispiel zeigt die Rückgabe einer EMIGA-$match-Operation zur Identifizierung möglicher Ressource-Dubletten (Datensatz-Dubletten) einer Person. Die Antwort wird als FHIR-Bundle vom Typ searchset gemäß dem Profil https://emiga.rki.de/fhir/common/StructureDefinition/MatchOutputBundle zurückgegeben.

Jede Bundle.entry enthält einen gefundenen Match-Kandidaten als Patient-Ressource; die zugehörigen Such- und Matching-Informationen werden über Bundle.entry.search übermittelt. Das Beispiel-Bundle enthält zwei Match-Kandidaten (Bundle.total = 2).

### Match-Kandidaten

Jeder gefundene Kandidat wird mit dem Profil:

```
https://emiga.rki.de/fhir/common/StructureDefinition/AffectedPerson
```

bereitgestellt. 
Beispielhaft enthält der erste Kandidat die Identifikatoren `EmigaID` und `EmigaFileNumber`, den Namen "Max Mustermann", das Geburtsdatum `1980-01-01` sowie eine Adresse in Berlin.
Zusätzlich enthalten die Ressourcen Security Labels zur Beschreibung der Sichtbarkeit und Verantwortlichkeit der Daten. Im Beispiel wird die Sichtbarkeit auf die eigene ÖGD-Stelle eingeschränkt und die verantwortliche Stelle als Robert Koch-Institut angegeben.

### Match-Bewertung

Die Bewertung eines Match-Kandidaten wird über das Element `Bundle.entry.search` beschrieben.

Jeder Eintrag wird mit:

```
mode = match
```

gekennzeichnet und enthält einen numerischen Match-Score. Zusätzlich wird der qualitative Match-Grad über die FHIR-Extension:

```
http://hl7.org/fhir/StructureDefinition/match-grade
```

angegeben.

Im Beispiel werden folgende Werte verwendet:

* `probable` für einen wahrscheinlichen Treffer
* `possible` für einen möglichen Treffer

### Duplicate Match Metadata

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


#### Übereinstimmende Kriterien

Die verwendeten Matching-Kriterien werden über das CodeSystem:

```
https://emiga.rki.de/fhir/CodeSystem/DuplicateMatchCriteria
```

referenziert. Beispiele für übereinstimmende Kriterien im ersten Match:

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

#### Nicht übereinstimmende Kriterien
Neben erfüllten Kriterien werden die nicht erfüllte Kriterien ebenfalls dokumentiert. Beispiele:

* `cityPhonetic` – Stadt phonetisch übereinstimmend (nicht erfüllt)
* `birthNameFuzzy` – Geburtsname ungefähr übereinstimmend (nicht erfüllt)

Diese Informationen ermöglichen eine transparente Bewertung der Match-Entscheidung und unterstützen die fachliche Prüfung durch die empfangende Stelle.
