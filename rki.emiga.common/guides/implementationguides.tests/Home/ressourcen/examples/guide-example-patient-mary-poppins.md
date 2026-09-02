# Beispiel: Affected Person

Dieses Beispiel zeigt die Abbildung einer betroffenen Person (`Patient`) mit demografischen, administrativen und kontaktbezogenen Angaben.

Die Ressource verwendet das EMIGA-Profil:

```text
https://emiga.rki.de/fhir/common/StructureDefinition/AffectedPerson
```

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

Damit werden sowohl der FHIR-Basiswert als auch die für den deutschen Kontext spezifischere amtliche Angabe nebeneinander abgebildet.

### Geburtsdatum und Geburtsland

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

### Staatsangehörigkeit

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

### Kontaktdaten

Für die Beispielperson sind sowohl eine E-Mail-Adresse als auch eine Telefonnummer über `Patient.telecom` hinterlegt:

| Kontaktart | Beispielwert               |
| ---------- | -------------------------- |
| E-Mail     | `mary.poppins@example.com` |
| Telefon    | `+49301234567`             |

### Hauptwohnsitz

Die erste Adresse wird über die DEMIS-Extension `AddressUse` als:

```text
primary – Hauptwohnsitz
```

klassifiziert.

Im Beispiel lautet der Hauptwohnsitz:

> Cherry Tree Lane 1
> 12345 Berminghausen
> Deutschland

Die Klassifikation der Adresse erfolgt über:

```text
https://demis.rki.de/fhir/StructureDefinition/AddressUse
```

mit dem Code:

```text
primary
```

### Derzeitiger Aufenthaltsort

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

Das Beispiel verdeutlicht damit insbesondere, dass der melderechtliche beziehungsweise primäre Wohnsitz und der aktuelle Aufenthaltsort einer Person voneinander abweichen können und als getrennte `Patient.address`-Einträge übermittelt werden können.

### Geolokation

Für die Adressen können zusätzlich geografische Koordinaten angegeben werden.

Hierfür wird die Standard-FHIR-Extension:

```text
http://hl7.org/fhir/StructureDefinition/geolocation
```

verwendet.

Sie enthält die Elemente `latitude` und `longitude`.

Die Geokoordinaten ermöglichen eine geografische Verortung der angegebenen Adresse.

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

### Bearbeitungsstatus

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

### Kommunikationssprache

Über `Patient.communication` ist Deutsch als Sprache der Person angegeben:

```text
de – Deutsch
```

Die Sprache wird entsprechend BCP 47 über das System:

```text
urn:ietf:bcp:47
```

kodiert.

### Sterbedatum

Das Beispiel enthält außerdem ein Sterbedatum:

```text
2025-04-11T10:00:00+01:00
```

Dieses wird über `Patient.deceasedDateTime` angegeben und dokumentiert, dass die betroffene Person verstorben ist.

### Änderungshistorie

Über die Extension `LastModifiedBy` in `Patient.meta` wird der Nutzende referenziert, der die Ressource zuletzt geändert hat.

Im Beispiel:

```text
Practitioner/EmigaUser-001
```

Die verwendete Extension lautet:

```text
https://emiga.rki.de/fhir/common/Extension/LastModifiedBy
```

Damit kann die letzte Änderung der Datensatz einem EMIGA-Nutzende zugeordnet werden.

Das Beispiel dient insbesondere dazu, die Abbildung einer betroffene Person mit mehreren Namen und Adressen sowie zusätzlichen Angaben wie Geburtsland, Staatsangehörigkeit, amtlichem Geschlecht, Bearbeitungsstatus und einer zugeordneten Einrichtung zu veranschaulichen.