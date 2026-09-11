---
topic: AffectedPersonRelatedPerson
canonical: https://emiga.rki.de/fhir/common/StructureDefinition/AffectedPersonRelatedPerson
---

# {{page-title}}

<fql output= "inline" headers="false">
from 
    StructureDefinition
where
    url = %canonical
select
    description
</fql>

Das hierfür verwendete Profil `AffectedPersonRelatedPerson` basiert auf der FHIR-Basisressource `RelatedPerson`.
Die betroffene Person, zu der die Beziehung besteht, wird über das Element `RelatedPerson.patient` referenziert.

### Beziehung zur betroffenen Person
Die Art der Beziehung zwischen der Bezugsperson und der betroffenen Person wird über `RelatedPerson.relationship` designiert.
Mindestens eine Beziehung ist anzugeben. Die zulässigen Ausprägungen werden durch das ValueSet `RelatedPersonRelationshipTypeVS` festgelegt. Damit können insbesondere persönliche, familiäre oder rechtliche Beziehungen zur betroffenen Person strukturiert angegeben werden.
Eine Bezugsperson kann mehrere Beziehungen zur selben betroffenen Person besitzen. In diesem Fall können mehrere Einträge in `RelatedPerson.relationship` angegeben werden.

### Bezugsperson und betroffene Person als dieselbe physische Person

In bestimmten fachlichen Konstellationen kann eine Person sowohl als `AffectedPerson` als auch als `AffectedPersonRelatedPerson` im Datenbestand repräsentiert sein.
Dies ist beispielsweise dann relevant, wenn eine Person in einem fachlichen Kontext selbst betroffene Person ist und gleichzeitig als Bezugsperson einer weiteren betroffenen Person auftritt.

In diesem Fall kann die entsprechende Slice von `AffectedPerson.link` verwendet werden, um die beiden Ressourcen miteinander zu verknüpfen und kenntlich zu machen, dass sie **dieselbe physische Person in unterschiedlichen FHIR-Rollen** repräsentieren.

`RelatedPerson.patient` und `RelatedPerson.relationship` beschreiben die **fachliche Beziehung zwischen zwei Personen**. Die Verknüpfung über `AffectedPerson.link` dient dagegen der **Identitätsverknüpfung zweier FHIR-Ressourcen**, die dieselbe physische Person repräsentieren.


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

# Beispiel

Dieses Beispiel zeigt die Abbildung eine `RelatedPerson`-Ressource zur Abbildung einer Bezugsperson einer betroffenen Person (`AffectedPerson`).

Die Ressource verwendet das EMIGA-Profil `https://emiga.rki.de/fhir/common/StructureDefinition/AffectedPersonRelatedPerson`.

Eine `RelatedPerson` repräsentiert eine natürliche Person, die in einer fachlich relevanten Beziehung zu einer betroffenen Person steht. Dies können beispielsweise Sorgeberechtigte, Familienangehörige oder andere mit der betroffenen Person verknüpfte Personen sein.

Die zugehörige betroffene Person wird über `RelatedPerson.patient` referenziert. Die Art der Beziehung wird über `RelatedPerson.relationship` angegeben.

## Beispiel-Szenario

Im Beispiel wird eine Bezugsperson zur folgenden betroffenen Person beschrieben: `Patient/AffectedPerson4550`.

Die Bezugsperson besitzt eine eigene EMIGA-ID und EMIGA-Aktennummer und wird damit als eigenständig identifizierbare Ressource innerhalb von EMIGA geführt.

Für die Bezugsperson sind im Beispiel zwei Beziehungen zur betroffenen Person angegeben:

* `legalGuardian` – Sorgeberechtigte Person
* `linkedPerson` – Kind

Das Beispiel zeigt damit, dass für eine `RelatedPerson` mehrere fachliche Beziehungen angegeben werden können.

## Verknüpfung zur betroffenen Person

Die zentrale Verknüpfung zwischen einer `RelatedPerson` und einer betroffenen Person erfolgt über `RelatedPerson.patient`.
Im Beispiel `Patient/AffectedPerson4550`.
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