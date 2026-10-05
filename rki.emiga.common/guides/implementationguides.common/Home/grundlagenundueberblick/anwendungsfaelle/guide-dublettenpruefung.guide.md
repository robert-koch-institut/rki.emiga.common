# {{page-title}}
#TODO @konvoulg

Die **Dublettenprüfung** dient dazu, zu einer Person mögliche bereits vorhandene Datensätze zu identifizieren. Hierzu werden ausgewählte Merkmale einer Person miteinander verglichen und anhand definierter **Dublettenprüfungs-Kriterien** bewertet.

Die für den Abgleich verwendeten Kriterien werden über das CodeSystem `DuplicateMatchCriteria` definiert. Dieses umfasst sowohl exakte als auch unscharfe (fuzzy) und phonetische Vergleichsverfahren, beispielsweise für Geburtsdatum, Vorname, Familienname, Straße, Hausnummer, Postleitzahl, Stadt, Geburtsname und Geburtsland.

Das Ergebnis eines Matching-Vorgangs wird in einer `Bundle`-Ressourceninstanz gemäß dem Profil `MatchOutputBundle` übertragen. Das Bundle ist vom Typ `searchset` und enthält die zu den Suchkriterien passenden Personen als `Patient`-Einträge. Die enthaltenen Personen werden dabei über das Profil `AffectedPerson` abgebildet.

Für jeden gefundenen Datensatz wird über `Bundle.entry.search.score` ein normalisierter Match-Score zwischen 0 und 1 angegeben. Zusätzlich werden über die Extensions `match-grade` und `DuplicateMatchMetadata` Informationen zur Qualität und zu den verwendeten Matching-Merkmalen bereitgestellt.

Bei der Dublettenprüfung werden die relevanten Merkmale der zu prüfenden Person anhand eines oder mehrerer **Dublettenprüfungs-Kriterien** miteinander verglichen. Je nach Merkmal kommen dabei unterschiedliche Vergleichsverfahren zum Einsatz. So kann beispielsweise das Geburtsdatum exakt verglichen werden, während Vor- und Familienname über einen Fuzzy-Vergleich und Straße oder Stadt über einen phonetischen Vergleich geprüft werden.

Die verfügbaren Kriterien werden über das CodeSystem `DuplicateMatchCriteria` eindeutig codiert. Dadurch kann der verwendete Abgleich unabhängig von der konkreten Implementierung strukturiert beschrieben und ausgewertet werden.

Das Ergebnis der Prüfung wird als `MatchOutputBundle` zurückgegeben. Jeder gefundene Treffer wird als `Patient`-Eintrag innerhalb des Bundles dargestellt. Über `Bundle.entry.search.mode` wird der Eintrag als `match` gekennzeichnet und über `Bundle.entry.search.score` mit einem normalisierten Match-Score versehen.

Zusätzlich enthält jeder Treffer die Extensions `http://hl7.org/fhir/StructureDefinition/match-grade` und `DuplicateMatchMetadata`. Diese ermöglichen die strukturierte Angabe der Match-Qualität sowie weiterer EMIGA-spezifischer Informationen zum durchgeführten Dublettenabgleich.