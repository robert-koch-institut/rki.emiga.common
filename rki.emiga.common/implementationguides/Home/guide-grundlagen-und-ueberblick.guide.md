# {{page-title}}

## Über EMIGA
![EMIGA Logo](https://www.rki.de/SharedDocs/Bilder/Institut/Abt3/FG32/EMIGA-Logo.webp?__blob=normal&v=4 "EMIGA Logo")

Die COVID-19-Pandemie hat verdeutlicht, wie essenziell effiziente digitale Werkzeuge für die 
Überwachung und Eindämmung übertragbarer Krankheiten sind. Doch nicht nur in Krisenzeiten, sondern 
auch im Alltag unterstützt der Öffentliche Gesundheitsdienst (**ÖGD**) den Infektionsschutz in 
Deutschland.

Die Software **EMIGA** (Elektronisches Melde- und Informationssystem für Gesundheitsämter) wird im Auftrag 
des Bundesministeriums für Gesundheit (BMG) am Robert Koch-Institut (RKI) entwickelt. Ziel ist es, den 
ÖGD durch digitale Lösungen im Bereich Infektionsschutz zu entlasten und zu stärken. EMIGA soll die 
Vorbereitung auf endemische und pandemische Ausnahmesituationen sowie die Bewältigung neuer Aufgaben im 
Infektionsschutz und Meldewesen unterstützen.
<br>&nbsp;<br>

## Projektübersicht

### Projektziele

- **Effektiverer Infektionsschutz:** EMIGA verbessert die Arbeitsabläufe im ÖGD durch nutzungsfreundliche und effiziente digitale Lösungen. Die Software baut auf SurvNet@RKI auf und erweitert die Kommunikations- und Kooperationsmöglichkeiten.
- **Optimierte Zusammenarbeit:** EMIGA fördert die Zusammenarbeit zwischen Behörden und anderen Institutionen im Bereich Infektionsschutz und Meldewesen. Schnittstellen zu Fachanwendungen und automatisierte Prozesse reduzieren den administrativen Aufwand.
- **Einheitliche Datenerfassung:** Durch bundesweit einheitliche Standards, zentrale Datenhaltung und enge Anbindung an DEMIS (Deutsches Elektronisches Melde- und Informationssystem für den Infektionsschutz) wird die Datenerfassung vereinheitlicht.
- **Interoperabilität:** EMIGA setzt auf internationale Standards und Klassifikationssysteme. Schnittstellen und Spezifikationen zur Anbindung werden öffentlich verfügbar sein, um eine nahtlose Integration zu gewährleisten.
- **Zentraler Datenzugriff:** Epidemiologische Daten werden zentral bereitgestellt und durch ein Rollen- und Rechtekonzept geschützt. Dies sorgt für eine gleichmäßige Verfügbarkeit und erhöhte Datensicherheit.
- **Förderung der Digitalisierung des ÖGD:** EMIGA ist Teil der bundesweiten Zukunftsplattform **ÖGDnet** und bildet das zentrale Modul für Infektionsschutz und Meldewesen.
<br>&nbsp;<br>

## UML der Datenobjekte des Organisations Verzeichnis
Das nachfolgende UML-Diagramm veranschaulicht die Beziehungen zwischen verschiedenen Datenobjekten, die im **Verzeichnisdienst (VZD)** Version von **EMIGA** verwendet werden. Diese Objekte repräsentieren zentrale **FHIR-Ressourcen** wie **Organisationen**, **Standorte**, **Dienstleistungen** und **Personen**. Die Beziehungen zwischen den Objekten definieren, wie die Daten strukturiert und miteinander verknüpft sind.

 <!--Falls wir Gerade Lienien im UML haben möchten, dann folgendes einfügen:  skinparam linetype ortho -->

<plantuml>
  set namespaceSeparator none
  skinparam backgroundcolor transparent
  skinparam classBackgroundColor #FFFFCC
  skinparam classBorderColor black
  skinparam classAttributeIconSize 1
  skinparam nodesep 50
  skinparam ranksep 50

  class "Standort/Location" <<EmigaLocation>> {
  }

  class "Organisation/Organization" <<EmigaOrganization>> {
  }

  class "Dienstleistung/HealthcareService" <<EmigaHealthcareService>> {
  }

  class "EmigaPerson/Practitioner" <<EmigaPractitioner>> {
  }

  class "Rolle/PractitionerRole" <<EmigaPractitionerRole>> {
  }

  ' Lines with arrows (directional relationships)
  "Standort/Location" --> "Organisation/Organization" : 0..1\nLocation.managingOrganization
  "Dienstleistung/HealthcareService" --> "Organisation/Organization" : 1..1\nHealthcareService.providedBy
  "Rolle/PractitionerRole" --> "Organisation/Organization" : 0..1\nPractitionerRole.organization
  "Rolle/PractitionerRole" --> "Standort/Location" : 0..1\nPractitionerRole.location
  "Rolle/PractitionerRole" --> "EmigaPerson/Practitioner" : 0..1\nRole.practitioner

  ' Lines without arrows (associative relationships)
  "Organisation/Organization" -- "Standort/Location" : 0..*\nOrganization.partOf
  "Dienstleistung/HealthcareService" -- "Standort/Location" : 0..*\nHealthcareService.location
  "Rolle/PractitionerRole" -- "Dienstleistung/HealthcareService" : 0..*\nPractitionerRole.healthcareService

</plantuml>