# Example: EMIGA User Practitioner

## Beschreibung

Dieses Beispiel zeigt eine `Practitioner`-Ressource zur Abbildung eines EMIGA-Benutzers.

Die Ressource verwendet das EMIGA-Profil:

```text
https://emiga.rki.de/fhir/common/StructureDefinition/EmigaUserPractitioner
```

Ein `Practitioner` repräsentiert im EMIGA-Kontext eine handelnde Person, die beispielsweise Daten erfasst, bearbeitet oder fachliche Aktionen innerhalb des Systems durchführt.

Im Beispiel wird die Benutzerin **Erika Musterfrau** dargestellt.

## Beispiel-Szenario

Die Beispielressource beschreibt einen aktiven EMIGA-Benutzer mit dem Namen:

> Erika Musterfrau

Der Benutzer ist aktiv und besitzt als Identifier die beispielhafte E-Mail-Adresse:

```text
testemail@example.com
```

Die Ressource kann beispielsweise von anderen FHIR-Ressourcen referenziert werden, um zu dokumentieren, welcher Benutzer eine Ressource erstellt, geändert oder eine fachliche Aktion durchgeführt hat.

## Unterschied zwischen Practitioner und Patient

`Patient` und `Practitioner` repräsentieren beide natürliche Personen, haben jedoch unterschiedliche fachliche Rollen.

| Aspekt                     | Patient                                   | Practitioner                                                        |
| -------------------------- | ----------------------------------------- | ------------------------------------------------------------------- |
| Fachliche Bedeutung        | betroffene Person                         | handelnde Fachperson bzw. EMIGA-Benutzer                            |
| FHIR-Ressource             | `Patient`                                 | `Practitioner`                                                      |
| EMIGA-Profil               | `AffectedPerson`                          | `EmigaUserPractitioner`                                             |
| Typischer Zweck            | Abbildung personenbezogener Falldaten     | Abbildung eines Benutzers oder Bearbeiters                          |
| Demografische Angaben      | häufig umfangreich                        | meist auf für die Benutzeridentifikation relevante Angaben begrenzt |
| Adressen / Aufenthaltsorte | können fachlich relevant sein             | im vorliegenden Beispiel nicht erforderlich                         |
| Bearbeitungsstatus         | kann Teil des fachlichen Datensatzes sein | nicht Bestandteil dieses Beispiels                                  |
| Verwendung als Referenz    | Gegenstand eines Vorgangs                 | Ersteller, Bearbeiter oder handelnde Person                         |

Ein `Patient` beschreibt somit die Person, **über die fachliche Informationen verarbeitet werden**.

Ein `Practitioner` beschreibt dagegen eine Person, **die selbst innerhalb des fachlichen Prozesses handelt**.

## Referenzierung eines Practitioners

Eine `Practitioner`-Ressource kann von anderen Ressourcen referenziert werden.

Beispielsweise kann über eine Referenz wie:

```text
Practitioner/EmigaUser-001
```

angegeben werden, welcher EMIGA-Benutzer eine Ressource erstellt oder zuletzt geändert hat.

Ein typisches Beispiel ist die Extension:

```text
https://emiga.rki.de/fhir/common/Extension/LastModifiedBy
```

die auf einen `Practitioner` verweist.

Auch Elemente wie `DocumentReference.author` oder `Communication.sender` können einen solchen Benutzer referenzieren.

Damit wird die handelnde Person getrennt von der fachlich betroffenen Person modelliert.

## Identifikation des Benutzers

Der Practitioner enthält einen Identifier:

```json
{
  "value": "testemail@example.com"
}
```

Im Beispiel wird eine E-Mail-Adresse als Benutzerkennung verwendet.

Der Identifier dient dazu, den EMIGA-Benutzer eindeutig zuzuordnen.

## Aktivitätsstatus

Über:

```text
Practitioner.active
```

wird angegeben, ob der Benutzer aktuell aktiv ist.

Im Beispiel:

```json
{
  "active": true
}
```

Damit wird ausgedrückt, dass es sich um einen aktiven EMIGA-Benutzer handelt.

## Name

Der Name des Benutzers wird über `Practitioner.name` angegeben.

Im Beispiel:

```text
Erika Musterfrau
```

Die Struktur lautet:

```json
{
  "family": "Musterfrau",
  "given": [
    "Erika"
  ]
}
```

Im Gegensatz zu einer betroffenen Person sind im vorliegenden Beispiel keine zusätzlichen Namensarten wie Geburtsname oder Spitzname erforderlich.

## Sicherheit und Verantwortlichkeit

Über `Practitioner.meta.security` werden die Sichtbarkeit und Verantwortlichkeit der Ressource angegeben.

Die Sichtbarkeit ist:

```text
inAgency – Eigene ÖGD-Stelle
```

Damit ist die Ressource für die eigene ÖGD-Stelle vorgesehen.

Als verantwortliche Stelle wird angegeben:

```text
1. – Robert Koch-Institut
```

Die verwendeten Security Labels entsprechen damit demselben grundlegenden Mechanismus, der auch bei anderen EMIGA-Ressourcen eingesetzt wird.

## Fachlicher Schwerpunkt des Beispiels

Der Schwerpunkt dieses Beispiels liegt bewusst auf einer schlanken Repräsentation eines EMIGA-Benutzers.

Benötigt werden insbesondere:

* eine eindeutige Benutzeridentifikation,
* der Name,
* der Aktivitätsstatus,
* sowie Angaben zu Sichtbarkeit und Verantwortlichkeit.

Demografische und fachliche Angaben, die bei einer betroffenen Person relevant sein können, wie beispielsweise Geburtsdatum, Staatsangehörigkeit, Wohnadresse oder Aufenthaltsort, stehen bei diesem Profil nicht im Vordergrund.

## Zusammenfassung

Dieses Beispiel zeigt einen aktiven EMIGA-Benutzer als `Practitioner` mit:

* EMIGA-spezifischem Practitioner-Profil,
* Benutzeridentifier,
* Vor- und Familienname,
* Aktivitätsstatus,
* Security Labels für Sichtbarkeit und Verantwortlichkeit.

Der wesentliche Unterschied zum `AffectedPerson`-Profil besteht in der fachlichen Rolle:

**`Patient` beschreibt die betroffene Person eines fachlichen Vorgangs, während `Practitioner` die handelnde oder bearbeitende Person innerhalb von EMIGA beschreibt.**

Dadurch können fachlich betroffene Personen und Systembenutzer eindeutig voneinander getrennt und über FHIR-Referenzen miteinander in Beziehung gesetzt werden.
