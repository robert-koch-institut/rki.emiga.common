# Example: Related Person of an Affected Person

## Beschreibung

Dieses Beispiel zeigt eine `RelatedPerson`-Ressource zur Abbildung einer Bezugsperson einer betroffenen Person (`AffectedPerson`).

Die Ressource verwendet das EMIGA-Profil:

```text
https://emiga.rki.de/fhir/common/StructureDefinition/AffectedPersonRelatedPerson
```

Eine `RelatedPerson` repräsentiert eine natürliche Person, die in einer fachlich relevanten Beziehung zu einer betroffenen Person steht. Dies können beispielsweise Sorgeberechtigte, Familienangehörige oder andere mit der betroffenen Person verknüpfte Personen sein.

Die zugehörige betroffene Person wird über `RelatedPerson.patient` referenziert. Die Art der Beziehung wird über `RelatedPerson.relationship` angegeben.

## Beispiel-Szenario

Im Beispiel wird eine Bezugsperson zur folgenden betroffenen Person beschrieben:

```text
Patient/AffectedPerson4550
```

Die Bezugsperson besitzt eine eigene EMIGA-ID und EMIGA-Aktennummer und wird damit als eigenständig identifizierbare Ressource innerhalb von EMIGA geführt.

Für die Bezugsperson sind im Beispiel zwei Beziehungen zur betroffenen Person angegeben:

* `legalGuardian` – Sorgeberechtigte Person
* `linkedPerson` – Kind

Das Beispiel zeigt damit auch, dass für eine `RelatedPerson` mehrere fachliche Beziehungen angegeben werden können.

## Bezug zur betroffenen Person

Die zentrale Verknüpfung zwischen einer `RelatedPerson` und einer betroffenen Person erfolgt über:

```text
RelatedPerson.patient
```

Im Beispiel:

```json
{
  "patient": {
    "reference": "Patient/AffectedPerson4550"
  }
}
```

Die Referenz zeigt auf die `Patient`-Ressource, zu der diese Bezugsperson gehört.

Die Beziehung ist damit aus Sicht der `RelatedPerson` modelliert:

```text
RelatedPerson
      │
      │ patient
      ▼
AffectedPerson
```

Die `RelatedPerson` stellt somit eine zusätzliche Person im Kontext der betroffenen Person dar, ohne selbst als `Patient` modelliert zu werden.

## Beziehung zur betroffenen Person

Die Art der Beziehung wird über:

```text
RelatedPerson.relationship
```

angegeben.

Die Kodierung erfolgt über das EMIGA-CodeSystem:

```text
https://emiga.rki.de/fhir/common/CodeSystem/RelatedPersonRelationshipType
```

Im Beispiel sind zwei Beziehungen dokumentiert.

### Sorgeberechtigte Person

```json
{
  "system": "https://emiga.rki.de/fhir/common/CodeSystem/RelatedPersonRelationshipType",
  "code": "legalGuardian",
  "display": "Sorgeberechtigte Person"
}
```

### Verknüpfte Person

Zusätzlich ist folgende Beziehung angegeben:

```json
{
  "system": "https://emiga.rki.de/fhir/common/CodeSystem/RelatedPersonRelationshipType",
  "code": "linkedPerson",
  "display": "Kind"
}
```

Die Ressource demonstriert damit die Verwendung mehrerer `relationship`-Einträge für dieselbe Bezugsperson.

## Identifikation der Bezugsperson

Die Bezugsperson besitzt eigene EMIGA-spezifische Identifier:

| Identifier        | Beispielwert                   |
| ----------------- | ------------------------------ |
| EMIGA ID          | `Bezugsperson-PQRST-123456789` |
| EMIGA File Number | `Bezugsperson-XYZ-987654321`   |

Die Identifier beziehen sich auf die **Bezugsperson selbst** und nicht auf die referenzierte betroffene Person.

Damit kann eine Bezugsperson innerhalb von EMIGA eigenständig identifiziert und mit einer betroffenen Person verknüpft werden.

## Unterschied zwischen RelatedPerson und Patient

`Patient` und `RelatedPerson` können beide natürliche Personen repräsentieren, erfüllen im fachlichen Modell jedoch unterschiedliche Aufgaben.

| Aspekt                             | Patient (`AffectedPerson`)       | RelatedPerson (`AffectedPersonRelatedPerson`)                 |
| ---------------------------------- | -------------------------------- | ------------------------------------------------------------- |
| Fachliche Rolle                    | betroffene Person                | Bezugsperson                                                  |
| FHIR-Ressource                     | `Patient`                        | `RelatedPerson`                                               |
| Gegenstand des fachlichen Vorgangs | ja                               | steht in Beziehung zur betroffenen Person                     |
| Eigene EMIGA-Identifier            | ja                               | ja                                                            |
| Beziehung zur betroffenen Person   | nicht erforderlich               | über `RelatedPerson.patient`                                  |
| Art der Beziehung                  | –                                | über `RelatedPerson.relationship`                             |
| Beispiele                          | betroffene Person eines Vorgangs | Sorgeberechtigte, Familienangehörige oder andere Bezugsperson |

Der wesentliche Unterschied besteht somit in der **fachlichen Rolle der Person**.

Eine `Patient`-Ressource beschreibt die betroffene Person selbst. Eine `RelatedPerson` beschreibt dagegen eine weitere natürliche Person, deren Bedeutung sich aus ihrer Beziehung zu dieser betroffenen Person ergibt.

## Unterschied zum Practitioner

Auch eine `RelatedPerson` und ein `Practitioner` repräsentieren natürliche Personen, unterscheiden sich jedoch deutlich in ihrer fachlichen Funktion.

Ein `Practitioner` repräsentiert eine handelnde Fachperson beziehungsweise einen EMIGA-Benutzer, beispielsweise einen Bearbeiter einer Ressource.

Eine `RelatedPerson` ist dagegen eine Person aus dem **persönlichen oder fachlich relevanten Umfeld der betroffenen Person**.

Vereinfacht lassen sich die Rollen wie folgt unterscheiden:

| Ressource       | Rolle im EMIGA-Kontext                                   |
| --------------- | -------------------------------------------------------- |
| `Patient`       | Person, die vom fachlichen Vorgang betroffen ist         |
| `RelatedPerson` | Person, die in Beziehung zur betroffenen Person steht    |
| `Practitioner`  | Person, die fachlich bzw. als Benutzer im System handelt |

## Sicherheit, Sichtbarkeit und Verantwortlichkeit

Über `RelatedPerson.meta.security` werden die Sichtbarkeit und Verantwortlichkeit der Ressource angegeben.

Die Sichtbarkeit ist im Beispiel:

```text
inAgency – Eigene ÖGD-Stelle
```

Als verantwortliche Stelle ist angegeben:

```text
1. – Robert Koch-Institut
```

Damit verwendet die Bezugsperson denselben grundlegenden Mechanismus zur Steuerung von Sichtbarkeit und Verantwortlichkeit wie andere EMIGA-Ressourcen.

## Fachlicher Schwerpunkt des Beispiels

Der Schwerpunkt dieses Beispiels liegt auf der Modellierung einer **eigenständig identifizierbaren Bezugsperson und ihrer Beziehung zu einer betroffenen Person**.

Besonders veranschaulicht werden:

* die Verwendung des Profils `AffectedPersonRelatedPerson`,
* eigene EMIGA-Identifier für die Bezugsperson,
* die Referenz auf die betroffene Person über `RelatedPerson.patient`,
* die Beschreibung der Beziehung über `RelatedPerson.relationship`,
* mehrere Beziehungen innerhalb derselben Ressource,
* sowie Security Labels für Sichtbarkeit und Verantwortlichkeit.

## Zusammenfassung

Dieses Beispiel zeigt eine EMIGA-konforme `RelatedPerson`, die mit einer betroffenen Person verknüpft ist.

Die Bezugsperson wird über eigene EMIGA-Identifier identifiziert und verweist über:

```text
RelatedPerson.patient
```

auf:

```text
Patient/AffectedPerson4550
```

Die fachliche Beziehung zur betroffenen Person wird über `RelatedPerson.relationship` beschrieben.

Damit ermöglicht das Profil `AffectedPersonRelatedPerson`, **Personen aus dem relevanten Umfeld einer betroffenen Person eigenständig abzubilden und ihre Beziehung zur betroffenen Person explizit zu dokumentieren**, ohne diese Personen selbst als `Patient` oder `Practitioner` modellieren zu müssen.


---- alter Version to merge ----
## Beispiel / RelatedPerson
Das folgende Beispiel zeigt eine betroffene Person mit dem Profil `AffectedPerson`.

Die Beispielperson **Jones Calamity**, geborene **Doe**, wird über eine EMIGA-ID und eine EMIGA-Aktennummer eindeutig identifiziert.

Neben dem offiziellen Namen enthält die Ressource einen Geburtsnamen und einen Kurznamen. Zusätzlich werden unter anderem folgende Informationen abgebildet:

* Anrede,
* Geburtsdatum,
* amtliches Geschlecht,
* Geburtsland,
* Staatsangehörigkeit,
* E-Mail-Adresse und Telefonnummer,
* Hauptwohnsitz,
* strukturierte Straßen- und Hausnummernangaben,
* Geokoordinaten,
* Kommunikationssprache,
* fachlicher Bearbeitungsstatus,
* sowie Sichtbarkeit und Verantwortlichkeit.

Der Hauptwohnsitz wird über die entsprechende `AddressUse`-Extension als:

```text id="qhtw8c"
primary – Hauptwohnsitz
```

klassifiziert.

Straße und Hausnummer werden zusätzlich zur menschenlesbaren Adresszeile strukturiert angegeben.

Eine Besonderheit des Beispiels ist die Verwendung von `Patient.link`. Darüber wird auf:

```text id="mvxik0"
RelatedPerson/RelatedPerson4551
```

verwiesen.

Der Link dient der Verknüpfung mit einer weiteren Ressourcenrepräsentation derselben physischen Person. Die fachliche Beziehung einer Bezugsperson zu einer betroffenen Person wird dagegen in der `RelatedPerson` selbst über `RelatedPerson.patient` und `RelatedPerson.relationship` beschrieben.

Das Beispiel veranschaulicht damit insbesondere:

* die Abbildung einer betroffenen Person als `Patient` (Fallperson),
* die Verwendung verschiedener Namensarten,
* die Abbildung demografischer Merkmale,
* die strukturierte Darstellung einer Adresse,
* die zusätzliche geografische Verortung,
* die Verwendung EMIGA-spezifischer Identifier,
* den fachlichen Bearbeitungsstatus,
* die Security Labels,
* sowie die Verknüpfung unterschiedlicher Ressourcenrepräsentationen einer physischen Person.

<tabs>
    <tab title="Übersicht">      
        {{render:Patient-AffectedPerson-4551.json}}
    </tab>
    <tab title="XML">      
        {{xml:Patient-AffectedPerson-4551.json}}
    </tab>
    <tab title="JSON">
        {{json:Patient-AffectedPerson-4551.json}}
    </tab>
    <tab title="Link">
        {{link:Patient-AffectedPerson-4551.json}}
    </tab>
</tabs>

<!-- {{json: Patient/AffectedPerson-4551}} -->

--- andere Version zu mergen ----
## Beispiel / Bezugsperson
Das folgende Beispiel zeigt eine Bezugsperson, die über `RelatedPerson.patient` mit der betroffenen Person

```text
Patient/AffectedPerson4550
```

verknüpft ist.

Die Bezugsperson wird über eigene EMIGA-Identifier identifiziert. Für die Beziehung zur betroffenen Person sind im Beispiel die Beziehungstypen `legalGuardian` (**Sorgeberechtigte Person**) und `linkedPerson` (**Kind**) angegeben.

Das Beispiel veranschaulicht damit insbesondere:

* die  Identifikation einer Bezugsperson,
* die Referenz auf die zugehörige betroffene Person über `patient`,
* die Kodierung der Beziehung über `relationship`,
* die Angabe mehrerer Beziehungen zu einer betroffenen Person,
* sowie die Verwendung der EMIGA Security Labels für Sichtbarkeit und Verantwortlichkeit.

<tabs>
    <tab title="Übersicht">      
        {{render:RelatedPerson4551.json}}
    </tab>
    <tab title="XML">      
        {{xml:RelatedPerson4551.json}}
    </tab>
    <tab title="JSON">
        {{json:RelatedPerson4551.json}}
    </tab>
    <tab title="Link">
        {{link:RelatedPerson4551.json}}
    </tab>
</tabs>

<!-- {{json: RelatedPerson/4551}} -->
