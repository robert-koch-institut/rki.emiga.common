# {{page-title}}

## Inhaltsverzeichnis

{{index:children}}

---

In diesem Abschnitt werden die **Extensions** beschrieben, die zur Erweiterung der Standard-FHIR-Ressourcen verwendet werden. Diese Extensions ermöglichen die Abbildung spezifischer Anforderungen des ÖGD, die nicht durch die Standardressourcen abgedeckt werden können.
<br>&nbsp;<br>

<fql headers="true">
from
    Extension
where
    url.startsWith('https://emiga.rki.de/fhir/common/Extension/')
    or
    url.startsWith('https://emiga.rki.de/fhir/Extension/')
select
    Extension: title & ' (' & id & ')',
    Beschreibung: description
</fql>

