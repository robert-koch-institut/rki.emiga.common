---
topic: AdditionalPropertiesQuestionnaire
canonical: https://emiga.rki.de/fhir/common/StructureDefinition/AdditionalPropertiesQuestionnaire
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
Das Profil `AdditionalPropertiesQuestionnaire` basiert auf der FHIR-Ressource `Questionnaire`. Es dient dazu, zusätzliche fachliche Eigenschaften sowie Konfigurations- und Steuerungsinformationen strukturiert zu definieren, wenn diese nicht unmittelbar durch die übrigen Profile des Moduls abgebildet werden. Die zusätzlichen Eigenschaften werden als `item`-Elemente des Fragebogens beschrieben.

Das Profil definiert damit die Struktur der zusätzlichen Eigenschaften. Die konkreten Werte zu einer solchen Struktur werden mit `AdditionalPropertiesQuestionnaireResponse` abgebildet.
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
Im Folgenden wird ein Beispiel für eine Zusätzliche Eigenschaft dargestellt.

<tabs>
    <tab title="Übersicht">      
        {{render:Questionnaire-FillingNote.json}}
    </tab>
    <tab title="XML">      
        {{xml:Questionnaire-FillingNote.json}}
    </tab>
    <tab title="JSON">
        {{json:Questionnaire-FillingNote.json}}
    </tab>
    <tab title="Link">
        {{link:Questionnaire-FillingNote.json}}
    </tab>
</tabs>

<!-- {{json: Questionnaire/FillingNote}} -->