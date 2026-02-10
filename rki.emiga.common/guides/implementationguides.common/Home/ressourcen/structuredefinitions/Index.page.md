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
| Annotation Bundle (AnnotationBundle) | Das Bundle dient zur strukturierten Zusammenführung und gemeinsamen Übertragung von Annotationen (z.B. Notizen, Kommentaren und zugehörigen Ressourcen) zu Fällen, Ausbrüchen, Personen oder anderen Entitäten innerhalb eines fachlichen Vorgangs. |
| Betroffene Person (AffectedPerson) | Die betroffene Person enthält relevante Angaben zum Patienten. |
| Bezugsperson der betroffenen Person (AffectedPersonRelatedPerson) | Dieses Profil bildet eine Bezugsperson der betroffenen Person ab. Es dient der strukturierten Darstellung von Personen, die in einer persönlichen oder rechtlichen Beziehung zur betroffenen Person stehen. |
| EMIGA Aktenzeichen Identifier (IdentifierEmigaFileNumber) | Eindeutiger fachlicher Identifier für EMIGA-Entitäten. |
| EMIGA-ID Identifier (IdentifierEmigaID) | Technischer Indentifikator für EMIGA-Entitäten. |
| EMIGA Nutzende Person (EmigaUserPractitioner) | Ist eine EMIGA nutzende Person, also jemand mit einem direkten Zugang zum System. Jeder Nutzer ist einer ÖGD-Stelle zugeordnet. |
| EMIGA Personen Transactionbundle (PersonenTransactionBundle) | Das EMIGA Personen Transactionbundle  dient der gebündelten, transaktionalen Übertragung von Operationen auf Personen-bezogene Ressourcen (z.B. betroffene Personen, Bezugspersonen, zugehörige Dokumentation). |
| EMIGA Personen TransactionBundle-Response (PersonenTransactionResponse) | Dieses Profil definiert die Server-Antwort auf Transaktions-Bundles im Rahmen von EMIGA Personen-Szenarien. | 
| Person Bundle (AffectedPersonBundle) | Personen-Bundle für eine betroffene Person. Es dient der strukturierten Zusammenführung und gemeinsamen Übertragung aller relevanten Ressourcen (z.B. Patient, Bezugspersonen, Kontakte, Annotationen) zu einer betroffenen Person. |
| SurvNet Aktenzeichen Identifier (IdentifierSurvNetFileNumber) | SurvNet Aktenzeichen Identifier-Profil |
| Zusätzliche Eigenschaften (AdditionalPropertiesQuestionnaire) | Dieses Profil bietet die Möglichkeit, zusätzliche Eigenschaften (Metadaten und fachliche Zusatzinformationen) für Fragebögen strukturiert abzubilden.|
| Zusätzliche Eigenschaften Fragebogen-Antworten (AdditionalPropertiesQuestionnaireResponse) | Dieses Profil bietet die Möglichkeit, zusätzliche Eigenschaften (Metadaten und fachliche Zusatzinformationen) zu Antworten auf den AdditionalPropertiesQuestionnaire Fragebogen strukturiert abzubilden. |