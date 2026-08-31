---
topic: AnnotationCommunication
canonical: https://emiga.rki.de/fhir/common/StructureDefinition/AnnotationCommunication
---

# {{page-title}}
## Beschreibung
<fql output= "inline" headers="false">
from 
    StructureDefinition
where
    url = %canonical
select
    description
</fql>

Hierfür wird das Profil `AnnotationCommunication` basiert auf der FHIR-Ressource `Communication` verwendet.

Die Ressource `AnnotationCommunication` enthält den fachlichen Inhalt der Annotation:

| Element | Bedeutung |
| --- | --- |
| `identifier` | Fachliche Identifikatoren der Annotation, beispielswese EMIGA-Aktenzeichen oder SurvNet-Aktenzeichen. |
| `meta.security` | Verantwortlichkeit und Sichtbarkeit der Ressource, u.a. `ResourceResponsibility` und `ResourceVisibilityType`. |
| `meta.tag` | Kennzeichnung personenbezogener Daten (z.B. `ContainsPersonalInformation`). |
| `extension:ProcessingStatus` | Bearbeitungsstatus der Annotation, z.B. `inprogress`, `closed`, `cancelled`, `handedover`, `inhandover`, `intakeover` oder `forinformation`. |
| `extension:DateCreated` | Zeitpunkt der initialen Erstellung der Annotation. |
| `category` | Kategorie der Annotation, z.B. Kommentar oder Notizen. |
| `topic.text` | Betreff der Annotation. |
| `about` | Referenz auf die fachliche Bezugsentität. |
| `sent` | Fachlicher Versandzeitpunkt der Annotation. |
| `sender` | Erstellende Person als Referenz auf `EmigaUserPractitioner`. |
| `payload.contentString` | Textueller Inhalt der Annotation. |
| `payload.contentReference` | Referenz auf einen Anhang in Form einer `AttachmentDocumentReference`-Ressource. |

## Interoperabilitätshinweise
Der Bearbeitungsstatus der Annotation ist ausschließlich der Extension `ProcessingStatus` zu entnehmen. `Communication.status` ist im Profil stets auf completed festgelegt und darf nicht zur Abbildung des fachlichen Bearbeitungsstatus herangezogen werden.

Die Sichtweite einer Annotation oder eines Anhangs wird über `meta.security` gekennzeichnet. Für Annotationen sind insbesondere die Codes `inAgency` und `transferable` relevant. 
Sie geben an, ob eine Annotation auf die eigene ÖGD-Stelle verbleibt  oder gemeinsam mit der zugehörigen Hauptentität (z. B. Fall oder Ausbruch) an andere Stellen übermittelt werden darf.

Annotationen können personenbezogene Daten im Sinne der DSGVO enthalten. Die Kennzeichnung erfolgt über `meta.tag` mit dem CodeSystem `PersonalInformation`. Clients sollten diese Kennzeichnung bei Anzeige, Übermittlung, Export und Protokollierung berücksichtigen.

Anhänge werden über `AttachmentDocumentReference.content.attachment.url` referenziert. Binärdaten werden in diesem Profil nicht direkt in `content.attachment.data` geführt. Integrität und Nachvollziehbarkeit des Anhangs werden durch Informationen wie Dateigröße, Hashwert, Titel, MIME-Type und Erstellungszeitpunkt unterstützt.

### Bezug zu einer fachlichen Entität
Über `Communication.about` wird angegeben, auf welche fachliche Entität sich die Annotation bezieht (die fachliche Verknüpfung zum Gegenstand der Annotation).
Der Betreff einer Annotation wird über `Communication.topic.text` angegeben.
Der Betreff dient als kurze, menschenlesbare Bezeichnung des Inhalts der Annotation.

### Inhalt der Annotation
Der eigentliche Inhalt einer Annotation wird über `Communication.payload` abgebildet. Ein textueller Kommentar wird über `Communication.payload.contentString` angegeben.
Eine Anhang-Datei wird als eigenständige Ressource des Profils `AttachmentDocumentReference` angelegt und über `Communication.payload.contentReference` aus einer Annotation referenziert.

### Kategorie der Annotation
Über `Communication.category` wird die fachliche Kategorie der Annotation angegeben.
Die Kategorie ermöglicht die fachliche Unterscheidung verschiedener Arten von Annotationen entsprechend der im Profil vorgesehenen Terminologie.

### Erstellende der Annotation
Die Person, die eine Annotation erstellt hat, wird über `text
Communication.sender` referenziert.
Die Referenz verweist auf einen `EmigaUserPractitioner`.

### Erstellungszeitpunk unf Sendezeitpunkt
Der Erstellungszeitpunkt der Annotation wird über die Extension `DateCreated`angegeben.
Davon zu unterscheiden ist `Communication.sent`. Dieses Element beschreibt in EMIGA den Zeitpunkt, zu dem die Annotation fachlich bereitgestellt wurde.
Die beiden Zeitangaben beschreiben damit unterschiedliche Aspekte im Lebenszyklus einer Annotation.

### Bearbeitungsstatus der Annotation
Bei einer Annotation sind der technische FHIR-Status und der fachliche Bearbeitungsstatus voneinander zu unterscheiden.
Der FHIR-Status `Communication.status` ist im Profil fest auf `completed` gesetzt.
Dieser Status beschreibt den Zustand der `Communication` als FHIR-Ressource und wird <u>nicht</u> zur Abbildung des fachlichen Bearbeitungszustands der Annotation verwendet.
Der fachliche Bearbeitungsstatus wird stattdessen über die EMIGA-Extension `ProcessingStatus` geführt.

| Element                | Bedeutung                                    | Bemerkung |
| ---------------------- | -------------------------------------------- | --------- |
| `Communication.status` | technischer Status der FHIR-Communication    | immer fest, not used |
| `ProcessingStatus`     | fachlicher Bearbeitungsstatus der Annotation | wird genutzt |

Im Beispiel lautet der fachliche Bearbeitungsstatus `forinformation – Zur Kenntnis`.

### Identifikatoren
Eine Annotation kann über `Communication.identifier` mit EMIGA-spezifischen und weiteren fachlichen Identifiern versehen werden, damit sie eindeutig identifiziert und unter unterschiedlichen Verarbeitungskontexten zugeordnet werden.
Folgenden Name Space können verwendet werden:
* `EmigaID`
* `EmigaFileNumber`
* `SurvNetFileNumber`

### Kennzeichnung des Vorhandenseins personenbezogener Daten
Über `Communication.meta.tag` kann gekennzeichnet werden, dass eine Annotation personenbezogene Informationen in Sinne von DSGVO enthält.
Damit kann bereits auf Ressourcenebene kenntlich gemacht werden, dass bei der Verarbeitung der Annotation personenbezogene Informationen zu berücksichtigen sind.

## Profil
### Metadaten
<fql output="transpose" headers="true">
from
    StructureDefinition
where
    url = %canonical
select
        CanonicalURL: url,
        Status: status,
        Version: version,
        Herausgeber: publisher
</fql>
<br>&nbsp;<br>

### Inhalt
<tabs>
<tab title="Darstellung">{{tree, buttons}}</tab>
<tab title="XML">{{xml}}</tab>
<tab title="JSON">{{json}}</tab>
<tab title="Link">{{link}}</tab>
</tabs>
<br>&nbsp;<br>

### Constraints/Invarianten
<fql headers="true">
from 
    StructureDefinition 
where 
    url = %canonical 
for 
    differential.element 
    where
        constraint.exists()
    select 
        Name: constraint.key,
        Element: id,
        Schweregrad: constraint.severity,
        Beschreibung: constraint.human,
        Ausdruck: constraint.expression
</fql>
<br>&nbsp;<br>

### Terminology-Bindings
<fql headers="true">
from 
    StructureDefinition
where 
    url = %canonical
   
for 
    differential.element
    where 
        binding.exists()
    select
        Element: id,
        Staerke: binding.strength,
        ValueSet: binding.valueSet
</fql>
<br>&nbsp;<br>

## Anmerkungen zu Must-Support Elementen
<fql>
from
	StructureDefinition
where 
    url = %canonical
for differential.element
where mustSupport = true
select
	Feldname: id,
    Kurzbeschreibung: short,
    Beschreibung: definition,
    Hinweise: comment
</fql>
<br>&nbsp;<br>