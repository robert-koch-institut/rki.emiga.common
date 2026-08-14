---
topic: AttachmentDocumentReference
canonical: https://emiga.rki.de/fhir/common/StructureDefinition/AttachmentDocumentReference
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

<br>&nbsp;<br>

Das Profil `AttachmentDocumentReference` basiert auf der FHIR-Ressource `DocumentReference` und bildet Anhänge als eigenständige Ressourcen ab. Dokumente, einschließlich Dokumenten aus Anschreiben-Vorlagen, können dadurch strukturiert an Annotationen angebunden und unabhängig von der Annotation verwaltet und versioniert werden.

Der eigentliche Dateiinhalt wird nicht inline übertragen (`content.attachment.data` ist ausgeschlossen), sondern über `content.attachment.url` referenziert. Zusätzlich werden Dateiformat, Größe, Hashwert, Titel und Erstellungszeitpunkt des referenzierten Dokuments angegeben. `date` bezeichnet dagegen den Zeitpunkt, zu dem der Anhang in EMIGA erstellt wurde; `author` bezeichnet die Person, die den Anhang in EMIGA erstellt hat.

### Versionierung

Ein Anhang gilt als **neuer Anhang** und erhält eine neue Ressourcen-ID, wenn er unter einem neuen Namen bzw. Betreff (`content.attachment.title`) gespeichert wird. Dies gilt auch dann, wenn der Dateiinhalt gegenüber einem bereits vorhandenen Anhang unverändert ist.

Wird ein bestehender Anhang bearbeitet und unter demselben Namen bzw. Betreff gespeichert, behält er seine Ressourcen-ID und erhält eine **neue Version**.

Die Versionierung von Anhang und Annotation erfolgt unabhängig voneinander:

- Wird einer Annotation ein **neuer Anhang** hinzugefügt, entsteht eine neue Version der Annotation, da sich deren Referenzen ändern.
- Entsteht lediglich eine **neue Version eines bereits referenzierten Anhangs**, bleibt die Version der Annotation unverändert.


## Profil
### Metadaten
<fql output="transpose" headers="true">
from
    StructureDefinition
where
    url = %canonical
select
        CanonicalURL: url, Status: status, Version: version, Herausgeber: publisher
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
        Name: constraint.key, Element: id, Schweregrad: constraint.severity,Beschreibung: constraint.human, Ausdruck: constraint.expression
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
        Element: id, Staerke: binding.strength, ValueSet: binding.valueSet
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
	Feldname: id, Kurzbeschreibung: short, Beschreibung: definition, Hinweise: comment
</fql>
<br>&nbsp;<br>

## Beispiel
Im Folgenden wird ein Beispiel für eine Anhang-Entität dargestellt.

<tabs>
    <tab title="Übersicht">      
        {{render:DocumentReference-441557620.json}}
    </tab>
    <tab title="XML">      
        {{xml:DocumentReference-441557620.json}}
    </tab>
    <tab title="JSON">
        {{json:DocumentReference-441557620.json}}
    </tab>
    <tab title="Link">
        {{link:DocumentReference-441557620.json}}
    </tab>
</tabs>

<!-- {{json: DocumentReference/441557620}} -->