# {{page-title}}

## Inhaltsverzeichnis

{{index:children}}

---
## Resourcen Überblick
Dieser Abschnitt bietet eine Übersicht über alle in diesem Implementierungsleitfaden definierten **FHIR-Ressourcen**, **Profile**, **Terminologien** und **Erweiterungen**, die speziell für den Öffentlichen Gesundheitsdienst (**ÖGD**) in Deutschland angepasst wurden. Diese Ressourcen sind entscheidend für die standardisierte Erfassung, Verwaltung und den Austausch von Gesundheitsdaten im Rahmen des Infektionsschutzes.
<br>&nbsp;<br>

#### Enthaltene Ordner:

1. **StructureDefinitions**  
   Enthält die definierten **Profile** für Organisationen, Standorte, Fachkräfte und Dienstleistungen im ÖGD. Diese Profile erweitern die Standard-FHIR-Ressourcen, um spezifische Anforderungen des EMIGA-Systems abzubilden.

2. **Terminologien**  
   Beinhaltet **CodeSystems** und **ValueSets**, die zur Standardisierung der Datenerfassung und -auswertung verwendet werden. Diese Terminologien sorgen für eine konsistente und einheitliche Kodierung von Rollen, Organisationsarten, Zuständigkeiten und Verfügbarkeiten.
   - CodeSystems, z.B. **Relevanz (Relevance)**, **Persönliche Informationen (PersonalInformation)** und **Anrede (Salutation)**.
   - ValueSets zur Auswahl und Validierung der oben genannten Codes.

3. **Extensions**  
   Erweiterungen der Standard-FHIR-Ressourcen, um zusätzliche Informationen abzubilden, die nicht in den Basisressourcen enthalten sind. Diese Extensions sind speziell auf die Bedürfnisse des ÖGD zugeschnitten. Bspw. **Bearbeitungsstatus (ProcessingStatus)** oder **Geburtsland (LandOfBirth)**.



