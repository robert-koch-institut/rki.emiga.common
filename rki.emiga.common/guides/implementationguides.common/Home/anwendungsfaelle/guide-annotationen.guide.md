# {{page-title}}

Das Modul Annotationen dient dazu, fachliche Entitäten wie Fälle, Ausbrüche oder Personen mit Notizen, Kommentaren, Aufgabe und Anhängen zu versehen. Zusätzlich können Annotationen ohne direkten Entitätsbezug geführt werden, wenn sie als allgemeine organisatorische Notiz oder Dokumentation benötigt werden.
<!--Todo: oben habe Nachrichten mit Aufgabe ersetzt, to be checked. -->

Die fachliche Annotation wird in EMIGA als FHIR-`Communication` im Profil `AnnotationCommunication` abgebildet. Für Erstellung, Änderung und Übertragung werden die beteiligten Ressourcen in einem FHIR-`Bundle` mit `type = transaction` zusammengeführt. Anhänge werden als `DocumentReference` im Profil `AttachmentDocumentReference` referenziert. Ergänzende zusätzliche Eigenschaften können über `AdditionalPropertiesQuestionnaireResponse` mitgeführt werden.

## Überblick

{{render:guides/implementationguides.common/PlantUML/PNGs/AnnotationBundle.png}}

Ein FHIR-`Bundle` mit `type = transaction` dient als technischer Container für eine Annotation. Die erste fachliche Ressource ist die eigentliche `AnnotationCommunication`. Weitere Einträge stellen die für die Interpretation benötigten Begleitressourcen bereit, insbesondere die erstellende Person (`EmigaUserPractitioner`), optionale Anhänge (`AttachmentDocumentReference`) und optionale zusätzliche Eigenschaften (`AdditionalPropertiesQuestionnaireResponse`).

## Fachlicher Ablauf

Ein Client erzeugt zunächst bei Bedarf ein neues EMIGA-Aktenzeichen für Annotationen. Anschließend wird die Annotation als FHIR-Transaktionsbundle an den Annotationsdienst übergeben. Der Dienst speichert die enthaltenen Ressourcen, vergibt bzw. verwaltet technische Ressourcen-IDs und liefert ein Bundle mit dem gespeicherten Stand zurück.

Für die Anzeige und Weiterbearbeitung stehen Such-, Detail- und Historienoperationen zur Verfügung. 
Änderungen an einer bestehenden Annotation werden als neue Version der Annotation gespeichert. Dadurch bleibt nachvollziehbar, welcher Stand zu welchem Zeitpunkt gültig war. Eine gelöschte oder verworfene Annotation wird über die entsprechende Operation bzw. den Bearbeitungsstatus dokumentiert; der fachliche Status der `Communication` bleibt dabei auf `completed`, während der eigentliche Bearbeitungsstatus über die Extension `ProcessingStatus` geführt wird.

## Annotation

{{render:guides/implementationguides.common/PlantUML/PNGs/AnnotationCommunication.png}}

Die Ressource `AnnotationCommunication` enthält den fachlichen Inhalt der Annotation:

| Element | Bedeutung |
| --- | --- |
| `identifier` | Fachliche Identifikatoren der Annotation, z.B. EMIGA-Aktenzeichen oder SurvNet-Aktenzeichen. |
| `meta.security` | Verantwortlichkeit und Sichtbarkeit der Ressource, u.a. `ResourceResponsibility` und `ResourceVisibilityType`. |
| `meta.tag` | Kennzeichnung personenbezogener Daten, z.B. `ContainsPersonalInformation`. |
| `extension:ProcessingStatus` | Bearbeitungsstatus der Annotation, z.B. `inprogress`, `closed`, `cancelled`, `handedover`, `inhandover`, `intakeover` oder `forinformation`. |
| `extension:DateCreated` | Zeitpunkt der initialen Erstellung. |
| `category` | Kategorie der Annotation, z.B. Kommentar oder Notizen. |
| `topic.text` | Betreff der Annotation. |
| `about` | Referenz auf die fachliche Bezugsentität. |
| `sent` | Fachlicher Versandzeitpunkt der Annotation. |
| `sender` | Erstellende Person als Referenz auf `EmigaUserPractitioner`. |
| `payload.contentString` | Textueller Inhalt der Annotation. |
| `payload.contentReference` | Referenz auf einen Anhang in Form einer `AttachmentDocumentReference`-Ressource. |


## Anhang

Mit Anhängen besteht die Möglichkeit, Dokumente, einschließlich aus Anschreiben-Vorlagen, an Annotationen anzuhängen. Dadurch können unterschiedliche Dateien strukturiert und nachvollziehbar an Entitäten oder organisationsbezogen hinterlegt werden.
Anhänge werden als eigenständige Ressource abgebildet, um eine unabhängige Versionierung der Anhänge zu ermöglichen.

{{render:guides/implementationguides.common/PlantUML/PNGs/AttachmentDocumentReference.png}}

Anhänge liegen als `AttachmentDocumentReference`-Ressourcen vor und werden aus der Annotation heraus referenziert. 
Dadurch können Metadaten zum Dokument, technische Prüfinformationen und Zugriffssteuerungsinformationen getrennt vom eigentlichen Annotationsinhalt verwaltet werden.

Für Anhänge sind insbesondere folgende Angaben relevant:

| Element | Bedeutung |
| --- | --- |
| `status` | Fester Status `current`. |
| `identifier` | Fachliche Identifikatoren des Anhangs. |
| `date` | Erstellungszeitpunkt des Anhangs in EMIGA. |
| `author` | Erstellende Person des Anhangs als Referenz auf `EmigaUserPractitioner`. |
| `content.attachment.contentType` | MIME-Type des Dokuments. |
| `content.attachment.url` | URI des abgelegten Dokuments. |
| `content.attachment.size` | Dateigröße in Byte. |
| `content.attachment.hash` | Hashwert zur Integritätsprüfung. |
| `content.attachment.title` | Titel bzw. Bezeichnung des Dokuments. |
| `content.attachment.creation` | Erstellungszeitpunkt des referenzierten Dokuments. |

## Schnittstellenoperationen

Der Annotationsdienst stellt FHIR-Operationen auf Ebene von `Bundle` und `Identifier` bereit. 
Die Operationen verarbeiten FHIR-Ressourcen in den Formaten `application/fhir+json` oder `application/fhir+xml` und sind über Bearer Token abgesichert.

| Operation | Methode | Zweck | Ergebnis |
| --- | --- | --- | --- |
| `/metadata` | `GET` | Abruf des FHIR `CapabilityStatement`. | `CapabilityStatement` |
| `/Identifier/$emiga-identifier` | `GET`, `POST` | Erzeugt einen neuen eindeutigen EMIGA-Identifier für Annotationen im Mandantenkontext der authentifizierten Person. | `Parameters` mit `emigaIdentifier` |
| `/Bundle/$create-annotation` | `POST` | Erstellt eine neue Annotation oder eine neue Version einer bestehenden Annotation aus einem FHIR-`Bundle` mit `type = transaction`. Der erste Bundle-Eintrag muss eine `Communication` sein; mindestens ein `Practitioner`-Eintrag ist erforderlich. | Gespeichertes FHIR-`Bundle` |
| `/Bundle/$search-annotation` | `GET`, `POST` | Sucht Annotationen und liefert eine paginierte Trefferliste. | `Bundle` vom Typ `searchset` |
| `/Bundle/{id}/$annotation-details` | `GET`, `POST` | Liefert den aktuellen Detailstand einer Annotation anhand der Bundle- bzw. Datensatz-ID. | FHIR-`Bundle` |
| `/Bundle/{id}/$search-annotation-history` | `GET`, `POST` | Liefert die Versionshistorie einer Annotation. Unterstützt Filter-, Sortier-, Zeitraum- und Suchparameter. | Paginierter `Bundle` |
| `/Bundle/{id}/$annotation-version-details` | `GET`, `POST` | Liefert eine konkrete Version einer Annotation anhand von `versionNo` oder `versionId`. | FHIR-`Bundle` |
| `/Bundle/{id}/$delete-annotation` | `POST` | Entfernt die angegebene Annotation aus dem aktiven Bestand, ohne sie physisch zu löschen.| `OperationOutcome` |
| `/OperationDefinition/{id}` | `GET` | Liest die technische Beschreibung einer Operation. | `OperationDefinition` |



## Erstellung und Versionierung

Beim Erstellen einer Annotation wird ein FHIR-`Bundle` mit `type = transaction` an `/Bundle/$create-annotation` gesendet. Das Bundle muss die `AnnotationCommunication` als ersten fachlichen Eintrag enthalten. Die erstellende Person wird als `EmigaUserPractitioner` mitgeführt. Wenn Anhänge oder zusätzliche Eigenschaften Bestandteil der Annotation sind, werden diese als weitere Bundle-Einträge aufgenommen und aus der `Communication` heraus referenziert.

Wird eine bestehende Annotation geändert, erzeugt der Dienst eine neue Version. Die aktuelle Version kann über `$annotation-details` gelesen werden. Frühere Stände können über `$search-annotation-history` gefunden und über `$annotation-version-details` gezielt abgerufen werden. Die Version kann dabei über `versionNo` oder `versionId` adressiert werden.

<TODO>
Ein Anhang wird als neuer Anhang betrachtet und erhält eine neue ID, wenn er unter einem neuen Namen bzw. Betreff (content.attachment.title) gespeichert wird. Dies gilt auch dann, wenn der Inhalt gegenüber einem bereits vorhandenen Anhang unverändert ist. Wird ein bestehender Anhang bearbeitet und unter demselben Namen bzw. Betreff gespeichert, behält er seine ID und erhält stattdessen eine neue Version.

Die Versionierung von Anhang und zugehöriger Annotation erfolgt unabhängig voneinander:
- Wird der Annotation ein neuer Anhang hinzugefügt, entsteht eine neue Version der Annotation.
- Entsteht lediglich eine neue Version eines bereits referenzierten Anhangs, bleibt die Version der Annotation unverändert.


## Suche und Anzeige
Für paginierte Suchoperationen werden die FHIR-üblichen Parameter `_count` und `_offset` verwendet. Die Historienoperation unterstützt zusätzlich fachliche Filter wie `_filter`, `_sort`, `_startDate`, `_endDate` und `_search`.

Die Suche nach Annotationen erfolgt über `/Bundle/$search-annotation` und liefert ein FHIR-`Bundle` vom Typ `searchset`. Jeder Treffer enthält ein FHIR-Bundle mit den Ressourcen, die für die Anzeige des Treffers benötigt werden. Clients sollen die Pagination über `_count` und `_offset` auswerten und die vom Server gelieferten Bundle-Links berücksichtigen.

Für eine Detailansicht soll nicht ausschließlich der Suchtreffer verwendet werden. Stattdessen ist der aktuelle Stand über `/Bundle/{id}/$annotation-details` abzurufen, damit Text, Betreff, Status, Sichtbarkeit, Ersteller, Anhänge und zusätzliche Eigenschaften konsistent aus einem vollständigen Bundle interpretiert werden.

## Interoperabilitätshinweise
Der Bearbeitungsstatus ist ausschließlich der Extension `ProcessingStatus` zu entnehmen. `Communication.status` ist im Profil auf completed festgelegt und sollte hierfür nicht herangezogen werden.

Die Sichtbarkeit einer Annotation oder eines Anhangs wird über `meta.security` gekennzeichnet. Für Annotationen sind insbesondere die Codes `inAgency` und `transferable` relevant. Diese dienen der Zugriffssteuerung und der Entscheidung, ob eine Ressource innerhalb der eigenen ÖGD-Stelle verbleibt oder übermittelt werden darf.

Annotationen können personenbezogene Daten im Sinne der DSGVO enthalten. Die Kennzeichnung erfolgt über `meta.tag` mit dem CodeSystem `PersonalInformation`. Clients müssen diese Kennzeichnung bei Anzeige, Übermittlung, Export und Protokollierung berücksichtigen.

Anhänge sollen über `AttachmentDocumentReference.content.attachment.url` referenziert werden. Binärdaten werden in diesem Profil nicht direkt in `content.attachment.data` geführt. Integrität und Nachvollziehbarkeit werden durch Informationen wie Dateigröße, Hashwert, Titel, MIME-Type und Erstellungszeitpunkt unterstützt.
