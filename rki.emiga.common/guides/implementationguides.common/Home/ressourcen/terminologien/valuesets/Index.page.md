# {{page-title}}

## Inhaltsverzeichnis

{{index:children}}

---
## ValueSets Überblick

Die ValueSets sind Sammlungen von Codes aus den oben genannten CodeSystems und dienen der Auswahl und Validierung von Werten in den FHIR-Ressourcen.
<br>&nbsp;<br>

<fql headers="true">
from
    ValueSet
where
    url.startsWith('https://emiga.rki.de/fhir/common/ValueSet/')
    or
    url.startsWith('https://emiga.rki.de/fhir/ValueSet/')
select
    ValueSet: title & ' (' & id & ')',
    Beschreibung: description
</fql>
