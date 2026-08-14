---
topic: AffectedPerson
canonical: https://emiga.rki.de/fhir/common/StructureDefinition/AffectedPerson
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

<TODO>Im EMIGA unterscheidet sich zwei unterschiedliche FHIR-Profile zur Abbildung von Personen: 1) Die **betroffe Person (affectedPerson)** und 2) **Practitioner** die sich im package *rki.emiga.vzd* sich befinden. In dem Fall dass die gleiche physische Person als Practioner und als affected Person werden nicht direkt refernziert oder verknüfpt, sondern ein neue Instanz erzeugt.

<TODO>Mit Betroffene Person werden sowohl Fallperson, aka Patien (die Person der Fall hat), als auch die Kontaktperson des Fall. Ob eine Person bei einem konkreten Fall beispielsweise als Fallperson oder Kontaktperson auftritt, wird nicht allein durch das Profil `AffectedPerson` bestimmt, sondern ergibt sich aus dem jeweiligen fachlichen Kontext und den Verknüpfungen zu weiteren Ressourcen.

<TODO> AffectedPersonRelatedPerson is ein Instanc von AffectedPerson mit dem Relation und Verweiss auf die Fallperson?

### Fachliche Abbildung ausgewählter Attribute

| Attribut | FHIR-Abbildung | Bemerkung |
|---|---|---|
| Titel / Anrede | `name.extension[salutation]` | Für die Anrede ist die Extension `salutation` vorgesehen. Namenspräfixe und -suffixe sind durch das verwendete HumanName-Profil grundsätzlich Teil der Namensstruktur, werden im `AffectedPerson`-Profil jedoch nicht zusätzlich profiliert. |
| Geburtsname | `name.use = #maiden` und `name.family` | Der Geburtsname wird über einen Namenseintrag mit `use = maiden` abgebildet. Bei `maiden` darf gemäß Invariante `maidenNameOnlyFamily` nur `family` befüllt sein. |
| Kurzname | `name.use = #nickname` | Der Kurzname wird über einen eigenen Namenseintrag mit `use = nickname` abgebildet. |
| Straße | `address.line.extension[Strasse].valueString` | Die Straße wird innerhalb von `address.line` über die Extension `Strasse` abgebildet. |
| Hausnummer | `address.line.extension[Hausnummer].valueString` | Für die Hausnummer ist eine eigene Extension innerhalb von `address.line` vorgesehen. |
| Adresszusatz | `address.line.extension[Adresszusatz].valueString` | Optionaler Adresszusatz innerhalb von `address.line`. |
| Postfach | `address.line.extension[Postfach].valueString` | Postfachangaben werden innerhalb von `address.line` über eine eigene Extension abgebildet. |
| Ort | `address.city` | Abbildung der Stadt bzw. des Ortes. |
| Land | `address.country` | Das Land ist im Profil vorgesehen und an das ValueSet `iso3166-1-2` mit Bindungsstärke `extensible` gebunden. |
| Geo-Koordinaten | `address.extension[geolocation]` | Die Geolocation-Extension enthält die Must-Support-Elemente `latitude` und `longitude`. Ob die Werte fachlich eingegeben oder technisch ermittelt werden, wird durch das Profil nicht festgelegt. |
| Regionalschlüssel | `address.extension[regionalKey].extension[regionKey].valueString` | Der Regionalschlüssel ist als Bestandteil der Extension `regionalKey` modelliert. Das Profil legt an dieser Stelle kein ValueSet fest. |
| Regionales Bezugssystem | `address.extension[regionalKey].extension[regionReferenceSystem].valueString` | Das regionale Bezugssystem ist gemeinsam mit dem Regionalschlüssel innerhalb der Extension `regionalKey` modelliert. |
| betreut in / Einrichtungsbezug | `extension[facilityAssociation]` | Über die Extension `facilityAssociation` kann eine Zuordnung zu einer Einrichtung abgebildet werden. |
| Name des Erziehungsberechtigten | derzeit keine spezifische Abbildung im Profil | Im aktuellen `AffectedPerson`-Profil ist hierfür kein eigener Slice bzw. keine explizite Beziehung modelliert. Eine fachliche Abbildung über `RelatedPerson` wäre separat zu definieren. |
| Rechtlicher Betreuer | derzeit keine spezifische Abbildung im Profil | Im aktuellen `AffectedPerson`-Profil ist hierfür kein eigener Slice bzw. keine explizite Beziehung modelliert. Eine fachliche Abbildung über `RelatedPerson` wäre separat zu definieren. |
| Geburtsstaat / Geburtsland | `extension[landOfBirth].valueCoding` | Der Geburtsort bzw. das Geburtsland wird über die Extension `landOfBirth` auf Basis der Patient-BirthPlace-Extension abgebildet. `valueCoding` ist Must Support. |
| Sprachkenntnisse | `communication.language` | Die Sprachkenntnisse sind an das ValueSet `CommonLanguages` mit Bindungsstärke `extensible` gebunden. |
| Fax | `telecom[Fax]` | Der Slice `Fax` verwendet `system = #fax`; `value` ist Must Support und wird durch die Invariante `validFaxNumber` validiert. |

<br>&nbsp;<br>


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
Im Folgenden wird ein Beispiel für eine Betroffene Person dargestellt.

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


