# Example: Attachment DocumentReference – Fachlicher Dokumentanhang

## Beispiel (Attachment 441557620)
Das folgende Beispiel zeigt einen Anhang, der als eigenständige `DocumentReference` in EMIGA verwaltet wird.

Bei dem Beispieldokument handelt es sich um eine PNG-Datei mit dem Titel:

```text
Sample Image
```

Die technische Informationen wird über `DocumentReference.content.attachment` beschrieben. Neben dem MIME-Type `image/png` werden unter anderem die Dateigröße, ein Hashwert und der Erstellungszeitpunkt des Dokuments angegeben.

Der Anhang besitzt zudem mehrere Identifier zur fachlichen Zuordnung:

| Identifier          | Beispielwert                   |
| ------------------- | ------------------------------ |
| EMIGA ID            | `DEFG-123456789`               |
| EMIGA File Number   | `ABCD-987654321`               |
| SurvNet File Number | `Attachment-SURVNET-987654321` |

Über:

```text
DocumentReference.author
```

wird mit:

```text
Practitioner/EmigaUser-001
```

der EMIGA-Benutzer referenziert, der den Anhang erstellt hat.

Die Ressource ist mit dem Status `current` als aktuell gültige Dokumentreferenz gekennzeichnet.

Über die Security Labels wird die Ressource außerdem als `transferable` gekennzeichnet und einer verantwortlichen ÖGD-Stelle zugeordnet.

Das Beispiel veranschaulicht damit insbesondere:

* die Abbildung eines Anhangs als `DocumentReference`,
* die Identifikation-Vergabe über fachliche Identifier,
* die Beschreibung der Datei über `content.attachment`,
* die Angabe des Erstellers über `author`,
* die Unterscheidung zwischen `DocumentReference.date` und `Attachment.creation`,
* sowie die Steuerung von Sichtbarkeit und Verantwortlichkeit über `meta.security`.

<tabs>
    <tab title="Übersicht">      
        {{render:DocumentReference-441557620.json}}
    </tab>
    <tab title="XML">      
        {{xml:DocumentReference-441557620.json}}
    </tab>
    <tab title="JSON">
        {{json:DocumentReference-441557620.json}}
    </tab>
    <tab title="Link">
        {{link:DocumentReference-441557620.json}}
    </tab>
</tabs>

<!-- {{json: DocumentReference/441557620}} -->
