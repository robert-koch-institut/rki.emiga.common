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

Das Profil `AffectedPerson` basiert auf der FHIR-Ressource `Patient` und bildet eine betroffene Person im fachlichen Kontext von EMIGA ab. Ob die Person in einem konkreten Vorgang beispielsweise Fall- oder Kontaktperson ist, wird nicht durch das Profil selbst festgelegt, sondern ergibt sich aus dem jeweiligen fachlichen Kontext und den Verknüpfungen zu weiteren Ressourcen.

Eine physische Person kann in unterschiedlichen FHIR-Kontexten durch unterschiedliche Ressourceninstanzen repräsentiert werden. Das Profil stellt hierfür die Slices `link.relatedPersonLink` und `link.patientLink` bereit, über die Repräsentationen derselben Person miteinander verknüpft werden können. Bezugspersonen einer betroffenen Person werden mit dem Profil `AffectedPersonRelatedPerson` abgebildet.

### Fachliche Abbildung ausgewählter Attribute

| Attribut | FHIR-Abbildung | Bemerkung |
|---|---|---|
| Anrede | `name.extension[salutation]` | Für die Anrede ist die Extension `salutation` vorgesehen. |
| Geburtsname | `name.use = #maiden` und `name.family` | Bei `use = maiden` darf gemäß Invariante `maidenNameOnlyFamily` nur `family` befüllt sein. |
| Kurzname | `name.use = #nickname` | Der Kurzname wird über einen eigenen Namenseintrag mit `use = nickname` abgebildet. |
| Straße | `address.line.extension[Strasse].valueString` | Straße innerhalb der deutschen Basisadresse. |
| Hausnummer | `address.line.extension[Hausnummer].valueString` | Hausnummer innerhalb der deutschen Basisadresse. |
| Adresszusatz | `address.line.extension[Adresszusatz].valueString` | Optionaler Adresszusatz. |
| Postfach | `address.line.extension[Postfach].valueString` | Postfachangabe. |
| Ort | `address.city` | Stadt bzw. Ort. |
| Land | `address.country` | Bindung an `iso3166-1-2` mit Bindungsstärke `extensible`. |
| Geo-Koordinaten | `address.extension[geolocation]` | Die Extension unterstützt `latitude` und `longitude`. Das Profil legt nicht fest, ob die Werte manuell oder technisch ermittelt werden. |
| Regionalschlüssel | `address.extension[regionalKey].extension[regionKey].valueString` | Bestandteil der Extension `regionalKey`. |
| Regionales Bezugssystem | `address.extension[regionalKey].extension[regionReferenceSystem].valueString` | Bezugssystem des Regionalschlüssels. |
| Einrichtungsbezug | `extension[facilityAssociation]` | Zuordnung der betroffenen Person zu einer Einrichtung. Die Extension liegt direkt auf der Patient-Ressource, nicht auf `address`. |
| Geburtsland | `extension[landOfBirth].valueCoding` | Abbildung über die profilierte BirthPlace-Extension; `valueCoding` ist Must Support. |
| Staatsangehörigkeit | `extension[citizenship]` | Abbildung über die HL7 Patient-Citizenship-Extension und `CountryCodes`. |
| Sprachkenntnisse | `communication.language` | Bindung an `CommonLanguages` mit Bindungsstärke `extensible`. |
| Fax | `telecom[Fax]` | `system = #fax`; der Wert wird durch `validFaxNumber` validiert. |
| Behandelnde Person | `generalPractitioner` | Referenz auf die behandelnde Person. |
| Bezug zu einer `RelatedPerson`-Repräsentation derselben Person | `link[relatedPersonLink]` | Verknüpft dieselbe physische Person mit einer `RelatedPerson`-Repräsentation. |
| Bezug zu einer weiteren `Patient`-Repräsentation derselben Person | `link[patientLink]` | Verknüpft dieselbe physische Person mit einer weiteren `Patient`-Repräsentation. |

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


