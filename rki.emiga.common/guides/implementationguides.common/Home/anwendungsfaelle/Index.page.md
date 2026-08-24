# {{page-title}}

## Inhaltsverzeichnis

{{index:children}}

---
## Anwendungsfälle im Überblick
Dieser Abschnitt beschreibt die zentralen fachlichen Anwendungsfälle, die mit dem Paket rki.emiga.common abgebildet werden können, insbesondere Annotationen, Personen und zusätzliche Eigenschaften, und ordnet die dafür verwendeten FHIR-Profile ein. Die UML-Diagramme stellen die wesentlichen Ressourcen, ihre Beziehungen und ihr Zusammenspiel in den jeweiligen Anwendungsfällen in komprimierter Form dar.

<br>&nbsp;<br>

### Annotationen, Anhänge und zusätzliche Eigenschaften
**Annotationen** dienen dazu, fachliche Entitäten wie Fälle, Ausbrüche oder Personen mit Notizen und Kommentaren zu versehen. Darüber hinaus können Annotation auch ohne direkten Bezug zu einer fachlichen Entität hinterlegt werden. <#TODO: bei dem Fall an Org gehängt?>.

<#TODO add uml class diagram>
**Anhänge** ermöglichen es, Dokumente, beispielweise Dokumenten aus Anschreiben-Vorlagen, strukturiert und nachvollziehbar <u>an Annotationen</u> zu hinterlegen. Anhänge werden als eigenständige Ressourcen geführt und aus Annotationen referenziert.
<#TODO add uml class diagram>

**Zusätzliche Eigenschaften** ermöglichen darüber hinaus die strukturierte Abbildung fachlicher Zusatzinformationen, die nicht unmittelbar durch die übrigen Profile des Moduls abgedeckt werden, zu erfassen und verwalten.
<#TODO add uml class diagram>