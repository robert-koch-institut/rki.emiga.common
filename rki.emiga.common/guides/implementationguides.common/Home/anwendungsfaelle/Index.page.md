# {{page-title}}

## Inhaltsverzeichnis

{{index:children}}

---
## Anwendungsfälle im Überblick
Dieser Abschnitt beschreibt die zentralen fachlichen Anwendungsfälle des Moduls, insbesondere im Zusammenhang mit Annotationen, Personen und „Zusätzlichen Eigenschaften“, und ordnet die dafür verwendeten FHIR-Profile ein. Die UML-Diagramme stellen die wesentlichen Ressourcen, ihre Beziehungen und ihr Zusammenspiel in den jeweiligen Anwendungsfällen in komprimierter Form dar.

<br>&nbsp;<br>

### Annotationen, Anhänge und zusätzliche Eigenschaften

Annotationen dienen dazu, fachliche Entitäten wie Fälle, Ausbrüche oder Personen mit Notizen, Kommentaren und Anhängen zu versehen sowie allgemeine Notizen, Kommentare und Dokumente auch (ohne Entitätsbezug) zu hinterlegen <TODO: bei dem Fall an Org gehängt?>.

**Anhänge** ermöglichen es, Dokumente, einschließlich Dokumenten aus Anschreiben-Vorlagen, strukturiert und nachvollziehbar <u>an Annotationen</u> zu hinterlegen. Sie werden als eigenständige Ressourcen geführt und aus Annotationen referenziert, sodass sie unabhängig versioniert werden können.

**Zusätzliche Eigenschaften* ermöglichen darüber hinaus die strukturierte Abbildung fachlicher Zusatzinformationen, die nicht unmittelbar durch die übrigen Profile des Moduls abgedeckt werden.

### Personen und Bezugspersonen
<TODO> <Bezugspersonen Beschreiben>
Die betroffene Person enthält die für EMIGA relevanten Angaben zu einer Person, beispielsweise Name, Geburtsdatum und Anschrift. 
   
Eine betroffene Person kann dabei abhängig vom fachlichen Kontext unterschiedliche Rollen einnehmen, beispielsweise als Fall- oder Kontaktperson.<TODO check>
   
Zusätzlich können **Bezugspersonen**, beispielsweise Erziehungsberechtigte, rechtliche Betreuende oder Familienangehörige (über Bezugperson?), abgebildet und mit der betroffenen Person verknüpft werden. 
   
Dadurch können Personen unabhängig voneinander geführt und ihre Beziehungen zueinander nachvollziehbar dargestellt werden.

<TODO>

**Anlegen einer betroffenen Person**
Beim Anlegen einer **betroffenen Person** wird eine neue Instance von `AffectedPerson`-Ressource erstellt. Die Erstellung erfolgt im Rahmen eines `TransactionBundle`, das alle für den Erstellungsvorgang benötigten Ressourcen gemeinsam an das System übermittelt.

Zusammen mit der betroffenen Person werden die folgenden Verweise abgebildet:

* Über `lastModifiedBy` wird auf den `EmigaUserPractitioner` verwiesen, der die Ressource angelegt bzw. zuletzt bearbeitet hat.
* Über `link.relatedPersonLink` wird die zugehörige `AffectedPersonRelatedPerson` referenziert. Sie repräsentiert dieselbe Person in ihrer Rolle als Bezugsperson (`RelatedPerson`).

Das `TransactionBundle` enthält somit die neu anzulegende `AffectedPerson`, den zugehörigen `EmigaUserPractitioner` sowie die `AffectedPersonRelatedPerson`. Durch die gebündelte Übermittlung diese Information als FHIR-Transaktion (an EMIGA-.. Dienst) können die Ressourcen und ihre gegenseitigen Referenzen in einem zusammenhängenden Vorgang verarbeitet werden.


<TODO> ### Abbildung einer Bezugsperson

Für eine **betroffene Person** können Bezugspersonen über eine `AffectedPersonRelatedPerson`-Instanz abgebildet werden. Die betroffene Person (`AffectedPerson`) verweist hierzu über einen Link auf die entsprechende `AffectedPersonRelatedPerson`.

Die `AffectedPersonRelatedPerson` stellt die Beziehung zwischen der betroffenen Person und einer weiteren Person her. Sie referenziert die Bezugsperson als `Patient` und beschreibt über `Relationship` die **Art der Beziehung zur betroffenen Person**, beispielsweise eine familiäre oder betreuende Beziehung.

Auf diese Weise werden Bezugsperson und betroffene Person jeweils als eigenständige Personeninstanzen geführt und ihre Beziehung zueinander explizit modelliert werden.

