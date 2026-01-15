# {{page-title}}

## Inhaltsverzeichnis

{{index:children}}

---

## StructureDefinitions Überblick

Dieser Abschnitt bietet eine Übersicht über die in diesem Implementierungsleitfaden definierten **FHIR-Profile und -Ressourcen**. Die Profile sind speziell für den Öffentlichen Gesundheitsdienst (**ÖGD**) in Deutschland angepasst und erweitern Standard-FHIR-Ressourcen, um spezifische Anforderungen abzubilden.
Diese Ressourcen sind zentral für die Abbildung von Organisationen, Personen und Dienstleistungen im Kontext des Infektionsschutzes und der Zusammenarbeit im Öffentlichen Gesundheitsdienst.
<br>&nbsp;<br>

| **Profil**                                      | **Beschreibung**                                                                                         |
|-------------------------------------------------|----------------------------------------------------------------------------------------------------------|
| Anhang (AttachmentAnnotation) | Attachment Profil für EMIGA Anhänge. |
| Anhang-Entität (AttachmentDocumentReference) | Mit den Anhang hat man die Möglichkeit, Dokumente, auch aus Anschreiben-Vorlagen, an Annotationen anzuhängen, um verschiedene Dateien strukturiert und nachvollziehbar an Entitäten oder für die Organisation zu hinterlegen. |
| Annotation (AnnotationCommunication) | Annotationen dienen dazu, Entitäten wie z.B. Fälle, Ausbrüche oder Personen mit Notizen, Kommentaren und Anhängen zu versehen sowie allgemeine Notizen, Kommentare und Dokumente ohne Entitätsbezug zu hinterlegen. |
| Annotation Bundle (AnnotationBundle) | TODO |
| Betroffene Person (AffectedPerson) | Die betroffene Person enthält relevante Angaben zum Patienten. |
| Bezugsperson der betroffenen Person (AffectedPersonRelatedPerson) | TODO |
| EMIGA Aktenzeichen Identifier (IdentifierEmigaFileNumber) | Eindeutiger fachlicher Identifier für EMIGA-Entitäten. |
| EMIGA-ID Identifier (IdentifierEmigaID) | Technischer Indentifikator für EMIGA-Entitäten. |
| EMIGA Nutzende Person (EmigaUserPractitioner) | TODO |
| EMIGA Personen Transactionbundle (PersonenTransactionBundle) | TODO |
| EMIGA Personen TransactionBundle-Response (PersonenTransactionResponse) | Dieses Profil definiert die Server-Antwort auf Transaktions-Bundles im Rahmen von EMIGA Personen-Szenarien. | 
| Person Bundle (AffectedPersonBundle) | TODO |
| SurvNet Aktenzeichen Identifier (IdentifierSurvNetFileNumber) | SurvNet Aktenzeichen Identifier-Profil |
| Zusätzliche Eigenschaften (AdditionalPropertiesQuestionnaire) | TODO |
| Zusätzliche Eigenschaften Fragebogen-Antworten (AdditionalPropertiesQuestionnaireResponse) | TODO |