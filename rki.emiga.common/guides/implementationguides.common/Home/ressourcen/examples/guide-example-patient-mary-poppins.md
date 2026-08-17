# Example: Affected Person

## Beschreibung

Dieses Beispiel zeigt eine betroffene Person (`Patient`) mit unterschiedlichen demografischen, administrativen und kontaktbezogenen Angaben.

Die Ressource verwendet das EMIGA-Profil:

```text
https://emiga.rki.de/fhir/common/StructureDefinition/AffectedPerson
```

Das Beispiel dient insbesondere dazu, die Abbildung einer Person mit mehreren Namen und Adressen sowie zusätzlichen Angaben wie Geburtsland, Staatsangehörigkeit, amtlichem Geschlecht, Bearbeitungsstatus und einer zugeordneten Einrichtung zu veranschaulichen.

Alle verwendeten Personen-, Kontakt- und Adressdaten sind Beispieldaten.

## Beispiel-Szenario

Die Beispielperson **Mary Poppins**, geborene **Smith**, wurde am **01.01.1980** geboren.

Für die Person sind sowohl ein Hauptwohnsitz als auch ein davon abweichender derzeitiger Aufenthaltsort dokumentiert. Zusätzlich besteht eine Zuordnung zu einer Einrichtung, in der die Person betreut wird.

Die Person besitzt die deutsche Staatsangehörigkeit; als Geburtsland ist Jugoslawien angegeben. Als bevorzugte beziehungsweise dokumentierte Kommunikationssprache ist Deutsch hinterlegt.

Der Datensatz befindet sich aktuell im Bearbeitungsstatus **„In Bearbeitung“**.

## Identifikation

Die Person wird über EMIGA-spezifische Identifier identifiziert:

| Identifier        | Beispielwert            |
| ----------------- | ----------------------- |
| EMIGA ID          | `Person-DEFG-123456789` |
| EMIGA File Number | `Person-ABCD-987654321` |

Die Identifier ermöglichen die eindeutige Identifikation und fachliche Zuordnung der Person innerhalb von EMIGA.

## Name und Anrede

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

Damit werden der FHIR-Basiswert und die für den deutschen Kontext spezifischere amtliche Angabe gemeinsam abgebildet.

## Geburtsdatum und Geburtsland

Das Geburtsdatum der Person ist:

```text
1980-01-01
```

Das Geburtsland wird über die EMIGA-Extension:

```text
https://emiga.rki.de/fhir/common/Extension/LandOfBirth
```

angegeben.

Im Beispiel ist hinterlegt:

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

abgebildet.

Im Beispiel besitzt die Person die Staatsangehörigkeit:

```text
D – Deutschland
```

Auch hierfür wird das DEÜV-CodeSystem für Länderkennzeichen verwendet.

## Kontaktdaten

Für die Beispielperson sind sowohl eine E-Mail-Adresse als auch eine Telefonnummer hinterlegt:

| Kontaktart | Beispielwert               |
| ---------- | -------------------------- |
| E-Mail     | `mary.poppins@example.com` |
| Telefon    | `+49301234567`             |

Die Angaben werden über `Patient.telecom` übermittelt.

## Hauptwohnsitz

Die erste Adresse wird über die DEMIS-Extension `AddressUse` als:

```text
primary – Hauptwohnsitz
```

klassifiziert.

Im Beispiel lautet der Hauptwohnsitz:

> Cherry Tree Lane 1
> 12345 Berminghausen
> Deutschland

Zusätzlich enthält die Adresse eine Geolokation mit Breiten- und Längengrad.

Die Klassifikation der Adresse erfolgt über:

```text
https://demis.rki.de/fhir/StructureDefinition/AddressUse
```

mit dem Code:

```text
primary
```

## Derzeitiger Aufenthaltsort

Neben dem Hauptwohnsitz ist ein derzeitiger Aufenthaltsort angegeben.

Dieser wird über `AddressUse` als:

```text
current – Derzeitiger Aufenthaltsort
```

gekennzeichnet.

Im Beispiel lautet die Adresse:

> Blossom Hill 2
> 54321 Blumenland
> Deutschland

Das Beispiel verdeutlicht damit insbesondere, dass der **melderechtliche beziehungsweise primäre Wohnsitz und der aktuelle Aufenthaltsort einer Person voneinander abweichen können** und als getrennte `Patient.address`-Einträge übermittelt werden.

Bei dieser Adresse werden Straße und Hausnummer zusätzlich strukturiert über die FHIR-Extensions

```text
http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName
http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber
```

abgebildet.

## Geolokation

Für die Adressen können zusätzlich geografische Koordinaten angegeben werden.

Hierfür wird die Standard-FHIR-Extension:

```text
http://hl7.org/fhir/StructureDefinition/geolocation
```

verwendet.

Sie enthält die Elemente `latitude` und `longitude`.

Die Geokoordinaten ergänzen die postalische Adresse und ermöglichen eine geografische Verortung der angegebenen Adresse.

## Zugeordnete Einrichtung

Über die EMIGA-Extension:

```text
https://emiga.rki.de/fhir/common/Extension/FacilityAddressAffectedPerson
```

wird eine für die betroffene Person relevante Einrichtung referenziert.

Im Beispiel wird auf folgende Organisation verwiesen:

```text
http://example.org/fhir/Organization/4550
```

Zusätzlich wird die Art der Beziehung zwischen der Person und der Einrichtung angegeben.

Im Beispiel lautet diese:

```text
care – Betreuung
```

Die Art der Zuordnung wird über das DEMIS-CodeSystem:

```text
https://demis.rki.de/fhir/CodeSystem/organizationAssociation
```

kodiert.

Das Beispiel beschreibt somit eine Person, die einer Einrichtung im Kontext einer **Betreuung** zugeordnet ist.

## Bearbeitungsstatus

Der fachliche Bearbeitungsstatus der Person wird über die Extension:

```text
https://emiga.rki.de/fhir/common/Extension/ProcessingStatus
```

angegeben.

Im Beispiel:

```text
inprogress – In Bearbeitung
```

Damit wird ausgedrückt, dass die Bearbeitung des Datensatzes beziehungsweise des zugehörigen fachlichen Vorgangs noch nicht abgeschlossen ist.

## Kommunikationssprache

Über `Patient.communication` ist Deutsch als Sprache der Person angegeben:

```text
de – Deutsch
```

Die Sprache wird entsprechend BCP 47 über das System:

```text
urn:ietf:bcp:47
```

kodiert.

## Sterbedatum

Das Beispiel enthält außerdem ein Sterbedatum:

```text
2025-04-11T10:00:00+01:00
```

Dieses wird über `Patient.deceasedDateTime` angegeben und dokumentiert, dass die betroffene Person verstorben ist.

## Änderungshistorie

Über die Extension `LastModifiedBy` in `Patient.meta` wird der Benutzer referenziert, der die Ressource zuletzt geändert hat.

Im Beispiel:

```text
Practitioner/EmigaUser-001
```

Die verwendete Extension lautet:

```text
https://emiga.rki.de/fhir/common/Extension/LastModifiedBy
```

Damit kann die letzte Änderung der Ressource einem EMIGA-Benutzer zugeordnet werden.

## Sicherheit, Sichtbarkeit und Verantwortlichkeit

Über `Patient.meta.security` werden die Sichtbarkeit und die fachliche Verantwortlichkeit der Ressource angegeben.

Im Beispiel ist die Sichtbarkeit auf:

```text
inAgency – Eigene ÖGD-Stelle
```

gesetzt.

Die Ressource ist damit für die eigene ÖGD-Stelle vorgesehen.

Als verantwortliche Stelle wird über `ResourceResponsibility` angegeben:

```text
1. – Robert Koch-Institut
```

Die Security Labels ermöglichen damit die Steuerung der organisatorischen Sichtbarkeit und Verantwortlichkeit der betroffenen Person innerhalb von EMIGA.

## Zusammenfassung

Dieses Beispiel zeigt eine umfangreich beschriebene betroffene Person und veranschaulicht insbesondere:

* Identifikation über EMIGA-spezifische Identifier
* offiziellen Namen, Geburtsnamen und weiteren Namen
* Anrede
* FHIR-Geschlecht und amtliches Geschlecht
* Geburtsdatum und Geburtsland
* Staatsangehörigkeit
* E-Mail-Adresse und Telefonnummer
* Hauptwohnsitz und davon abweichenden derzeitigen Aufenthaltsort
* strukturierte Adressbestandteile und Geolokation
* Zuordnung zu einer betreuenden Einrichtung
* Bearbeitungsstatus
* Kommunikationssprache
* Sterbedatum
* Dokumentation des zuletzt ändernden Benutzers
* Sichtbarkeit und organisatorische Verantwortlichkeit

Das Beispiel verdeutlicht damit, wie unterschiedliche demografische und administrative Informationen einer betroffenen Person im EMIGA-Profil `AffectedPerson` gemeinsam abgebildet werden können.
