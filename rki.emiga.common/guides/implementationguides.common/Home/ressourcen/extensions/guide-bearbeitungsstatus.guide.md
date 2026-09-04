---
topic: ProcessingStatus
canonical: https://emiga.rki.de/fhir/common/Extension/ProcessingStatus
---

# {{page-title}}

Die Extension `ProcessingStatus` dient zur Abbildung des Bearbeitungsstatus eines Vorgangs. Sie kann an einem FHIR-Element verwendet werden, für das der aktuelle Stand der Bearbeitung angegeben werden soll.

Der Bearbeitungsstatus wird als `Coding` in `value[x]` angegeben. Dabei sind das Codesystem (`system`) und der Statuscode (`code`) verpflichtend anzugeben. Die zulässigen bzw. vorgesehenen Statuswerte werden durch das ValueSet `ProcessingStatusVS` beschrieben.

## Profil
### Metadaten
<fql output="transpose" headers="true">
from
    StructureDefinition
where
    url = %canonical
select
        Beschreibung: description, CanonicalURL: url, Status: status, Version: version, Herausgeber: publisher
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
