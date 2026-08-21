---
topic: EmigaUserPractitioner
canonical: https://emiga.rki.de/fhir/common/StructureDefinition/EmigaUserPractitioner
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
Das Profil `EmigaUserPractitioner` basiert auf der FHIR-Ressource `Practitioner` und dient der Abbildung einer handelnden Person bzw. eines EMIGA-Nutzende innerhalb des EMIGA-Kontexts. Es beschreibt natürliche Personen, die fachliche oder administrative Handlungen im System ausführen und dabei eine definierte Rolle oder Funktion wahrnehmen.

Ein `EmigaUserPractitioner` kann beispielsweise als Ersteller, Absender oder zuletzt ändernde Person einer EMIGA-Ressource referenziert werden.

Typische Verwendungen sind unter anderem:

* `Communication.sender` bei Annotationen,
* `DocumentReference.author` bei Anhängen,
* `meta.extension[lastModifiedBy]` bei Ressourcen, deren letzte Änderung einem Nutzende zugeordnet werden soll.


```text
EmigaUserPractitioner
        │
        ├── erstellt / sendet
        │
        ├── bearbeitet
        │
        └── wird von anderen Ressourcen referenziert
```

### Abgrenzung zu anderen Personenressourcen

Im EMIGA-Datenmodell können natürliche Personen abhängig von ihrer fachlichen Rolle durch unterschiedliche FHIR-Ressourcen repräsentiert werden.

<#TODO check redundancy>


| Ressource       | EMIGA-Profil                  | Fachliche Rolle                                        |
| --------------- | ----------------------------- | ------------------------------------------------------ |
| `Patient`       | `AffectedPerson`              | Person, die von einem fachlichen Vorgang betroffen ist |
| `RelatedPerson` | `AffectedPersonRelatedPerson` | Bezugsperson einer betroffenen Person                  |
| `Practitioner`  | `EmigaUserPractitioner`       | handelnde Person bzw. EMIGA-Nutzende                   |

### Identifikation des Nutzende

Ein EMIGA-Nutzende kann über:

```text
Practitioner.identifier
```

identifiziert werden.

Im Beispiel wird als Identifier eine beispielhafte E-Mail-Adresse verwendet.

### Aktivitätsstatus

Über:

```text
Practitioner.active
```

wird angegeben, ob die repräsentierte Person aktuell als Practitioner aktiv ist.

Der Aktivitätsstatus beschreibt damit, ob die Ressource aktuell für die Verwendung als handelnde Person vorgesehen ist.

### Name

Der Name des EMIGA-Nutzende wird über:

```text
Practitioner.name
```

abgebildet.

Hier können insbesondere Vor- und Familienname angegeben werden.

### Verwendung als Referenz

Ein `EmigaUserPractitioner` wird typischerweise von anderen EMIGA-Ressourcen referenziert.

Beispiele:

#### Ersteller einer Annotation

Über:

```text
Communication.sender
```

kann angegeben werden, welcher EMIGA-Nutzende eine Annotation erstellt bzw. gesendet hat.

#### Autor eines Anhangs

Über:

```text
DocumentReference.author
```

kann angegeben werden, welcher EMIGA-Nutzende einen Anhang erstellt hat.

#### Letzte Änderung einer Ressource

Über die EMIGA-Extension:

```text
meta.extension[lastModifiedBy]
```

kann dokumentiert werden, welcher Nutzende eine Ressource zuletzt geändert hat.

### Sicherheit, Sichtbarkeit und Verantwortlichkeit

<#TODO: Redundant>

Über `Practitioner.meta.security` werden die Sichtbarkeit und Verantwortlichkeit der Ressource beschrieben.

Hierfür werden insbesondere die EMIGA-CodeSysteme für:

* `ResourceVisibilityType`
* `ResourceResponsibility`

verwendet.

Damit kann festgelegt werden, in welchem organisatorischen Kontext die Practitioner-Ressource sichtbar ist und welcher Stelle sie zugeordnet ist.

Die Security Labels beziehen sich auf die Ressource Practioner selbst und sind unabhängig von den fachlichen Rollen zu betrachten, in denen der Practitioner von anderen Ressourcen referenziert wird.

### Fachlicher Schwerpunkt

Der Schwerpunkt des Profils liegt auf einer schlanken und eindeutig referenzierbaren Abbildung eines EMIGA-Nutzende.

Typischerweise stehen dabei folgende Informationen im Vordergrund:

* Identifikation des Nutzende,
* Name,
* Aktivitätsstatus,
* Sichtbarkeit,
* Verantwortlichkeit

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
(verweisen)