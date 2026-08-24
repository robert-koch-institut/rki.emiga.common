---
topic: EmigaUserPractitioner
canonical: https://emiga.rki.de/fhir/common/StructureDefinition/EmigaUserPractitioner
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
Das Profil `EmigaUserPractitioner` basiert auf der FHIR-Ressource `Practitioner` und dient der Abbildung einer handelnden Person bzw. eines EMIGA-Nutzende innerhalb des EMIGA-Kontexts. Es beschreibt natürliche Personen, die fachliche oder administrative Handlungen im System ausführen und dabei eine definierte Rolle oder Funktion wahrnehmen.
Ein `EmigaUserPractitioner` kann beispielsweise als Ersteller, Absender oder zuletzt ändernde Person einer EMIGA-Ressource referenziert werden.

### Abgrenzung zu anderen Personenressourcen

Im EMIGA-Datenmodell können natürliche Personen abhängig von ihrer fachlichen Rolle durch unterschiedliche FHIR-Ressourcen repräsentiert werden.

<#TODO check redundancy>


| Ressource       | EMIGA-Profil                  | Fachliche Rolle                                        |
| --------------- | ----------------------------- | ------------------------------------------------------ |
| `Patient`       | `AffectedPerson`              | Person, die von einem fachlichen Vorgang betroffen ist |
| `RelatedPerson` | `AffectedPersonRelatedPerson` | Bezugsperson einer betroffenen Person                  |
| `Practitioner`  | `EmigaUserPractitioner`       | handelnde Person bzw. EMIGA-Nutzende                   |

Bemerkung: Ein `Patient` beschreibt eine Person, über die fachliche Informationen im Rahmen eines EMIGA-Vorgangs verarbeitet werden. Ein `Practitioner` beschreibt hingegen eine Person, die selbst als handelnde Person an einem fachlichen Prozess beteiligt ist. Wird eine als Practitioner abgebildete natürliche Person selbst zum Gegenstand eines EMIGA-Fachvorgangs, beispielsweise aufgrund einer meldepflichtigen Erkrankung, wird diese Person zusätzlich durch eine eigenständige und vom Practitioner unabhängige Patient-Ressource abgebildet.


Der Schwerpunkt des Profils liegt auf einer schlanken und eindeutig referenzierbaren Abbildung eines EMIGA-Nutzende.

Typischerweise stehen dabei folgende Informationen im Vordergrund:

* Identifikation des Nutzende,
* Name,
* Aktivitätsstatus,
* Sichtbarkeit,
* Verantwortlichkeit

## Profil
### Metadaten
<fql output="transpose" headers="true">
from
    StructureDefinition
where
    url = %canonical
select
        CanonicalURL: url,
        Status: status,
        Version: version,
        Herausgeber: publisher
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

## Beispiel
(verweisen)