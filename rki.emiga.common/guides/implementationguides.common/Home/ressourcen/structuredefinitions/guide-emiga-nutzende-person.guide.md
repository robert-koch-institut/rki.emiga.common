---
topic: EmigaUserPractitioner
canonical: https://emiga.rki.de/fhir/common/StructureDefinition/EmigaUserPractitioner
---

# {{page-title}}


<fql output= "inline" headers="false">
from 
    StructureDefinition
where
    url = %canonical
select
    description
</fql>

<br>&nbsp;<br>
Das Profil `EmigaUserPractitioner` basiert auf der FHIR-Ressource `Practitioner` und dient der Abbildung einer handelnden Person bzw. eines EMIGA-Nutzende innerhalb des EMIGA-Kontexts. Es beschreibt natürliche Personen, die fachliche oder administrative Handlungen im System ausführen und dabei eine definierte Rolle oder Funktion wahrnehmen.
Ein `EmigaUserPractitioner` kann beispielsweise als Ersteller, Absender oder zuletzt ändernde Person einer EMIGA-Ressource referenziert werden.

Die Modellierung einer EMIGA-nutzenden Person ist hinsichtlich der erfassten Informationen bewusst schlank gehalten und auf die für den Anwendungskontext erforderlichen Angaben beschränkt. Sie umfasst die **Identifikator** der nutzenden Person, den **Namen**, den **Aktivitätsstatus** sowie Angaben zur **Sichtbarkeit** und **Verantwortlichkeit** (hier: die zugehörige ÖGD-Stelle).

Bemerkung: Ein `Practitioner` beschreibt ausschließlich eine Person, die selbst als handelnde Person an einem fachlichen Prozess beteiligt ist. Wird eine als Practitioner abgebildete natürliche Person selbst zum Gegenstand eines EMIGA-Fachvorgangs, beispielsweise aufgrund einer meldepflichtigen Erkrankung, wird diese Person zusätzlich durch eine vom Practitioner unabhängige Patient-Ressource abgebildet.

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

## Beispiel
Das folgende Beispiel zeigt die Abbildung einen aktiven EMIGA-Nutzende als `Practitioner`.

Die Beispielperson `Erika Musterfrau` wird über das Profil `https://emiga.rki.de/fhir/common/StructureDefinition/EmigaUserPractitioner` abgebildet.
Als Identifier wird im Beispiel folgende Nutzendekennung verwendet `testemail@example.com`. Der Practitioner ist mit `active = true` als aktiv gekennzeichnet.

Über `meta.security` wird die Ressource außerdem hinsichtlich Sichtbarkeit und Verantwortlichkeit eingeordnet.
Im Beispiel ist die Sichtbarkeit `inAgency – Eigene ÖGD-Stelle` und als verantwortliche Stelle ist angegeben `1. – Robert Koch-Institut`.


<tabs>
    <tab title="Übersicht">      
        {{render:Practitioner-EmigaUser-001.json}}
    </tab>
    <tab title="XML">      
        {{xml:Practitioner-EmigaUser-001.json}}
    </tab>
    <tab title="JSON">
        {{json:Practitioner-EmigaUser-001.json}}
    </tab>
    <tab title="Link">
        {{link:Practitioner-EmigaUser-001.json}}
    </tab>
</tabs>

<!-- {{json: Practitioner/EmigaUser-001}} -->


