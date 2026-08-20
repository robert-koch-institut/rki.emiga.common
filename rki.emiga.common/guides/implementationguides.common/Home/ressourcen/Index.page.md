# {{page-title}}

## Inhaltsverzeichnis

{{index:children}}

---
## Resourcen Überblick
Dieser Abschnitt bietet eine Übersicht über alle in diesem Implementierungsleitfaden definierten **FHIR-Ressourcen**, (Profile, Terminologien und Erweiterungen), die speziell für den Öffentlichen Gesundheitsdienst (**ÖGD**) in Deutschland angepasst wurden. Diese Ressourcen sind entscheidend für die standardisierte Erfassung, Verwaltung und den Austausch von Gesundheitsdaten im Rahmen des Infektionsschutzes. Zu den jeweiligen Artefakten sind in diesem Abschnitt auch entsprechende Beispiele aufgeführt.

<br>&nbsp;<br>

#### Enthaltene Ordner:

1. **StructureDefinitions**  
   Die grundlegenden **Profile**, die paketübergreifend in EMIGA verwendet werden. Dazu gehören unter anderem Profile für Betroffene Person, Identifier, Annotation, Anhang sowie "Zusätzliche Eigenschaften".

2. **Terminologien**  
   Beinhaltet **CodeSystems**, **ValueSets** und **NamingSystems**, die zur Standardisierung der Datenerfassung und -verarbeitung verwendet werden. Die Terminologien definieren unter anderem Werte für Anrede, Bearbeitungsstatus, Beziehungen, Personenbezug, Relevanz, Ressourcensichtbarkeit, Ressourcenverantwortlichkeit, Verbindung zu Einrichtungen, Regionalschlüssel sowie Anzeigetext-Arten.
   
3. **Extensions**  
   Extensions ermöglichen die Abbildung zusätzlicher Informationen, für die im FHIR-Basisstandard keine geeigneten Elemente vorgesehen sind. Sie dienen dazu, FHIR-Ressourcen entsprechend den fachlichen Anforderungen von EMIGA und des ÖGD zu erweitern. Beispiele hierfür sind der Bearbeitungsstatus (ProcessingStatus) oder das Geburtsland (LandOfBirth).

