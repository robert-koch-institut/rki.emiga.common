# {{page-title}}

## Überblick

Eine **Annotation** wird in EMIGA durch das FHIR-Profil `AnnotationCommunication` abgebildet. Für die Erstellung, Änderung und Übertragung einer Annotation werden die zugehörigen Ressourcen in einem FHIR-`Bundle` vom Typ `transaction` zusammengeführt. Das Bundle dient dabei als technischer Container. Die zentrale fachliche Ressource ist die `AnnotationCommunication`, welche die eigentliche Annotation repräsentiert.

Weitere Einträge im Bundle stellen die für die Verarbeitung und Interpretation der Annotation erforderlichen Begleitressourcen bereit. Dazu gehören insbesondere:
* die erstellende Person (`EmigaUserPractitioner`),
* optionale Anhänge (`AttachmentDocumentReference`) und
* optionale zusätzliche Eigenschaften (`AdditionalPropertiesQuestionnaireResponse`).

**Anhänge** der Annotation werden über das Profil `AttachmentDocumentReference` abgebildet und der Annotation zugeordnet.
**Zusätzliche Eigenschaften** können über das Profil `AdditionalPropertiesQuestionnaireResponse` strukturiert mitgeführt und der Annotation zugeordnet werden.

{{render:guides/implementationguides.common/PlantUML/PNGs/AnnotationBundle.png}}

## Fachlicher Ablauf
Ein Client erzeugt zunächst bei Bedarf ein neues EMIGA-Aktenzeichen für Annotationen. Anschließend wird die Annotation als FHIR-Transaktionsbundle an den Annotationsdienst übergeben. Der Dienst speichert die enthaltenen Ressourcen, vergibt bzw. verwaltet technische Ressourcen-IDs und liefert ein Bundle mit dem gespeicherten Stand zurück.

Für die Anzeige und Weiterbearbeitung der Annotation-Bundel stehen Such-, Detail- und Historienoperationen zur Verfügung. 
Änderungen an einer bestehenden Annotation werden als neue Version der Annotation gespeichert. Dadurch bleibt nachvollziehbar, welcher Stand zu welchem Zeitpunkt gültig war. Eine gelöschte oder verworfene Annotation wird über die entsprechende Operation bzw. den Bearbeitungsstatus dokumentiert.

>Bemerkung: der fachliche Status der `Communication` bleibt dabei <u>immer</u> auf `completed`, während der eigentliche Bearbeitungsstatus über die Extension `ProcessingStatus` geführt wird.

## Annotation

{{render:guides/implementationguides.common/PlantUML/PNGs/AnnotationCommunication.png}}

Die Ressource `AnnotationCommunication` enthält den fachlichen Inhalt der Annotation:

| Element | Bedeutung |
| --- | --- |
| `identifier` | Fachliche Identifikatoren der Annotation, beispielswese EMIGA-Aktenzeichen oder SurvNet-Aktenzeichen. |
| `meta.security` | Verantwortlichkeit und Sichtbarkeit der Ressource, u.a. `ResourceResponsibility` und `ResourceVisibilityType`. |
| `meta.tag` | Kennzeichnung personenbezogener Daten (z.B. `ContainsPersonalInformation`). |
| `extension:ProcessingStatus` | Bearbeitungsstatus der Annotation, z.B. `inprogress`, `closed`, `cancelled`, `handedover`, `inhandover`, `intakeover` oder `forinformation`. |
| `extension:DateCreated` | Zeitpunkt der initialen Erstellung der Annotation. |
| `category` | Kategorie der Annotation, z.B. Kommentar oder Notizen. |
| `topic.text` | Betreff der Annotation. |
| `about` | Referenz auf die fachliche Bezugsentität. |
| `sent` | Fachlicher Versandzeitpunkt der Annotation. |
| `sender` | Erstellende Person als Referenz auf `EmigaUserPractitioner`. |
| `payload.contentString` | Textueller Inhalt der Annotation. |
| `payload.contentReference` | Referenz auf einen Anhang in Form einer `AttachmentDocumentReference`-Ressource. |


## Anhang

<TODO>: check redundancy

Mit Anhängen besteht die Möglichkeit, Dokumente, einschließlich aus Anschreiben-Vorlagen, an Annotationen anzuhängen. Dadurch können unterschiedliche Dateien strukturiert und nachvollziehbar an Entitäten oder organisationsbezogen hinterlegt werden.
Anhänge werden als eigenständige Ressource abgebildet, um eine unabhängige Versionierung der Anhänge zu ermöglichen.

{{render:guides/implementationguides.common/PlantUML/PNGs/AttachmentDocumentReference.png}}

Anhänge liegen als `AttachmentDocumentReference`-Ressourcen vor und werden aus der Annotation heraus referenziert. 
Dadurch können Metadaten zum Dokument, technische Prüfinformationen und Zugriffssteuerungsinformationen getrennt vom eigentlichen Annotationsinhalt verwaltet werden.

Relevante Angaben zum Anhang :

| Element | Bedeutung |
| --- | --- |
| `status` | <u>Fester</u>  Status `current`. |
| `identifier` | Fachliche Identifikatoren des Anhangs. |
| `date` | Erstellungszeitpunkt des Anhangs in EMIGA. |
| `author` | Erstellende Person des Anhangs als Referenz auf `EmigaUserPractitioner`. |
| `content.attachment.contentType` | MIME-Type des Dokuments. |
| `content.attachment.url` | URI des abgelegten Dokuments. |
| `content.attachment.size` | Dateigröße in Byte. |
| `content.attachment.hash` | Hashwert zur Integritätsprüfung. |
| `content.attachment.title` | Titel bzw. Bezeichnung des Dokuments. |
| `content.attachment.creation` | Zeitpunkt, zu dem der Anhang der Annotation hinzugefügt wurde. |

## Schnittstellenoperationen

Der Annotationsdienst stellt FHIR-Operationen auf Ebene von `Bundle` und `Identifier` bereit. 
Die Operationen verarbeiten FHIR-Ressourcen in den Formaten `application/fhir+json` oder `application/fhir+xml` und sind über Bearer Token abgesichert.

| Operation | Methode | Zweck | Ergebnis |
| --- | --- | --- | --- |
| `/metadata` | `GET` | Abruf des FHIR `CapabilityStatement`. | `CapabilityStatement` |
| `/Identifier/$emiga-identifier` | `GET`, `POST` | Erzeugt einen neuen eindeutigen EMIGA-Identifier für Annotationen im Mandantenkontext der authentifizierten Person. | `Parameters` mit `emigaIdentifier` |
| `/Bundle/$create-annotation` | `POST` | Erstellt eine neue Annotation oder eine neue Version einer bestehenden Annotation aus einem FHIR-`Bundle` mit `type = transaction`. Der erste Bundle-Eintrag muss eine `Communication` sein; mindestens ein `Practitioner`-Eintrag ist erforderlich. | Gespeichertes FHIR-`Bundle`. **⚠ Frage:** Create und Update mit der gleiche Funktion??|
| `/Bundle/$search-annotation` | `GET`, `POST` | Sucht Annotationen und liefert eine paginierte Trefferliste. | `Bundle` vom Typ `searchset` |
| `/Bundle/{id}/$annotation-details` | `GET`, `POST` | Liefert den aktuellen Detailstand einer Annotation anhand der Bundle- bzw. Datensatz-ID. | FHIR-`Bundle` |
| `/Bundle/{id}/$search-annotation-history` | `GET`, `POST` | Liefert die Versionshistorie einer Annotation. Unterstützt Filter-, Sortier-, Zeitraum- und Suchparameter. | Paginierter `Bundle` |
| `/Bundle/{id}/$annotation-version-details` | `GET`, `POST` | Liefert eine konkrete Version einer Annotation anhand von `versionNo` oder `versionId`. | FHIR-`Bundle` |
| `/Bundle/{id}/$delete-annotation` | `POST` | Markiert die angegebene Annotation als gelöscht, ohne sie physisch zu entfernen. **⚠ check**| `OperationOutcome` |
| `/OperationDefinition/{id}` | `GET` | Liest die technische Beschreibung einer Operation. | `OperationDefinition` |


## Erstellung und Versionierung

Beim Erstellen einer Annotation wird ein FHIR-`Bundle` mit `type = transaction` an den Endpunkt `/Bundle/$create-annotation` gesendet. Das Bundle muss die `AnnotationCommunication` als ersten fachlichen Eintrag enthalten. Die erstellende Person wird als `EmigaUserPractitioner` mitgeführt. Wenn Anhänge oder `Zusätzliche Eigenschaften` Bestandteil der Annotation sind, werden diese als weitere Bundle-Einträge aufgenommen und aus der `Communication` heraus referenziert.

Wird eine bestehende Annotation geändert, erzeugt der Dienst eine neue Version für das Bundle. Die aktuelle Version kann über `$annotation-details` gelesen werden. Frühere Stände können über `$search-annotation-history` gefunden und über `$annotation-version-details` gezielt abgerufen werden. Die Version kann dabei über `versionNo` oder `versionId` adressiert werden.

<TODO: check Richtigkeit>
Die **Versionierung** einer Annotation und der zugehörigen Anhänge erfolgt unabhängig voneinander. Für die Versionierung von Anhängen gelten folgende Regeln:
- Wird ein Anhang unter einem neuen Namen bzw. Titel (content.attachment.title) gespeichert, wird er als neuer Anhang behandelt und erhält eine neue ID. Dies gilt auch bei unverändertem Inhalt.
- Wird ein bestehender Anhang unter demselben Namen bzw. Titel geändert, behält er seine ID und erhält eine neue Version.

Änderungen an Anhängen wirken sich wie folgt auf die Versionierung der Annotation aus:
- Wird einer Annotation ein neuer Anhang hinzugefügt, entsteht eine neue Version der Annotation.
- Wird lediglich eine neue Version eines bereits referenzierten Anhangs erstellt, bleibt die Version der Annotation unverändert.

## Suche und Anzeige
Die Suche nach Annotationen erfolgt über `/Bundle/$search-annotation` und liefert ein FHIR-`Bundle` vom Typ `searchset`. Jeder Treffer enthält ein FHIR-Bundle mit den Ressourcen, die für die Anzeige des Treffers benötigt werden. Für paginierte Suchoperationen werden die FHIR-üblichen Parameter `_count` und `_offset` verwendet. Die Historienoperation unterstützt zusätzlich fachliche Filter wie `_filter`, `_sort`, `_startDate`, `_endDate` und `_search`. Clients können die Pagination über `_count` und `_offset` auswerten und die vom Server gelieferten Bundle-Links berücksichtigen.

Für eine Detailansicht soll nicht ausschließlich der Suchtreffer verwendet werden. Stattdessen ist der aktuelle Stand über `/Bundle/{id}/$annotation-details` abzurufen, damit Text, Betreff, Status, Sichtbarkeit, Ersteller, Anhänge und `Zusätzliche Eigenschaften` konsistent aus einem vollständigen Bundle interpretiert werden.

## Interoperabilitätshinweise
Der Bearbeitungsstatus ist ausschließlich der Extension `ProcessingStatus` zu entnehmen. `Communication.status` ist im Profil auf completed festgelegt und sollte hierfür nicht herangezogen werden.

Die Sichtbarkeit einer Annotation oder eines Anhangs wird über `meta.security` gekennzeichnet. Für Annotationen sind insbesondere die Codes `inAgency` und `transferable` relevant. 
Sie geben an, ob eine Annotation auf die eigene ÖGD-Stelle verbleibt  oder gemeinsam mit der zugehörigen Hauptentität (z. B. Fall oder Ausbruch) an andere Stellen übermittelt werden darf.

Annotationen können personenbezogene Daten im Sinne der DSGVO enthalten. Die Kennzeichnung erfolgt über `meta.tag` mit dem CodeSystem `PersonalInformation`. Clients sollten diese Kennzeichnung bei Anzeige, Übermittlung, Export und Protokollierung berücksichtigen.

Anhänge werden über `AttachmentDocumentReference.content.attachment.url` referenziert. Binärdaten werden in diesem Profil nicht direkt in `content.attachment.data` geführt. Integrität und Nachvollziehbarkeit des Anhangs werden durch Informationen wie Dateigröße, Hashwert, Titel, MIME-Type und Erstellungszeitpunkt unterstützt.
