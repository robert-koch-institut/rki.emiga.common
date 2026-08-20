---
topic: AffectedPerson
canonical: https://emiga.rki.de/fhir/common/StructureDefinition/AffectedPerson
---

# {{page-title}}
## Beschreibung

### Abgrenzung zu anderen Personenressourcen
Im EMIGA-Datenmodell können natürliche Personen abhängig von ihrer fachlichen Rolle durch unterschiedliche FHIR-Ressourcen repräsentiert werden.

| Ressource       | EMIGA-Profil                  | Fachliche Rolle                                                             |
| --------------- | ----------------------------- | --------------------------------------------------------------------------- |
| `Betroffene Person`       | `AffectedPerson`        | Person, die vom fachlichen Vorgang betroffen ist (darunter Fallperson, Kontakperson ?)                            |
| `RelatedPerson` | `AffectedPersonRelatedPerson` | Person, die in einer fachlichen Beziehung zu einer betroffenen Person steht |
| `Practitioner`  | `EmigaUserPractitioner`       | EMIGA-Nutzende                                    |

<fql output= "inline" headers="false">
from 
    StructureDefinition
where
    url = %canonical
select
    description
</fql>

<br>&nbsp;<br>

Das Profil `AffectedPerson` basiert auf der FHIR-Ressource `Patient` und dient der Abbildung einer **betroffenen Person im fachlichen Kontext von EMIGA**.

Eine `AffectedPerson` repräsentiert die Person, auf die sich ein fachlicher Vorgang (z.B. ein Fall) bezieht. Welche konkrete fachliche Rolle die Person innerhalb eines Vorgangs einnimmt – beispielsweise als Fallperson oder Kontaktperson – wird nicht durch das Profil `AffectedPerson` selbst festgelegt.

Das Profil ermöglicht neben grundlegenden demografischen Angaben insbesondere die Abbildung von:

* Identifikatoren,
* unterschiedlichen Namensarten,
* Kontaktinformationen,
* amtlichem Geschlecht,
* Geburtsdatum,
* Geburtsland,
* Staatsangehörigkeit,
* Wohn- und Aufenthaltsadressen,
* Geokoordinaten und regionalen Zuordnungen der Wohnort,
* Einrichtungsbezügen, <TODO: woher, berechnet?>
* Kommunikationssprachen,
* behandelnden Personen sowie
* Bearbeitungsinformationen.

> Bemerkung: Dieselbe Person kann beispielsweise in einem Kontext selbst eine `AffectedPerson` und in einem anderen Kontext eine `RelatedPerson` einer weiteren betroffenen Person sein.

Das Profil stellt hierfür entsprechende Slices von `Patient.link` bereit:

| Slice                     | Zweck                                                                               |
| ------------------------- | ----------------------------------------------------------------------------------- |
| `link[relatedPersonLink]` | Verknüpfung mit einer `RelatedPerson`-Repräsentation derselben physischen Person    |
| `link[patientLink]`       | Verknüpfung mit einer weiteren `Patient`-Repräsentation derselben physischen Person |

```
AffectedPerson ───── Patient.link ─────► RelatedPerson
      │                                  │
      └──── dieselbe physische Person ───┘


Fachliche Beziehung:

RelatedPerson
      │
      │ patient
      ▼
AffectedPerson
      ▲
      │
 relationship
```

### Identifikation

Eine betroffene Person kann über `Patient.identifier` mit EMIGA-spezifischen Identifiern versehen werden.

Hierzu zählen insbesondere:

* `EmigaID`
* `EmigaFileNumber`

Die Identifier ermöglichen die eindeutige Identifikation und fachliche Zuordnung einer betroffenen Person innerhalb von EMIGA.

### Namen und Anrede

Der Name einer betroffenen Person wird über `Patient.name` abgebildet.

Für unterschiedliche Namensarten werden separate `HumanName`-Einträge verwendet.

| Namensart        | FHIR-Abbildung         | Bedeutung                               |
| ---------------- | ---------------------- | --------------------------------------- |
| offizieller Name | `name.use = #official` | aktuell verwendeter offizieller Name    |
| Geburtsname      | `name.use = #maiden`   | Geburtsname der Person                  |
| Kurzname         | `name.use = #nickname` | Kurzname bzw. weiterer informeller Name |

Die Anrede wird über:

```text id="9g7pka"
name.extension[salutation]
```

abgebildet.

Für einen Namenseintrag mit:

```text id="axhdb3"
name.use = #maiden
```

gilt die Invariante `maidenNameOnlyFamily`. Entsprechend darf bei diesem Namenseintrag nur `name.family` zur Abbildung des Geburtsnamens befüllt sein.

### Geschlecht

Das Geschlecht wird grundsätzlich über:

```text id="cz6fpc"
Patient.gender
```

abgebildet. Bei Geschlcht der Person sind Werte male, female, other und Divers zur Wahl.


Zusätzlich kann das amtliche Geschlecht über die für den deutschen Kontext vorgesehene Extension angegeben werden.

Dadurch können der FHIR-Basiswert und die spezifischere amtliche Geschlechtsangabe gemeinsam übermittelt werden.

### Geburtsdatum und Geburtsland

Das Geburtsdatum wird über:

```text id="j90r55"
Patient.birthDate
```

angegeben.

Das Geburtsland wird über die EMIGA-Extension:

```text id="6ft8tw"
extension[landOfBirth]
```

abgebildet.

Die kodierte Angabe erfolgt über:

```text id="mhf3fx"
extension[landOfBirth].valueCoding
```

Damit wird das Geburtsland unabhängig von einer aktuellen oder früheren Adresse der Person als eigenes demografisches Merkmal geführt.

### Staatsangehörigkeit

Die Staatsangehörigkeit wird über:

```text id="v0vx4y"
extension[citizenship]
```

abgebildet.

Hierfür wird die HL7 Patient-Citizenship-Extension verwendet. Die Staatsangehörigkeit wird entsprechend der im Profil festgelegten Terminologie kodiert.

Eine Person kann damit unabhängig vom Geburtsland eine oder mehrere fachlich relevante Angaben zur Staatsangehörigkeit erhalten.

### Kontaktinformationen

Kontaktinformationen werden über:

```text id="2ejjq4"
Patient.telecom
```

abgebildet.

Hierzu können beispielsweise Telefonnummern, E-Mail-Adressen oder Faxnummern gehören.

Für Faxnummern ist der entsprechende Slice:

```text id="t5tbnk"
telecom[Fax]
```

vorgesehen. Dabei ist:

```text id="7ek9r4"
system = #fax
```

festgelegt.

Der angegebene Wert wird durch die profilierte Validierungsregel `validFaxNumber` geprüft.

### Adressen und Aufenthaltsorte

Adressen einer betroffenen Person werden über:

```text id="nt87bg"
Patient.address
```

abgebildet.

Über die entsprechende `AddressUse`-Extension kann die fachliche Kontext einer Adresse genauer beschrieben werden.

Damit können beispielsweise ein **Hauptwohnsitz** und ein davon abweichender **derzeitiger Aufenthaltsort** als getrennte Adresseinträge geführt werden.

Dies ist insbesondere relevant, wenn sich die Person vorübergehend an einem anderen Ort als ihrem Hauptwohnsitz aufhält.

### Strukturierte Adressbestandteile
Die postalische Adresse wird über die Elemente der deutschen Basisadresse strukturiert abgebildet.

| Attribut     | FHIR-Abbildung                                     |
| ------------ | -------------------------------------------------- |
| Straße       | `address.line.extension[Strasse].valueString`      |
| Hausnummer   | `address.line.extension[Hausnummer].valueString`   |
| Adresszusatz | `address.line.extension[Adresszusatz].valueString` |
| Postfach     | `address.line.extension[Postfach].valueString`     |
| Ort          | `address.city`                                     |
| Land         | `address.country`                                  |

Für `address.country` besteht eine Bindung an `iso3166-1-2` mit Bindungsstärke (binding strength) `extensible`.

Durch die strukturierte Abbildung können Straße, Hausnummer und weitere Bestandteile unabhängig voneinander verarbeitet werden, während `address.line` gleichzeitig eine menschenlesbare Darstellung der Anschrift ermöglicht.

### Geokoordinaten

Zusätzlich zur postalischen Adresse können über:

```text id="41q3xk"
address.extension[geolocation]
```

Geokoordinaten angegeben werden.

Die Extension unterstützt:

* `latitude`
* `longitude`

Das Profil legt nicht fest, auf welchem Weg die Geokoordinaten ermittelt wurden. Sie können beispielsweise aus einer technischen Geokodierung stammen oder anderweitig bereitgestellt worden sein.

### Regionale Zuordnung
Für eine Adresse können zusätzlich regionale Schlüssel und deren Bezugssystem angegeben werden.

Der Regionalschlüssel wird über:

```text id="3uw58z"
address.extension[regionalKey].extension[regionKey].valueString
```

abgebildet.

Das zugehörige regionale Bezugssystem wird über:

```text id="hnh5sj"
address.extension[regionalKey].extension[regionReferenceSystem].valueString
```

angegeben.

Damit kann eine postalische Adresse zusätzlich einer regionalen beziehungsweise administrativen Gebietssystematik zugeordnet werden.

### Einrichtungsbezug

Eine betroffene Person kann einer Einrichtung zugeordnet sein.

Hierfür wird die Extension:

```text id="pgy4vq"
extension[facilityAssociation]
```

verwendet.

Die Extension befindet sich direkt unter dem `Patient`-Ressource und **nicht innerhalb von `Patient.address`**.

Sie beschreibt eine weitere Adresse der Person, sondern eine fachliche Bezug zu der betroffenen Person und einer Einrichtung.

Neben dieser Referenz auf die Einrichtung kann die Art des Bezugs angegeben werden, beispielsweise eine Betreuung.

Die Modellierung lässt sich vereinfacht wie folgt darstellen:

```text id="cghu36"
AffectedPerson
      │
      │ facilityAssociation
      ▼
 Organization
      │
      └── Art der Zuordnung
          z. B. Betreuung
```

### Kommunikationssprachen

Sprachangaben werden über:

```text id="wy6hka"
Patient.communication.language
```

abgebildet.

Für die Sprache besteht eine Bindung an `CommonLanguages` mit Bindungsstärke `extensible`.

Damit können für die Kommunikation mit der betroffenen Person relevante Sprachen strukturiert angegeben werden.

### Behandelnde Person

<TODO: nur Person oder auch behandelne Einrichtung?>

Eine behandelnde Person kann über:

```text id="ym6c7v"
Patient.generalPractitioner
```

referenziert werden.

Die Referenz ermöglicht die Verknüpfung der betroffenen Person mit einer für die Behandlung beziehungsweise Versorgung relevanten Person oder Organisation entsprechend den im Profil zugelassenen Referenztypen.

### Fachlicher Bearbeitungsstatus des Person-Instanz

Der fachliche Bearbeitungsstatus einer Instanz "betroffenen Person" kann über die EMIGA-Extension:

```text id="fzyj81"
extension[processingStatus]
```

angegeben werden.

Der Bearbeitungsstatus beschreibt den fachlichen Zustand der Person-Instanz beziehungsweise des damit verbundenen Verarbeitungskontexts entsprechend der hierfür vorgesehenen EMIGA-Terminologie. <TODO: welche codesystem? check out>

### Bearbeitende EMIGA-Nutzende bei Änderungen

Über die Extension:

```text id="m4ah7x"
meta.extension[lastModifiedBy]
```

kann der EMIGA-Benutzer referenziert werden, der die Ressource zuletzt geändert hat.

Die Referenz verweist auf einen `EmigaUserPractitioner`.

Damit kann nachvollzogen werden, welcher Benutzer die letzte Änderung an der betroffenen Person vorgenommen hat.

### Sicherheit, Sichtbarkeit und Verantwortlichkeit

Über `Patient.meta.security` werden die Sichtbarkeit und Verantwortlichkeit der Ressource gesteuert.

Hierfür werden insbesondere die EMIGA-CodeSysteme für:

* `ResourceVisibilityType`
* `ResourceResponsibility`

verwendet.

Die Security Labels ermöglichen damit eine organisatorische Zuordnung der Ressource und steuern, in welchem Kontext die Informationen zur betroffenen Person sichtbar beziehungsweise weitergabefähig sind.

### Fachliche Abbildung ausgewählter Attribute
Die folgende Übersicht fasst zentrale fachliche Attribute des Person-Ressource zusammen.

<TODO: include some content in text into table>

| Attribut                                        | FHIR-Abbildung                                                                | Bemerkung                                                            |
| ----------------------------------------------- | ----------------------------------------------------------------------------- | -------------------------------------------------------------------- |
| Anrede                                          | `name.extension[salutation]`                                                  | Anrede der betroffenen Person                                        |
| Geburtsname                                     | `name.use = #maiden` und `name.family`                                        | Geburtsname         |
| Kurzname                                        | `name.use = #nickname`                                                        | Eigener Namenseintrag für Kurz- bzw. informellen Namen               |
| Straße                                          | `address.line.extension[Strasse].valueString`                                 | Strukturierter Bestandteil der Adresse                               |
| Hausnummer                                      | `address.line.extension[Hausnummer].valueString`                              | Strukturierter Bestandteil der Adresse                               |
| Adresszusatz                                    | `address.line.extension[Adresszusatz].valueString`                            | Optionaler Adresszusatz                                              |
| Postfach                                        | `address.line.extension[Postfach].valueString`                                | Postfachangabe                                                       |
| Ort                                             | `address.city`                                                                | Stadt bzw. Ort                                                       |
| Land                                            | `address.country`                                                             | Bindung an `iso3166-1-2`, `extensible`                               |
| Geo-Koordinaten                                 | `address.extension[geolocation]`                                              | Angabe von `latitude` und `longitude`                                |
| Regionalschlüssel                               | `address.extension[regionalKey].extension[regionKey].valueString`             | Regionaler bzw. administrativer Schlüssel                            |
| Regionales Bezugssystem                         | `address.extension[regionalKey].extension[regionReferenceSystem].valueString` | Bezugssystem des Regionalschlüssels                                  |
| Einrichtungsbezug                               | `extension[facilityAssociation]`                                              | Fachliche Zuordnung zu einer Einrichtung; liegt direkt auf `Patient` |
| Geburtsland                                     | `extension[landOfBirth].valueCoding`                                          | Kodierte Angabe des Geburtslands                                     |
| Staatsangehörigkeit                             | `extension[citizenship]`                                                      | Abbildung über die Patient-Citizenship-Extension                     |
| Sprachkenntnisse                                | `communication.language`                                                      | Bindung an `CommonLanguages`, `extensible`                           |
| Fax                                             | `telecom[Fax]`                                                                | `system = #fax`; Validierung über `validFaxNumber`                   |
| Behandelnde Person                              | `generalPractitioner`                                                         | Referenz auf behandelnde Person bzw. zugelassenen Referenztyp        |
| RelatedPerson-Repräsentation derselben Person   | `link[relatedPersonLink]`                                                     | Identitätsverknüpfung zu einer `RelatedPerson`-Repräsentation        |
| weitere Patient-Repräsentation derselben Person | `link[patientLink]`                                                           | Identitätsverknüpfung zu einer weiteren `Patient`-Repräsentation     |

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

