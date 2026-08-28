# {{page-title}}

## Inhaltsverzeichnis

{{index:children}}

---
## Resourcen Überblick
Dieser Abschnitt bietet eine Übersicht über alle in diesem Implementierungsleitfaden definierten **FHIR-Ressourcen** (Profile, Terminologien und Erweiterungen), die speziell für den Öffentlichen Gesundheitsdienst (**ÖGD**) in Deutschland angepasst wurden. Zu den jeweiligen Artefakten sind in diesem Abschnitt auch entsprechende Beispiele aufgeführt.

**StructureDefinitions**  
   Die grundlegenden **Profile**, die paketübergreifend in EMIGA verwendet werden. Dazu gehören unter anderem Profile für Betroffene Person, Identifier, Annotation, Anhang sowie "Zusätzliche Eigenschaften".

**Terminologien**  
   Beinhaltet **CodeSystems**, **ValueSets** und **NamingSystems**, die zur Standardisierung der Datenerfassung und -verarbeitung verwendet werden. Die Terminologien definieren unter anderem Werte für Anrede, Bearbeitungsstatus, Beziehungen, Personenbezug, Relevanz, Ressourcensichtbarkeit, Ressourcenverantwortlichkeit, Verbindung zu Einrichtungen, Regionalschlüssel sowie Anzeigetext-Arten.
   
**Extensions**  
   Extensions ermöglichen die Abbildung zusätzlicher Informationen, für die im FHIR-Basisstandard keine geeigneten Elemente vorgesehen sind. Sie dienen dazu, FHIR-Ressourcen entsprechend den fachlichen Anforderungen von EMIGA und des ÖGD zu erweitern. Beispiele hierfür sind der Bearbeitungsstatus (ProcessingStatus) oder das Geburtsland (LandOfBirth).

## Sichtweite und Verantwortlichkeit der Ressourcen
In der Regel enthält alle Ressourcen Angaben zur Sichtweite und Verantwortlichkeit, die einheitlich über Resource.meta.security abgebildet werden. Hierfür sind mindestens zwei Security Labels vorgesehen:

- `visibility` zur Angabe der Sichtbarkeit der Ressource
responsibility zur Angabe der verantwortlichen ÖGD-Stelle

- Die Sichtbarkeit wird über das CodeSystem `ResourceVisibilityType` kodiert und an ein entsprechendes ValueSet gebunden. Die Verantwortlichkeit wird über das CodeSystem `ResourceResponsibility` angegeben.