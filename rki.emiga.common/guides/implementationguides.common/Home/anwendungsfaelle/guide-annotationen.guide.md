# {{page-title}}

**Annotationen** dienen dazu, fachliche Entitäten wie Fälle, Ausbrüche oder Personen mit Notizen und Kommentaren zu versehen.
Eine **Annotation** wird in EMIGA durch das FHIR-Profil `AnnotationCommunication` abgebildet. 
Für die Erstellung, Änderung und Übertragung einer Annotation werden die zugehörigen Ressourcen in einem FHIR-`Bundle` vom Typ `transaction` zusammengeführt. 
Das Bundle dient als technischer Container für die Annotation und die zugehörigen Begleitressourcen. 

Die zentrale fachliche Ressource ist `AnnotationCommunication`, welche die eigentliche Annotation repräsentiert. Sie muss obligatorisch als erster Eintrag im Bundle enthalten sein. 
Weitere Einträge im Bundle stellen die für die Verarbeitung und Interpretation der Annotation benötigten Begleitressourcen bereit. Dazu gehören uter anderen:

* die erstellende Person (`EmigaUserPractitioner`),
* optionale Anhänge (`AttachmentDocumentReference`) und
* optionale zusätzliche Eigenschaften (`AdditionalPropertiesQuestionnaireResponse`).

**Anhänge** der Annotation werden über das Profil `AttachmentDocumentReference` abgebildet und i.d.R. einer Annotation zugeordnet.
**Zusätzliche Eigenschaften** können über das Profil `AdditionalPropertiesQuestionnaireResponse` strukturiert mitgeführt und der Annotation zugeordnet werden.

{{render:guides/implementationguides.common/PlantUML/PNGs/AnnotationBundle.png}}

## Fachlicher Ablauf

Ein Client erzeugt zunächst bei Bedarf ein neues EMIGA-Aktenzeichen für Annotationen. Anschließend wird die Annotation als FHIR-Transaktionsbundle an den Annotationsdienst übergeben. Der Dienst speichert die enthaltenen Ressourcen, vergibt bzw. verwaltet technische Ressourcen-IDs und liefert ein Bundle mit dem gespeicherten Stand zurück.

Für die Anzeige und Weiterbearbeitung der Annotation-Bundel stehen Such-, Detail- und Historienoperationen zur Verfügung. 
Änderungen an einer bestehenden Annotation werden als neue Version der Annotation gespeichert. Dadurch bleibt nachvollziehbar, welcher Stand zu jenem Zeitpunkt gültig war. Eine gelöschte oder verworfene Annotation wird über die entsprechende Operation bzw. den Bearbeitungsstatus dokumentiert.

{{render:guides/implementationguides.common/PlantUML/PNGs/AnnotationCommunication.png}}

{{render:guides/implementationguides.common/PlantUML/PNGs/AnnotationBundle.png}}

Wird eine bestehende Annotation geändert, erzeugt der Dienst eine neue Version für das Bundle. Die aktuelle Version kann über `$annotation-details` gelesen werden. Frühere Stände können über `$search-annotation-history` gefunden und über `$annotation-version-details` gezielt abgerufen werden. Die Version kann dabei über `versionNo` oder `versionId` adressiert werden.

Bemerkung: Die **Versionierung** einer Annotation und der zugehörigen Anhänge erfolgt unabhängig voneinander. Für die Versionierung von **Anhängen** gelten folgende Regeln:
- Wird ein Anhang unter einem neuen Namen bzw. Titel (content.attachment.title) gespeichert, wird er als neuer Anhang behandelt und erhält eine neue ID. Dies gilt auch bei unverändertem Inhalt.
- Wird ein bestehender Anhang unter demselben Namen bzw. Titel geändert, erhält die Annotation eine neue Version.

Änderungen an Anhängen wirken sich wie folgt auf die Versionierung der Annotation aus:
- Wird einer Annotation ein neuer Anhang hinzugefügt, entsteht eine neue Version der Annotation.
- Wird lediglich eine neue Version eines bereits referenzierten Anhangs erstellt, bleibt die Version der Annotation unverändert.

## Suchen von Annotation
Die Suche nach Annotationen erfolgt über `/Bundle/$search-annotation` und liefert ein FHIR-`Bundle` vom Typ `searchset`. Jeder Treffer enthält ein FHIR-Bundle mit den Ressourcen, die für die Anzeige des Treffers benötigt werden. Für paginierte Suchoperationen werden die FHIR-üblichen Parameter `_count` und `_offset` verwendet. Die Historienoperation unterstützt zusätzlich fachliche Filter wie `_filter`, `_sort`, `_startDate`, `_endDate` und `_search`. Clients können die Pagination über `_count` und `_offset` auswerten und die vom Server gelieferten Bundle-Links berücksichtigen.

Für eine Detailansicht soll nicht ausschließlich der Suchtreffer verwendet werden. Stattdessen ist der aktuelle Stand über `/Bundle/{id}/$annotation-details` abzurufen, damit Text, Betreff, Status, Sichtbarkeit, Ersteller, Anhänge und `Zusätzliche Eigenschaften` konsistent aus einem vollständigen Bundle interpretiert werden.


## Anhang
**Anhänge** ermöglichen es, Dokumente, beispielweise Dokumenten aus Anschreiben-Vorlagen, strukturiert und nachvollziehbar <u>an Annotationen</u> zu hinterlegen. Anhänge werden als eigenständige Ressourcen geführt und aus Annotationen referenziert.

Anhänge liegen als eigenständige  `AttachmentDocumentReference`-Ressourcen vor und werden aus der Annotation heraus referenziert. 
Dadurch können Metadaten zum Dokument, technische Prüfinformationen und Zugriffssteuerungsinformationen getrennt vom eigentlichen Annotationsinhalt verwaltet werden.

{{render:guides/implementationguides.common/PlantUML/PNGs/AttachmentDocumentReference.png}}

Relevante Angaben zum Anhang sind unter anderen:

| Element | Bedeutung |
| --- | --- |
| `status` | <u>Fester</u>  Status `current`. |
| `identifier` | Fachliche Identifikatoren des Anhangs. |
| `date` | Erstellungszeitpunkt des Anhangs in EMIGA. |
| `author` | Erstellende Person des Anhangs, Referenz auf `EmigaUserPractitioner`. |
| `content.attachment.contentType` | MIME-Type des Dokuments. |
| `content.attachment.url` | URI des abgelegten Dokuments. |
| `content.attachment.size` | Dateigröße in Byte. |
| `content.attachment.hash` | Hashwert zur Integritätsprüfung. |
| `content.attachment.title` | Titel bzw. Bezeichnung des Dokuments. |
| `content.attachment.creation` | Zeitpunkt, zu dem der Anhang der Annotation hinzugefügt wurde. |

## Schnittstellenoperationen von Annotation

Der Annotationsdienst stellt FHIR-Operationen auf Ebene von `Bundle` und `Identifier` bereit. 
Die Operationen verarbeiten FHIR-Ressourcen in den Formaten `application/fhir+json` oder `application/fhir+xml` und sind über Bearer Token abgesichert. Die folgende Tabelle listet die relevanten Operationen auf:

| Operation | Methode | Zweck | Ergebnis |
| --- | --- | --- | --- |
| `/metadata` | `GET` | Abruf des FHIR `CapabilityStatement`. | `CapabilityStatement` |
| `/Identifier/$emiga-identifier` | `GET`, `POST` | Erzeugt einen neuen eindeutigen EMIGA-Identifier für Annotationen im Mandantenkontext der authentifizierten Person. | `Parameters` mit `emigaIdentifier` |
| `/Bundle/$create-annotation` | `POST` | Erstellt eine neue Annotation oder eine neue Version einer bestehenden Annotation aus einem FHIR-`Bundle` mit `type = transaction`. Der erste Bundle-Eintrag muss eine `Communication` sein; mindestens ein `Practitioner`-Eintrag ist erforderlich. | Gespeichertes FHIR-`Bundle`. **⚠ Frage:** Create und Update mit der gleiche Funktion??|
| `/Bundle/$search-annotation` | `GET`, `POST` | Sucht in den Annotationen und liefert eine paginierte Trefferliste. | `Bundle` vom Typ `searchset` |
| `/Bundle/{id}/$annotation-details` | `GET`, `POST` | Liefert den aktuellen Detailstand einer Annotation anhand der Bundle- bzw. Datensatz-ID. | FHIR-`Bundle` |
| `/Bundle/{id}/$search-annotation-history` | `GET`, `POST` | Liefert die Versionshistorie einer Annotation. Unterstützt Filter-, Sortier-, Zeitraum- und Suchparameter. | Paginierter `Bundle` |
| `/Bundle/{id}/$annotation-version-details` | `GET`, `POST` | Liefert eine konkrete Version einer Annotation anhand von `versionNo` oder `versionId`. | FHIR-`Bundle` |
| `/Bundle/{id}/$delete-annotation` | `POST` | Markiert die angegebene Annotation als gelöscht, ohne sie physisch zu entfernen. **⚠ check**| `OperationOutcome` |
| `/OperationDefinition/{id}` | `GET` | Liest die technische Beschreibung einer Operation. | `OperationDefinition` |
