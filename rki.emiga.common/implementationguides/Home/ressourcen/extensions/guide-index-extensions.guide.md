# {{page-title}}

## Inhaltsverzeichnis

{{index:children}}

---
## Extensions Überblick

In diesem Abschnitt werden die **Extensions** beschrieben, die zur Erweiterung der Standard-FHIR-Ressourcen verwendet werden. Diese Extensions ermöglichen die Abbildung spezifischer Anforderungen des ÖGD, die nicht durch die Standardressourcen abgedeckt werden können.
<br>&nbsp;<br>


| **Extension**                                         | **Beschreibung**                                                                                       |
|------------------------------------------------------|--------------------------------------------------------------------------------------------------------|
| Anrede (Salutation) | Für die Betroffene Person kann eine Anrede angegeben werden. Diese wird bei Anschreiben verwendet. |
| Bearbeitungsstatus (ProcessingStatus) | Extension zur Abbildung der Bearbeitungsstatus eines Vorgangs. |
| Bearbeitungsstatus betroffene Person (ProcessingStatusAffectedPerson) | Extension zur Abbildung der Bearbeitungsstatus einer betroffenen Person. |
| Einrichtungsadresse betroffene Person (FacilityAddressAffectedPerson) | Über Einrichtungsadresse kann eine Einrichtung als Aufenthaltsort für die Betroffene Person angegeben werden. |
| Erstellungsdatum (DateCreated) | Extension zur Abbildung der Erstellungsdatum eine Resource. |
| Geburtsland (LandOfBirth) | Geburtsland der betroffenen Person. |
| Nicht vorhanden (NullFlavor) | If the value is not a proper value, indicates the reason. |
| Regionalschlüssel (RegionalKey) | Erweiterung zur Darstellung des Regionalschlüssels und des Regionalbezugsystems. |