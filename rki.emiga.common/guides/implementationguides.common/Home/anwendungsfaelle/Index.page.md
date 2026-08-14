# {{page-title}}

## Inhaltsverzeichnis

{{index:children}}

---
## Anwendungsfälle Überblick
Dieser Abschnitt bietet eine Übersicht über in diesem Implementierungsleitfaden definierten **Anwendungsfälle**, die in Form von UML-Diagrammen dargestellt werden und die für dieses Modul relevanten Anwendungsfälle in komprimierter Form abbilden. Der Schwerpunkt liegt auf den zentralen Use Cases und den dafür erforderlichen Funktionen, um eine klare und gut nachvollziehbare Übersicht zu gewährleisten.
<br>&nbsp;<br>

#### Enthaltene Anwendungsfälle:

1. **Annotationen, Anhänge und zusätzliche Eigenschaften**  
   Annotationen dienen dazu, Entitäten wie z.B. Fälle, Ausbrüche oder Personen mit Notizen, Kommentaren und Anhängen zu versehen sowie allgemeine Notizen, Kommentare und Dokumente ohne Entitätsbezug zu hinterlegen. Mit den Anhang hat man die Möglichkeit, Dokumente, auch aus Anschreiben-Vorlagen, an Annotationen anzuhängen, um verschiedene Dateien strukturiert und nachvollziehbar an Entitäten oder für die Organisation zu hinterlegen. <TODO> <zus. Eigenschaften Beschreiben>

2. **Personen und Bezugspersonen**  
   <TODO> <Bezugspersonen Beschreiben>
   Die betroffene Person enthält die für EMIGA relevanten Angaben zu einer Person, beispielsweise Name, Geburtsdatum, Anschrift, Kontaktdaten und weitere personenbezogene Informationen. Eine betroffene Person kann dabei abhängig vom fachlichen Kontext unterschiedliche Rollen einnehmen, beispielsweise als Fall- oder Kontaktperson. Zusätzlich können Bezugspersonen abgebildet und mit der betroffenen Person verknüpft werden. Die Beziehung beschreibt, in welchem Verhältnis die Bezugsperson zur betroffenen Person steht, beispielsweise als Erziehungsberechtigte, rechtliche Betreuung oder Familienangehörige. Dadurch können Personen unabhängig voneinander geführt und ihre Beziehungen zueinander nachvollziehbar dargestellt werden.

<TODO>#### Anlegen einer betroffenen Person
Beim Anlegen einer **betroffenen Person** wird eine neue `AffectedPerson`-Ressource erstellt. Die Erstellung erfolgt im Rahmen eines `TransactionBundle`, das alle für den Vorgang benötigten Ressourcen gemeinsam an das System übermittelt.

Zusammen mit der betroffenen Person werden die folgenden Beziehungen abgebildet:

* Über `lastModifiedBy` wird auf den `EmigaUserPractitioner` verwiesen, der die Ressource angelegt bzw. zuletzt bearbeitet hat.
* Über `link.relatedPersonLink` wird die zugehörige `AffectedPersonRelatedPerson` referenziert. Sie repräsentiert dieselbe Person in ihrer Rolle als Bezugsperson (`RelatedPerson`).

Das `TransactionBundle` enthält somit die neu anzulegende `AffectedPerson`, den zugehörigen `EmigaUserPractitioner` sowie die `AffectedPersonRelatedPerson`. Durch die gemeinsame Übermittlung als FHIR-Transaktion können die Ressourcen und ihre gegenseitigen Referenzen in einem zusammenhängenden Vorgang verarbeitet werden.


<TODO> ### Abbildung einer Bezugsperson

Für eine **betroffene Person** können Bezugspersonen über eine `AffectedPersonRelatedPerson`-Instanz abgebildet werden. Die betroffene Person (`AffectedPerson`) verweist hierzu über einen Link auf die entsprechende `AffectedPersonRelatedPerson`.

Die `AffectedPersonRelatedPerson` stellt die Beziehung zwischen der betroffenen Person und einer weiteren Person her. Sie referenziert die Bezugsperson als `Patient` und beschreibt über `Relationship` die **Art der Beziehung zur betroffenen Person**, beispielsweise eine familiäre oder betreuende Beziehung.

Auf diese Weise können Bezugsperson und betroffene Person als eigenständige Personeninstanzen geführt und ihre Beziehung zueinander explizit modelliert werden.

