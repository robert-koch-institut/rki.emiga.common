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
<TODO check end>

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

