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
Das Profil `EmigaUserPractitioner` basiert auf der FHIR-Ressource `Practitioner` und dient der Abbildung einer **handelnden Person bzw. eines EMIGA-Benutzers**.

Die Ressource repräsentiert damit nicht die Person, auf die sich ein fachlicher Vorgang bezieht, sondern eine Person, die innerhalb von EMIGA fachliche oder administrative Aktionen ausführt.

Ein `EmigaUserPractitioner` kann beispielsweise als Ersteller, Absender oder zuletzt ändernde Person einer anderen Ressource referenziert werden.

Typische Verwendungen sind unter anderem:

* `Communication.sender` bei Annotationen,
* `DocumentReference.author` bei Anhängen,
* `meta.extension[lastModifiedBy]` bei Ressourcen, deren letzte Änderung einem Benutzer zugeordnet werden soll.

Die grundlegende Rolle lässt sich vereinfacht wie folgt darstellen:

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

| Ressource       | EMIGA-Profil                  | Fachliche Rolle                                        |
| --------------- | ----------------------------- | ------------------------------------------------------ |
| `Patient`       | `AffectedPerson`              | Person, die von einem fachlichen Vorgang betroffen ist |
| `RelatedPerson` | `AffectedPersonRelatedPerson` | Bezugsperson einer betroffenen Person                  |
| `Practitioner`  | `EmigaUserPractitioner`       | handelnde Person bzw. EMIGA-Benutzer                   |

Der wesentliche Unterschied liegt somit in der fachlichen Rolle:

* Eine `AffectedPerson` beschreibt die betroffene Person.
* Eine `AffectedPersonRelatedPerson` beschreibt eine Person, die in Beziehung zu einer betroffenen Person steht.
* Ein `EmigaUserPractitioner` beschreibt eine Person, die innerhalb von EMIGA handelt.

Ein `Practitioner` ist daher nicht als Ersatz für eine `Patient`- oder `RelatedPerson`-Ressource zu verwenden.

### Identifikation des Benutzers

Ein EMIGA-Benutzer kann über:

```text
Practitioner.identifier
```

identifiziert werden.

Im Beispiel wird als Identifier eine beispielhafte E-Mail-Adresse verwendet.

Die konkrete fachliche Bedeutung und das verwendete Identifier-System richten sich nach den Vorgaben des Profils und der jeweiligen EMIGA-Implementierung.

### Aktivitätsstatus

Über:

```text
Practitioner.active
```

wird angegeben, ob die repräsentierte Person aktuell als Practitioner aktiv ist.

Ein Wert von:

```text
true
```

kennzeichnet einen aktiven EMIGA-Benutzer.

Der Aktivitätsstatus beschreibt damit, ob die Ressource aktuell für die Verwendung als handelnde Person vorgesehen ist.

### Name

Der Name des EMIGA-Benutzers wird über:

```text
Practitioner.name
```

abgebildet.

Hier können insbesondere Vor- und Familienname angegeben werden.

Im Gegensatz zu einer `AffectedPerson` stehen bei diesem Profil nicht umfangreiche demografische Angaben im Vordergrund, sondern die eindeutige Identifikation der handelnden Person.

### Verwendung als Referenz

Ein `EmigaUserPractitioner` wird typischerweise von anderen EMIGA-Ressourcen referenziert.

Beispiele:

#### Ersteller einer Annotation

Über:

```text
Communication.sender
```

kann angegeben werden, welcher EMIGA-Benutzer eine Annotation erstellt bzw. gesendet hat.

#### Autor eines Anhangs

Über:

```text
DocumentReference.author
```

kann angegeben werden, welcher EMIGA-Benutzer einen Anhang erstellt hat.

#### Letzte Änderung einer Ressource

Über die EMIGA-Extension:

```text
meta.extension[lastModifiedBy]
```

kann dokumentiert werden, welcher Benutzer eine Ressource zuletzt geändert hat.

Die Referenz verweist dabei auf eine `Practitioner`-Ressource mit dem Profil `EmigaUserPractitioner`.

### Sicherheit, Sichtbarkeit und Verantwortlichkeit

Über `Practitioner.meta.security` werden die Sichtbarkeit und Verantwortlichkeit der Ressource beschrieben.

Hierfür werden insbesondere die EMIGA-CodeSysteme für:

* `ResourceVisibilityType`
* `ResourceResponsibility`

verwendet.

Damit kann festgelegt werden, in welchem organisatorischen Kontext die Practitioner-Ressource sichtbar ist und welcher Stelle sie zugeordnet ist.

Die Security Labels beziehen sich auf die Ressource selbst und sind unabhängig von den fachlichen Rollen zu betrachten, in denen der Practitioner von anderen Ressourcen referenziert wird.

### Fachlicher Schwerpunkt

Der Schwerpunkt des Profils liegt auf einer schlanken und eindeutig referenzierbaren Abbildung eines EMIGA-Benutzers.

Typischerweise stehen dabei folgende Informationen im Vordergrund:

* Identifikation des Benutzers,
* Name,
* Aktivitätsstatus,
* Sichtbarkeit,
* Verantwortlichkeit,
* sowie die Referenzierbarkeit aus anderen Ressourcen.

Demografische oder fachlich personenbezogene Angaben wie Geburtsdatum, Staatsangehörigkeit, Wohnadresse oder Aufenthaltsort stehen bei diesem Profil nicht im Vordergrund.

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
Das folgende Beispiel zeigt einen aktiven EMIGA-Benutzer als `Practitioner`.

Die Beispielperson:

```text
Erika Musterfrau
```

wird über das Profil:

```text
https://emiga.rki.de/fhir/common/StructureDefinition/EmigaUserPractitioner
```

abgebildet.

Als Identifier wird im Beispiel folgende beispielhafte Benutzerkennung verwendet:

```text
testemail@example.com
```

Der Practitioner ist mit:

```text
active = true
```

als aktiv gekennzeichnet.

Über `meta.security` wird die Ressource außerdem hinsichtlich Sichtbarkeit und Verantwortlichkeit eingeordnet.

Im Beispiel ist die Sichtbarkeit:

```text
inAgency – Eigene ÖGD-Stelle
```

und als verantwortliche Stelle ist angegeben:

```text
1. – Robert Koch-Institut
```

Der dargestellte Practitioner kann von anderen Ressourcen referenziert werden, beispielsweise als:

* Absender einer Annotation,
* Autor eines Anhangs,
* oder zuletzt ändernde Person einer Ressource.

Das Beispiel veranschaulicht damit insbesondere:

* die Abbildung eines EMIGA-Benutzers als `Practitioner`,
* die Identifikation des Benutzers,
* die Angabe von Vor- und Familienname,
* den Aktivitätsstatus,
* die Verwendung von Security Labels,
* sowie die Referenzierbarkeit als handelnde Person aus anderen EMIGA-Ressourcen.


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