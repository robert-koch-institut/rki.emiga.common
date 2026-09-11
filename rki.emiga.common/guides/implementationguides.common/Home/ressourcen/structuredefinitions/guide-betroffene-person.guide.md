---
topic: AffectedPerson
canonical: https://emiga.rki.de/fhir/common/StructureDefinition/AffectedPerson
---

# {{page-title}}

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

### Abgrenzung zu anderen Personenressourcen
Im EMIGA-Datenmodell können natürliche Personen abhängig von ihrer fachlichen Rolle durch unterschiedliche FHIR-Ressourcen repräsentiert werden.

| Ressource       | EMIGA-Profil                  | Fachliche Rolle                                                             |
| --------------- | ----------------------------- | --------------------------------------------------------------------------- |
| `Betroffene Person`       | `AffectedPerson`        | Person, die vom fachlichen Vorgang betroffen ist (darunter Fallperson, Kontakperson)                            |
| `RelatedPerson` | `AffectedPersonRelatedPerson` | Person, die in einer fachlichen Beziehung zu einer betroffenen Person steht |
| `Practitioner`  | `EmigaUserPractitioner`       | EMIGA-Nutzende                                    |

Das Profil `AffectedPerson` basiert auf der FHIR-Basisressource `Patient` und dient der Abbildung einer **betroffenen Person im fachlichen Kontext von EMIGA**.

Eine `AffectedPerson` repräsentiert die Person, auf die sich ein fachlicher Vorgang (z.B. ein Fall) bezieht. Welche konkrete fachliche Rolle die Person innerhalb eines Vorgangs einnimmt – beispielsweise als Fallperson oder Kontaktperson – wird nicht durch das Profil `AffectedPerson` selbst festgelegt.


### Namen und Anrede

Der Name einer betroffenen Person wird über `Patient.name` abgebildet.

Für unterschiedliche Namensarten werden separate `HumanName`-Einträge verwendet.

| Namensart        | FHIR-Abbildung         | Bedeutung                               |
| ---------------- | ---------------------- | --------------------------------------- |
| offizieller Name | `name.use = #official` | aktuell verwendeter offizieller Name    |
| Geburtsname      | `name.use = #maiden`   | Geburtsname der Person                  |
| Kurzname         | `name.use = #nickname` | Kurzname bzw. weiterer informeller Name |

Die Anrede wird über `name.extension[salutation]` abgebildet.

Für einen Namenseintrag mit `name.use = #maiden` gilt die Invariante `maidenNameOnlyFamily`. Entsprechend darf bei diesem Namenseintrag nur `name.family` zur Abbildung des Geburtsnamens befüllt sein.

### Geschlecht

Das Geschlecht wird grundsätzlich über `Patient.gender` 
abgebildet. Bei Geschlcht der Person sind Werte male, female, other und Divers zur Wahl.

Zusätzlich kann das amtliche Geschlecht über die für den deutschen Kontext vorgesehene Extension angegeben werden.

Dadurch können der FHIR-Basiswert und die spezifischere amtliche Geschlechtsangabe parallel übermittelt werden.

### Geburtsdatum und Geburtsland

Das Geburtsdatum wird über `Patient.birthDate` angegeben.

Das Geburtsland wird über die EMIGA-Extension `extension[landOfBirth]` abgebildet.

Die kodierte Angabe erfolgt über `extension[landOfBirth].valueCoding`.
Damit wird das Geburtsland unabhängig von einer aktuellen oder früheren Adresse der Person als eigenes demografisches Merkmal geführt.

### Staatsangehörigkeit

Die Staatsangehörigkeit wird über `extension[citizenship]` 
abgebildet.

Hierfür wird die HL7 Patient-Citizenship-Extension verwendet. Die Staatsangehörigkeit wird entsprechend der im Profil festgelegten Terminologie kodiert.
Eine Person kann unabhängig vom Geburtsland eine oder mehrere fachlich relevante Angaben zur Staatsangehörigkeit erhalten.

### Kontaktinformationen

Kontaktinformationen werden über `Patient.telecom`abgebildet.
Hierzu können beispielsweise Telefonnummern, E-Mail-Adressen oder Faxnummern gehören.

Für Faxnummern ist der entsprechende Slice `telecom[Fax]` vorgesehen. Dabei ist `system = #fax` festgelegt.

Der angegebene Wert wird durch die profilierte Validierungsregel `validFaxNumber` geprüft.

### Adressen und Aufenthaltsorte

Adressen einer betroffenen Person werden über `Patient.address` abgebildet.

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

Zusätzlich zur postalischen Adresse können über `address.extension[geolocation]` Geokoordinaten angegeben werden.

Die Extension unterstützt:

* `latitude`
* `longitude`

Das Profil legt nicht fest, auf welchem Weg die Geokoordinaten ermittelt wurden. Sie können beispielsweise aus einer technischen Geokodierung stammen oder anderweitig bereitgestellt worden sein.

### Regionale Zuordnung
Für eine Adresse können zusätzlich regionale Schlüssel und deren Bezugssystem angegeben werden.

Der Regionalschlüssel wird über `address.extension[regionalKey].extension[regionKey].valueString` abgebildet.

Das zugehörige regionale Bezugssystem wird über `address.extension[regionalKey].extension[regionReferenceSystem].valueString` 
angegeben.
Damit kann eine postalische Adresse zusätzlich einer regionalen beziehungsweise administrativen Gebietssystematik zugeordnet werden.

### Einrichtungsbezug

Eine betroffene Person kann einer Einrichtung zugeordnet sein.

Hierfür wird die Extension `extension[facilityAssociation]` verwendet.

Diese Extension befindet sich direkt unter dem `Patient`-Ressource und **nicht innerhalb von `Patient.address`**.

Sie beschreibt keine weitere Adresse der Person, sondern eine fachliche Bezug der betroffenen Person zu einer Einrichtung.

Neben dieser Referenz auf die Einrichtung kann die Art des Bezugs angegeben werden, beispielsweise eine Betreuung.


### Fachlicher Bearbeitungsstatus des Person-Instanz

Der fachliche Bearbeitungsstatus einer Instanz "betroffenen Person" kann über die EMIGA-Extension `extension[processingStatus]` angegeben werden.

### Bearbeitende EMIGA-Nutzende

Über die Extension `meta.extension[lastModifiedBy]` kann der EMIGA-Benutzer referenziert werden, der die Ressource zuletzt geändert hat.

Die Referenz verweist auf einen `EmigaUserPractitioner`.

Damit kann nachvollzogen werden, welcher Benutzer die letzte Änderung an der betroffenen Person vorgenommen hat.

### Fachliche Abbildung ausgewählter Attribute
Die folgende Übersicht fasst zentrale fachliche Attribute des Person-Ressource zusammen.

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
| Behandelnde Person                              | `generalPractitioner`                                                         | Referenz auf behandelnde Person bzw. zugelassenen Referenztyp (derzeit nicht verwendet)       |
| RelatedPerson-Repräsentation derselben Person   | `link[relatedPersonLink]`                                                     | Identitätsverknüpfung zu einer `RelatedPerson`-Repräsentation        |
| weitere Patient-Repräsentation derselben Person | `link[patientLink]`                                                           | Identitätsverknüpfung zu einer weiteren `Patient`-Repräsentation     |

<br>&nbsp;<br>

# Beispiel 1: Affected Person

Dieses Beispiel zeigt die Abbildung einer betroffenen Person (`Patient`) mit demografischen, administrativen und kontaktbezogenen Angaben.

Die Ressource verwendet das EMIGA-Profil `https://emiga.rki.de/fhir/common/StructureDefinition/AffectedPerson`.

## Beispiel-Szenario

Die Beispielperson **Mary Poppins**, geborene **Smith**, wurde am **01.01.1980** geboren.

Für die Person sind sowohl ein Hauptwohnsitz als auch ein davon abweichender derzeitiger Aufenthaltsort dokumentiert. Zusätzlich besteht eine Zuordnung zu einer Einrichtung, in der die Person betreut wird.

Die Person besitzt die deutsche Staatsangehörigkeit; als Geburtsland ist Jugoslawien angegeben. Als bevorzugte beziehungsweise dokumentierte Kommunikationssprache ist Deutsch hinterlegt.

### Identifikation

Die Person wird über EMIGA-spezifische Identifier identifiziert:

| Identifier        | Beispielwert            |
| ----------------- | ----------------------- |
| EMIGA ID          | `Person-DEFG-123456789` |
| EMIGA File Number | `Person-ABCD-987654321` |

Die Identifier ermöglichen die eindeutige Identifikation und fachliche Zuordnung der Person innerhalb von EMIGA.

### Name und Anrede

Der offizielle Name der Beispielperson lautet:

> Mary Poppins

Über die Extension `Salutation` ist zusätzlich die Anrede:

> Sehr geehrte Frau

hinterlegt.

Neben dem offiziellen Namen enthält das Beispiel weitere Namensangaben:

| `HumanName.use` | Beispiel     | Bedeutung im Beispiel          |
| --------------- | ------------ | ------------------------------ |
| `official`      | Mary Poppins | offizieller Name               |
| `maiden`        | Smith        | Geburtsname                    |
| `nickname`      | Popp         | weiterer bzw. informeller Name |

Damit wird veranschaulicht, wie unterschiedliche Namensarten einer betroffenen Person über `Patient.name` abgebildet werden können.

### Geschlecht

Für `Patient.gender` wird im Beispiel der FHIR-Wert `other` verwendet.

Zusätzlich wird über die deutsche Extension `http://fhir.de/StructureDefinition/gender-amtlich-de`das amtliche Geschlecht angegeben `D – divers`.
Damit werden sowohl der FHIR-Basiswert als auch die für den deutschen Kontext spezifischere amtliche Angabe nebeneinander abgebildet.

### Geburtsdatum und Geburtsland

Das Geburtsdatum der Person ist `1980-01-01`.
Das Geburtsland wird über die EMIGA-Extension `https://emiga.rki.de/fhir/common/Extension/LandOfBirth` angegeben.
Im Beispiel ist hinterlegt `YU – Jugoslawien`.
Die Kodierung erfolgt über `http://fhir.de/CodeSystem/deuev/anlage-8-laenderkennzeichen`.

### Staatsangehörigkeit

Die Staatsangehörigkeit wird über die FHIR-Extension `http://hl7.org/fhir/StructureDefinition/patient-citizenship` abgebildet.

Im Beispiel besitzt die Person die Staatsangehörigkeit `D – Deutschland`.
Auch hierfür wird das DEÜV-CodeSystem für Länderkennzeichen verwendet.

### Kontaktdaten

Für die Beispielperson sind sowohl eine E-Mail-Adresse als auch eine Telefonnummer über `Patient.telecom` hinterlegt:

| Kontaktart | Beispielwert               |
| ---------- | -------------------------- |
| E-Mail     | `mary.poppins@example.com` |
| Telefon    | `+49301234567`             |

### Hauptwohnsitz

Die erste Adresse wird über die DEMIS-Extension `AddressUse` als `primary – Hauptwohnsitz` klassifiziert.

Im Beispiel lautet der Hauptwohnsitz:

> Cherry Tree Lane 1
> 12345 Berminghausen
> Deutschland

Die Klassifikation der Adresse erfolgt über `https://demis.rki.de/fhir/StructureDefinition/AddressUse` mit dem Code `primary`.

### Derzeitiger Aufenthaltsort

Neben dem Hauptwohnsitz ist ein derzeitiger Aufenthaltsort angegeben.

Dieser wird über `AddressUse` als `current – Derzeitiger Aufenthaltsort` gekennzeichnet.
Im Beispiel lautet die Adresse:

> Blossom Hill 2
> 54321 Blumenland
> Deutschland

Das Beispiel verdeutlicht damit insbesondere, dass der melderechtliche beziehungsweise primäre Wohnsitz und der aktuelle Aufenthaltsort einer Person voneinander abweichen können und als getrennte `Patient.address`-Einträge übermittelt werden können.

### Geolokation

Für die Adressen können zusätzlich geografische Koordinaten angegeben werden.

Hierfür wird die Standard-FHIR-Extension `http://hl7.org/fhir/StructureDefinition/geolocation` verwendet.

Sie enthält die Elemente `latitude` und `longitude`.

Die Geokoordinaten ermöglichen eine geografische Verortung der angegebenen Adresse.

## Zugeordnete Einrichtung

Über die EMIGA-Extension `https://emiga.rki.de/fhir/common/Extension/FacilityAddressAffectedPerson` wird eine für die betroffene Person relevante Einrichtung referenziert.
Im Beispiel wird auf folgende Organisation verwiesen `http://example.org/fhir/Organization/4550`.
Zusätzlich wird die Art der Beziehung zwischen der Person und der Einrichtung angegeben.

Im Beispiel lautet diese `care – Betreuung`. 
Die Art der Zuordnung wird über das DEMIS-CodeSystem `https://demis.rki.de/fhir/CodeSystem/organizationAssociation` kodiert.

Das Beispiel beschreibt somit eine Person, die einer Einrichtung im Kontext einer **Betreuung** zugeordnet ist.

### Bearbeitungsstatus

Der fachliche Bearbeitungsstatus der Person wird über die Extension `https://emiga.rki.de/fhir/common/Extension/ProcessingStatus` angegeben.
Im Beispiel `inprogress – In Bearbeitung`.
Damit wird ausgedrückt, dass die Bearbeitung des Datensatzes beziehungsweise des zugehörigen fachlichen Vorgangs noch nicht abgeschlossen ist.

### Kommunikationssprache

Über `Patient.communication` ist Deutsch als Sprache der Person angegeben: `de – Deutsch`.

Die Sprache wird entsprechend BCP 47 über das System `urn:ietf:bcp:47` kodiert.

### Sterbedatum

Das Beispiel enthält außerdem ein Sterbedatum `2025-04-11T10:00:00+01:00`.

Dieses wird über `Patient.deceasedDateTime` angegeben und dokumentiert, dass die betroffene Person verstorben ist.

### Änderungshistorie

Über die Extension `LastModifiedBy` in `Patient.meta` wird der Nutzende referenziert, der die Ressource zuletzt geändert hat.
Im Beispiel: `Practitioner/EmigaUser-001`.

Die verwendete Extension lautet `https://emiga.rki.de/fhir/common/Extension/LastModifiedBy`.
Damit kann die letzte Änderung der Datensatz einem EMIGA-Nutzende zugeordnet werden.

Das Beispiel dient insbesondere dazu, die Abbildung einer betroffene Person mit mehreren Namen und Adressen sowie zusätzlichen Angaben wie Geburtsland, Staatsangehörigkeit, amtlichem Geschlecht, Bearbeitungsstatus und einer zugeordneten Einrichtung zu veranschaulichen.


# Beispiel 2: Affected Person with Related Person Reference

Dieses Beispiel zeigt eine betroffene Person (`Patient`) im EMIGA-Kontext mit demografischen und administrativen Angaben sowie einer Verknüpfung zu einer zugehörigen `RelatedPerson`.

Die Ressource verwendet das EMIGA-Profil:

```text
https://emiga.rki.de/fhir/common/StructureDefinition/AffectedPerson
```

### Beispiel-Szenario

Die Beispielperson **Jones Calamity**, geborene **Doe**, wurde am **01.01.1980** geboren.

Für die Person sind ein Hauptwohnsitz, Kontaktinformationen und Deutsch als Kommunikationssprache dokumentiert. Die Person besitzt die deutsche Staatsangehörigkeit; als Geburtsland ist Jugoslawien angegeben.

Zusätzlich ist die betroffene Person über `Patient.link` mit einer `RelatedPerson` verknüpft.

### Identifikation

Die betroffene Person wird über EMIGA-spezifische Identifier identifiziert:

| Identifier        | Beispielwert             |
| ----------------- | ------------------------ |
| EMIGA ID          | `Person-PQRST-123456789` |
| EMIGA File Number | `Person-XYZ-987654321`   |

Die Identifier ermöglichen die eindeutige Identifikation und fachliche Zuordnung der Person innerhalb von EMIGA.

### Name und Anrede

Der offizielle Name der Beispielperson lautet:

> Jones Calamity

Über die Extension `Salutation` ist zusätzlich die Anrede:

> Sehr geehrte Frau

hinterlegt.

Das Beispiel enthält mehrere Namensformen:

| `HumanName.use` | Beispiel       | Bedeutung im Beispiel          |
| --------------- | -------------- | ------------------------------ |
| `official`      | Jones Calamity | offizieller Name               |
| `maiden`        | Doe            | Geburtsname                    |
| `nickname`      | Calam          | weiterer bzw. informeller Name |

Damit wird gezeigt, wie unterschiedliche Namensarten einer betroffenen Person über `Patient.name` abgebildet werden können.

### Geschlecht

Für `Patient.gender` wird im Beispiel der FHIR-Wert `other` verwendet.
Zusätzlich wird über die deutsche Extension `http://fhir.de/StructureDefinition/gender-amtlich-de` das amtliche Geschlecht angegeben: `D – divers`.
Damit werden der FHIR-Basiswert und die spezifischere amtliche Geschlechtsangabe für den deutschen Kontext nebeneinander abgebildet.

### Geburtsdatum

Das Geburtsdatum der betroffenen Person lautet `1980-01-01` und wird über `Patient.birthDate` angegeben.

### Geburtsland

Das Geburtsland wird über die EMIGA-Extension `https://emiga.rki.de/fhir/common/Extension/LandOfBirth` abgebildet. Im Beispiel: `YU – Jugoslawien`.
Die Kodierung erfolgt über `http://fhir.de/CodeSystem/deuev/anlage-8-laenderkennzeichen`.

### Staatsangehörigkeit

Die Staatsangehörigkeit wird über die FHIR-Extension `http://hl7.org/fhir/StructureDefinition/patient-citizenship` angegeben.
Im Beispiel ist folgende Staatsangehörigkeit dokumentiert `D – Deutschland`.
Die Kodierung erfolgt ebenfalls über das DEÜV-CodeSystem für Länderkennzeichen.

### Kontaktdaten

Für die betroffene Person sind eine E-Mail-Adresse und eine Telefonnummer hinterlegt:

| Kontaktart | Beispielwert                 |
| ---------- | ---------------------------- |
| E-Mail     | `jones.calamity@example.com` |
| Telefon    | `+493087654321`              |

Die Angaben werden über `Patient.telecom` übermittelt.

### Hauptwohnsitz

Für die Person ist ein Hauptwohnsitz angegeben.

Die Adresse wird über die DEMIS-Extension `https://demis.rki.de/fhir/StructureDefinition/AddressUse` mit folgendem Wert klassifiziert: `primary – Hauptwohnsitz`.
Im Beispiel lautet die Adresse:
> Blossom Lane 1
> 12345 Berminghausen
> Deutschland

Zusätzlich ist das Bundesland über `DE-BE` angegeben.

### Strukturierte Adresse

Neben der vollständigen Darstellung:

> Blossom Lane 1

werden Straße und Hausnummer zusätzlich strukturiert über FHIR-Extensions angegeben: `http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName` mit `Blossom Lane` und `http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber` mit `1`.

Damit kann die Adresse sowohl menschenlesbar als auch strukturiert verarbeitet werden.

### Geolokation

Die Adresse enthält zusätzlich geografische Koordinaten über die Standard-FHIR-Extension `http://hl7.org/fhir/StructureDefinition/geolocation`.
Im Beispiel werden Breiten- und Längengrad über `latitude` und `longitude` angegeben.

### Bearbeitungsstatus

Der fachliche Bearbeitungsstatus wird über die EMIGA-Extension `https://emiga.rki.de/fhir/common/Extension/ProcessingStatus` angegeben.
Im Beispiel: `inprogress – In Bearbeitung`.

Der Datensatz beziehungsweise der damit verbundene fachliche Vorgang befindet sich damit noch in Bearbeitung.

### Kommunikationssprache

Über `Patient.communication` wird Deutsch als Sprache angegeben: `DE – Deutsch`.
Die Kodierung erfolgt entsprechend BCP 47 über `urn:ietf:bcp:47`.

### Verknüpfung zu einer RelatedPerson

Eine Besonderheit dieses Beispiels ist die Verwendung von `Patient.link`.

Darüber wird die betroffene Person mit folgender Ressource `RelatedPerson/RelatedPerson4551`verknüpft. Der Link besitzt den Typ `seealso`.

Damit wird ausgedrückt, dass die referenzierte `RelatedPerson` zusätzliche Informationen enthält, die im Zusammenhang mit der betroffenen Person relevant sind.

Die Verknüpfung wird im Beispiel wie folgt dargestellt:

```json
{
  "other": {
    "reference": "RelatedPerson/RelatedPerson4551",
    "type": "RelatedPerson"
  },
  "type": "seealso"
}
```

Die konkrete fachliche Beziehung der `RelatedPerson` zur dieser betroffenen Person wird in der referenzierten `RelatedPerson`-Ressource beschrieben.

### Änderungshistorie

Über die Extension:

```text
https://emiga.rki.de/fhir/common/Extension/LastModifiedBy
```

in `Patient.meta` wird der Nutzende angegeben, der die Ressource zuletzt geändert hat.

Im Beispiel: `Practitioner/EmigaUser-001`

Damit kann die letzte Änderung einer betroffenen Person einem EMIGA-Nutzende zugeordnet werden.
