# {{page-title}}

## Inhaltsverzeichnis

{{index:children}}

---

## StructureDefinitions Überblick

Dieser Abschnitt bietet eine Übersicht über die in diesem Implementierungsleitfaden definierten **FHIR-Profile und -Ressourcen**. Die Profile sind speziell für den Öffentlichen Gesundheitsdienst (**ÖGD**) in Deutschland angepasst und erweitern Standard-FHIR-Ressourcen, um spezifische Anforderungen abzubilden.
<!-- #TODO: check out whether this is only for vzd>
Diese Ressourcen sind zentral für die Abbildung von Organisationen, Personen und Dienstleistungen im Kontext des Infektionsschutzes und der Zusammenarbeit im Öffentlichen Gesundheitsdienst.
-->
<br>&nbsp;<br>

| **Profil**                                      | **Beschreibung**                                                                                         |
|-------------------------------------------------|----------------------------------------------------------------------------------------------------------|
| Annotation (AnnotationCommunication) | Annotationen dienen dazu, Entitäten wie z.B. Fälle, Ausbrüche oder Personen mit Notizen, Kommentaren und Anhängen zu versehen sowie allgemeine Notizen, Kommentare und Dokumente ohne Entitätsbezug zu hinterlegen. |
| Anhang (AttachmentAnnotation) | Attachment Profil für EMIGA Anhänge. Anhänge werden als eigenständige Ressource abgebildet, um eine unabhängige Versionierung der Anhänge zu ermöglichen. |
| Anhang-Entität (AttachmentDocumentReference) | Ermöglicht das strukturierte Hinterlegen von Dokumenten und anderen Dateien, z. B. aus Anschreiben-Vorlagen, als Anhang zu einer Annotation. Dadurch können Dateien nachvollziehbar einem fachlichen Objekt in EMIGA zugeordnet werden. |
| Annotation Bundle (AnnotationBundle) | Dieses Profil bildet ein Annotations-Bundle ab. Es dient der strukturierten Zusammenführung und gebündelt Übertragung von Annotationen (z.B. Notizen, Kommentaren und zugehörigen Ressourcen) zu Fällen, Ausbrüchen, Personen oder anderen Entitäten innerhalb eines fachlichen Vorgangs.|
| Betroffene Person (AffectedPerson) | Bildet die betroffene Person in fachliche Kontext ab. Enthält relevante Angaben zum Patienten (Fallperson). |
| Bezugsperson der betroffenen Person (AffectedPersonRelatedPerson) | Bildet eine Bezugsperson der betroffenen Person ab. Es dient der strukturierten Darstellung von Personen, die in einer persönlichen oder rechtlichen Beziehung zur betroffenen Person stehen und im Rahmen der fachlichen Prozesse berücksichtigt werden müssen. |
| EMIGA Aktenzeichen Identifier (IdentifierEmigaFileNumber) | Eindeutiger sprechender Identifier für EMIGA-Entitäten. |
| EMIGA-ID Identifier (IdentifierEmigaID) | Technischer Indentifikator für EMIGA-Entitäten. |
| EMIGA Nutzende Person (EmigaUserPractitioner) | Bildet eine EMIGA nutzende Person ab, also jemand mit einem direkten Zugang zum System. Jede Nutzende ist i.d.R. einer ÖGD-Stelle zugeordnet. |
| EMIGA Personen Transactionbundle (PersonenTransactionBundle) | Bildet ein EMIGA-Personen-Transaction-Bundle ab. Es dient der gebündelten, transaktionalen Übertragung von Operationen auf Personen-bezogene Ressourcen (z.B. betroffene Personen, Bezugspersonen, zugehörige Dokumentation). |
| EMIGA Personen TransactionBundle-Response (PersonenTransactionResponse) | Dieses Profil definiert die Server-Antwort auf Transaktions-Bundles im Rahmen von EMIGA Personen-Szenarien. | 
| Person Bundle (AffectedPersonBundle) | Bildet ein Person Bundle für eine betroffene Person ab. Es dient der strukturierten Zusammenführung und gemeinsamen Übertragung relevanten Ressourcen (z.B. Patient, Bezugspersonen, Kontakte, Annotationen) zu einer betroffenen Person innerhalb eines fachlichen Vorgangs. |
| SurvNet Aktenzeichen Identifier (IdentifierSurvNetFileNumber) | SurvNet Aktenzeichen Identifier-Profil |
| Zusätzliche Eigenschaften (AdditionalPropertiesQuestionnaire) | Ermöglicht die strukturierte Abbildung zusätzlicher Eigenschaften (Metadaten und fachlicher Zusatzinformationen) für Fragebögen. Das Profil dient der Modellierung von Konfigurations- und Steuerungsinformationen, die über den Standardumfang der FHIR-Ressource Questionnaire hinausgehen. |
| Zusätzliche Eigenschaften Fragebogen-Antworten (AdditionalPropertiesQuestionnaireResponse) | Bietet die Möglichkeit, zusätzliche Eigenschaften (Metadaten und fachliche Zusatzinformationen) zu Antworten auf den AdditionalPropertiesQuestionnaire Fragebogen strukturiert abzubilden. Es dient dazu, erweiterte Auswertungs-, Steuerungs- und Dokumentationsinformationen zu einer Fragebogen-Antwort zu modellieren, die über den Standardumfang der Ressource hinausgehen. |