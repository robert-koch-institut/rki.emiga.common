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

## Fachlicher Schwerpunkt des Beispiels

Der Schwerpunkt dieses Beispiels liegt auf der Modellierung einer **eigenständig identifizierbaren Bezugsperson und ihrer Beziehung zu einer betroffenen Person**.

Besonders veranschaulicht werden:

* die Verwendung des Profils `AffectedPersonRelatedPerson`,
* eigene EMIGA-Identifier für die Bezugsperson,
* die Referenz auf die betroffene Person über `RelatedPerson.patient`,
* die Beschreibung der Beziehung über `RelatedPerson.relationship`,
* mehrere Beziehungen innerhalb derselben Ressource,
* Security Labels für Sichtbarkeit und Verantwortlichkeit.

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
