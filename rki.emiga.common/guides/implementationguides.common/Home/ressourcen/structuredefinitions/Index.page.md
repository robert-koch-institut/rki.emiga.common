# {{page-title}}

## Inhaltsverzeichnis

{{index:children}}

---

Dieser Abschnitt bietet eine Übersicht über die in diesem Implementierungsleitfaden definierten **FHIR-Profile und -Ressourcen**.

In der Regel enthalten alle StructuredDefinition-Ressourcen Angaben zur **Sichtbarkeit** und **Verantwortlichkeit**, die einheitlich über `Resource.meta.security` abgebildet werden. Diese werden im Folgenden generisch beschrieben. Hierfür sind mindestens zwei Security Labels vorgesehen:

- `visibility`: ur Angabe der Sichtbarkeit der Ressource
- `responsibility`: zur Angabe der verantwortlichen ÖGD-Stelle

Die Sichtbarkeit wird über das CodeSystem `ResourceVisibilityType` kodiert und an ein entsprechendes ValueSet gebunden. Die Verantwortlichkeit wird über das CodeSystem `ResourceResponsibility` angegeben.

<fql headers="true">
from StructureDefinition
where url.startsWith('https://emiga.rki.de/fhir/common/StructureDefinition/')
   or url.startsWith('https://emiga.rki.de/fhir/StructureDefinition/')
select
    Profil: title & ' (' & id & ')',
    Beschreibung: description
</fql>


