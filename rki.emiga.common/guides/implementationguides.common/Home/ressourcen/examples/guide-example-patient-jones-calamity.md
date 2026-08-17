# Example: Affected Person with Related Person Reference

## Beschreibung

Dieses Beispiel zeigt eine betroffene Person (`Patient`) im EMIGA-Kontext mit grundlegenden demografischen und administrativen Angaben sowie einer Verknüpfung zu einer zugehörigen `RelatedPerson`.

Die Ressource verwendet das EMIGA-Profil:

```text
https://emiga.rki.de/fhir/common/StructureDefinition/AffectedPerson
```

Das Beispiel veranschaulicht insbesondere:

* die Identifikation einer betroffenen Person über EMIGA-spezifische Identifier,
* die Abbildung verschiedener Namensarten,
* Staatsangehörigkeit und Geburtsland,
* amtliches Geschlecht,
* Hauptwohnsitz mit strukturierter Adresse und Geokoordinaten,
* Bearbeitungsstatus,
* Kommunikationssprache,
* sowie die Verknüpfung zu einer weiteren Person über `Patient.link`.

Alle verwendeten Personen-, Kontakt- und Adressdaten sind Beispieldaten.

## Beispiel-Szenario

Die Beispielperson **Jones Calamity**, geborene **Doe**, wurde am **01.01.1980** geboren.

Für die Person sind ein Hauptwohnsitz, Kontaktinformationen und Deutsch als Kommunikationssprache dokumentiert. Die Person besitzt die deutsche Staatsangehörigkeit; als Geburtsland ist Jugoslawien angegeben.

Der Datensatz befindet sich im Bearbeitungsstatus **„In Bearbeitung“**.

Zusätzlich ist die betroffene Person über `Patient.link` mit einer `RelatedPerson` verknüpft. Damit kann eine weitere für den fachlichen Kontext relevante Person referenziert werden.

## Identifikation

Die betroffene Person wird über EMIGA-spezifische Identifier identifiziert:

| Identifier        | Beispielwert             |
| ----------------- | ------------------------ |
| EMIGA ID          | `Person-PQRST-123456789` |
| EMIGA File Number | `Person-XYZ-987654321`   |

Die Identifier ermöglichen die eindeutige Identifikation und fachliche Zuordnung der Person innerhalb von EMIGA.

## Name und Anrede

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

## Geschlecht

Für `Patient.gender` wird im Beispiel der FHIR-Wert:

```text
other
```

verwendet.

Zusätzlich wird über die deutsche Extension:

```text
http://fhir.de/StructureDefinition/gender-amtlich-de
```

das amtliche Geschlecht angegeben:

```text
D – divers
```

Damit werden der FHIR-Basiswert und die spezifischere amtliche Geschlechtsangabe für den deutschen Kontext gemeinsam abgebildet.

## Geburtsdatum

Das Geburtsdatum der betroffenen Person lautet:

```text
1980-01-01
```

und wird über `Patient.birthDate` angegeben.

## Geburtsland

Das Geburtsland wird über die EMIGA-Extension:

```text
https://emiga.rki.de/fhir/common/Extension/LandOfBirth
```

abgebildet.

Im Beispiel:

```text
YU – Jugoslawien
```

Die Kodierung erfolgt über:

```text
http://fhir.de/CodeSystem/deuev/anlage-8-laenderkennzeichen
```

## Staatsangehörigkeit

Die Staatsangehörigkeit wird über die FHIR-Extension:

```text
http://hl7.org/fhir/StructureDefinition/patient-citizenship
```

angegeben.

Im Beispiel ist folgende Staatsangehörigkeit dokumentiert:

```text
D – Deutschland
```

Die Kodierung erfolgt ebenfalls über das DEÜV-CodeSystem für Länderkennzeichen.

## Kontaktdaten

Für die betroffene Person sind eine E-Mail-Adresse und eine Telefonnummer hinterlegt:

| Kontaktart | Beispielwert                 |
| ---------- | ---------------------------- |
| E-Mail     | `jones.calamity@example.com` |
| Telefon    | `+493087654321`              |

Die Angaben werden über `Patient.telecom` übermittelt.

## Hauptwohnsitz

Für die Person ist ein Hauptwohnsitz angegeben.

Die Adresse wird über die DEMIS-Extension:

```text
https://demis.rki.de/fhir/StructureDefinition/AddressUse
```

mit folgendem Wert klassifiziert:

```text
primary – Hauptwohnsitz
```

Im Beispiel lautet die Adresse:

> Blossom Lane 1
> 12345 Berminghausen
> Deutschland

Zusätzlich ist das Bundesland über:

```text
DE-BE
```

angegeben.

## Strukturierte Adresse

Neben der vollständigen Darstellung:

```text
Blossom Lane 1
```

werden Straße und Hausnummer zusätzlich strukturiert über FHIR-Extensions angegeben:

```text
http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName
```

mit:

```text
Blossom Lane
```

und:

```text
http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber
```

mit:

```text
1
```

Damit kann die Adresse sowohl menschenlesbar als auch strukturiert verarbeitet werden.

## Geolokation

Die Adresse enthält zusätzlich geografische Koordinaten über die Standard-FHIR-Extension:

```text
http://hl7.org/fhir/StructureDefinition/geolocation
```

Im Beispiel werden Breiten- und Längengrad über `latitude` und `longitude` angegeben.

Die Geokoordinaten ergänzen die postalische Adresse um eine maschinenverarbeitbare geografische Position.

## Bearbeitungsstatus

Der fachliche Bearbeitungsstatus wird über die EMIGA-Extension:

```text
https://emiga.rki.de/fhir/common/Extension/ProcessingStatus
```

angegeben.

Im Beispiel:

```text
inprogress – In Bearbeitung
```

Der Datensatz beziehungsweise der damit verbundene fachliche Vorgang befindet sich damit noch in Bearbeitung.

## Kommunikationssprache

Über `Patient.communication` wird Deutsch als Sprache angegeben:

```text
de – Deutsch
```

Die Kodierung erfolgt entsprechend BCP 47 über:

```text
urn:ietf:bcp:47
```

## Verknüpfung zu einer RelatedPerson

Eine Besonderheit dieses Beispiels ist die Verwendung von `Patient.link`.

Darüber wird die betroffene Person mit folgender Ressource verknüpft:

```text
RelatedPerson/RelatedPerson4551
```

Der Link besitzt den Typ:

```text
seealso
```

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

Die konkrete fachliche Beziehung der `RelatedPerson` zur betroffenen Person wird in der referenzierten `RelatedPerson`-Ressource beschrieben.

## Änderungshistorie

Über die Extension:

```text
https://emiga.rki.de/fhir/common/Extension/LastModifiedBy
```

in `Patient.meta` wird der Benutzer angegeben, der die Ressource zuletzt geändert hat.

Im Beispiel:

```text
Practitioner/EmigaUser-001
```

Damit kann die letzte Änderung einer betroffenen Person einem EMIGA-Benutzer zugeordnet werden.

## Sicherheit, Sichtbarkeit und Verantwortlichkeit

Über `Patient.meta.security` werden die Sichtbarkeit und Verantwortlichkeit der Ressource beschrieben.

Die Sichtbarkeit lautet:

```text
inAgency – Eigene ÖGD-Stelle
```

Die Ressource ist damit für die eigene ÖGD-Stelle vorgesehen.

Als verantwortliche Stelle wird angegeben:

```text
1. – Robert Koch-Institut
```

Die entsprechenden Security Labels ermöglichen die organisatorische Steuerung von Sichtbarkeit und Verantwortlichkeit innerhalb von EMIGA.

## Fachlicher Schwerpunkt des Beispiels

Der Schwerpunkt dieses Beispiels liegt auf einer betroffenen Person mit einem vergleichsweise kompakten Satz an demografischen Informationen und einer zusätzlichen Personenverknüpfung.

Besonders veranschaulicht werden:

* ein einzelner Hauptwohnsitz,
* strukturierte Adressinformationen,
* Geokoordinaten,
* verschiedene Namensformen,
* Staatsangehörigkeit und Geburtsland,
* amtliches Geschlecht,
* sowie die Referenz auf eine zugehörige `RelatedPerson` über `Patient.link`.

## Zusammenfassung

Dieses Beispiel zeigt eine EMIGA-konforme betroffene Person mit:

* EMIGA-spezifischen Identifiern,
* offiziellem Namen, Geburtsnamen und weiterem Namen,
* Anrede,
* FHIR-Geschlecht und amtlichem Geschlecht,
* Geburtsdatum und Geburtsland,
* Staatsangehörigkeit,
* Kontaktinformationen,
* Hauptwohnsitz,
* strukturierter Adresse und Geolokation,
* Bearbeitungsstatus,
* Kommunikationssprache,
* Änderungsinformation,
* Security Labels,
* sowie einer Verknüpfung zu einer `RelatedPerson`.

Der besondere fachliche Schwerpunkt liegt auf der Modellierung einer zusätzlichen personenbezogenen Beziehung über `Patient.link`.
