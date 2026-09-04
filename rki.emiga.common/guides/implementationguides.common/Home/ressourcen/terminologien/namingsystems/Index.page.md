# {{page-title}}

## Inhaltsverzeichnis

{{index:children}}

---

## NamingSystems Überblick

Dieser Abschnitt beschreibt die **NamingSystems**, die zur eindeutigen Identifikation von Organisationen, Personen und anderen Entitäten verwendet werden. NamingSystems definieren, wie Identifier aufgebaut sind und welche Namenskonventionen verwendet werden.

<fql headers="true">
from
    NamingSystem
where
    uniqueId.value.startsWith('https://emiga.rki.de/fhir/vzd/sid/')
    or
    uniqueId.value.startsWith('https://emiga.rki.de/fhir/sid/')
select
    NamingSystem: name & ' (' & id & ')',
    Beschreibung: description
</fql>

<!--
| **NamingSystem**                               | **Beschreibung**                                                                                       |
|--------------------------------------------|--------------------------------------------------------------------------------------------------------|
| EMIGA-Aktenzeichen (EmigaFileNumber) | EMIGA Aktenzeichen für die Verwendung in Identifier. |
| EMIGA-ID (EmigaID) | EMIGA ID für die Verwendung in Identifier. |
| SurvNet-Aktenzeichen (SurvNetFileNumber) | Das SurvNet-Aktenzeichen dient während der Übergangsphase als ergänzender Identifikator zur Gewährleistung der Kontinuität bestehender Arbeitsabläufe. |

-->