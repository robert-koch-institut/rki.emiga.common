# Beispiel: Bezugsperson einer betroffenen Person

## Beschreibung

Dieses Beispiel zeigt die Abbildung eine `RelatedPerson`-Ressource zur Abbildung einer Bezugsperson einer betroffenen Person (`AffectedPerson`).

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

Das Beispiel zeigt damit, dass für eine `RelatedPerson` mehrere fachliche Beziehungen angegeben werden können.

## Verknüpfung zur betroffenen Person

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


## Identifikation der Bezugsperson

Die Bezugsperson besitzt eigene EMIGA-spezifische Identifier:

| Identifier        | Beispielwert                   |
| ----------------- | ------------------------------ |
| EMIGA ID          | `Bezugsperson-PQRST-123456789` |
| EMIGA File Number | `Bezugsperson-XYZ-987654321`   |


Damit kann eine Bezugsperson innerhalb von EMIGA identifiziert werden.


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
