---
topic: AnnotationCommunication
canonical: https://emiga.rki.de/fhir/common/StructureDefinition/AnnotationCommunication
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
        Name: constraint.key, Element: id, Schweregrad: constraint.severity,Beschreibung: constraint.human, Ausdruck: constraint.expression
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
        Element: id, Staerke: binding.strength, ValueSet: binding.valueSet
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
	Feldname: id, Kurzbeschreibung: short, Beschreibung: definition, Hinweise: comment
</fql>
<br>&nbsp;<br>

## Beispiel
Im Folgenden wird ein Beispiel für eine Annotation dargestellt.

<tabs>
    <tab title="Übersicht">      
        {{render:Communication-441557618.json}}
    </tab>
    <tab title="XML">      
        {{xml:Communication-441557618.json}}
    </tab>
    <tab title="JSON">
        {{json:Communication-441557618.json}}
    </tab>
    <tab title="Link">
        {{link:Communication-441557618.json}}
    </tab>
</tabs>

<!-- {{json: Communication/441557618}} -->

