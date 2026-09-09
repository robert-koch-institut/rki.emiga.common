# {{page-title}}

## Inhaltsverzeichnis

{{index:children}}

---

## CodeSystems Überblick

<fql headers="true">
from
    CodeSystem
where
    url.startsWith('https://emiga.rki.de/fhir/common/CodeSystem/')
    or
    url.startsWith('https://emiga.rki.de/fhir/CodeSystem/')
select
    CodeSystem: title & ' (' & id & ')',
    Beschreibung: description
</fql>
