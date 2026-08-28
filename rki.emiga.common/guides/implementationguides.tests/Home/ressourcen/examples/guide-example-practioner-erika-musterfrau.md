# Example: EMIGA User Practitioner
Das folgende Beispiel zeigt einen aktiven EMIGA-Nutzende als `Practitioner`.

Die Beispielperson:

```text
Erika Musterfrau
```

wird über das Profil:

```text
https://emiga.rki.de/fhir/common/StructureDefinition/EmigaUserPractitioner
```

abgebildet.

Als Identifier wird im Beispiel folgende Nutzendekennung verwendet:

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


Das Beispiel veranschaulicht damit insbesondere:

* die Abbildung eines EMIGA-Nutzende als EMIGA-`Practitioner`,
* die Identifikation des Nutzende,
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

