# {{page-title}}

## Inhaltsverzeichnis

{{index:children}}

---
## Resourcen Überblick
Dieser Abschnitt bietet eine Übersicht über alle in diesem Implementierungsleitfaden definierten **FHIR-Ressourcen**, **Profile**, **Terminologien** und **Erweiterungen**, die speziell für den Öffentlichen Gesundheitsdienst (**ÖGD**) in Deutschland angepasst wurden. Diese Ressourcen sind entscheidend für die standardisierte Erfassung, Verwaltung und den Austausch von Gesundheitsdaten im Rahmen des Infektionsschutzes.
<br>&nbsp;<br>

#### Enthaltene Ordner:

1. **StructureDefinitions**  
   Enthält die grundlegenden **Profile**, die paketübergreifend in EMIGA verwendet werden. Dazu gehören unter anderem Profile für Betroffene Person, Identifier, Annotation, Anhang sowie weitere gemeinsame Basiskomponenten und zusätzliche Eigenschaften.

2. **Terminologien**  
   Beinhaltet **CodeSystems**, **ValueSets** und **NamingSystems**, die zur Standardisierung der Datenerfassung und -verarbeitung verwendet werden. Die Terminologien definieren unter anderem Werte für Anrede, Bearbeitungsstatus, Beziehungen, Personenbezug, Relevanz, Ressourcensichtbarkeit, Ressourcenverantwortlichkeit, Verbindung zu Einrichtungen, Regionalschlüssel sowie Anzeigetext-Arten.
   
   <!--check again later>
   Diese Terminologien sorgen für eine konsistente und einheitliche Kodierung von Rollen, Organisationsarten, Zuständigkeiten und Verfügbarkeiten.
   - CodeSystems, z.B. **Relevanz (Relevance)**, **Persönliche Informationen (PersonalInformation)** und **Anrede (Salutation)**.
   - ValueSets zur Auswahl und Validierung der oben genannten Codes.
   -->   

3. **Extensions**  
   Erweiterungen der Standard-FHIR-Ressourcen, um zusätzliche Informationen abzubilden, die nicht in den Basisressourcen enthalten sind. Diese Extensions sind speziell auf die Bedürfnisse des ÖGD zugeschnitten. Bspw. **Bearbeitungsstatus (ProcessingStatus)** oder **Geburtsland (LandOfBirth)**.


