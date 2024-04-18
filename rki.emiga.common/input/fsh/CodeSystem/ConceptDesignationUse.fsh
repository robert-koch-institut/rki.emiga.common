CodeSystem: ConceptDesignationUse
Id: ConceptDesignationUse
Title: "Nutzungszwecke für Anzeigetexte"
Description: "Die Kodiersystematik 'ConceptDesignationUse' definiert Konzepte, welche genutzt werden können, um verschiedene Arten bzw. Nutzungszwecke von Anzeigetexten zu unterscheiden. Die Verwendung der Konzepte erfolgt im Kontext von 'designation.use'."
* insert MetadataTerminology
* ^version = "1.0.0"
* ^date = "2024-03-28"
* ^caseSensitive = true
* ^content = #complete
* ^valueSet = "https://emiga.rki.de/fhir/common/ValueSet/ConceptDesignationUse"
* #abbreviation "Abkürzung" "Abkürzung für den Anzeigetext - Diese Darstellung repräsentiert eine maximal verkürzte Form des Anzeigetextes und kann beispielsweise zur platzsparenden Anzeige in Tabellen genutzt werden."
* #short "Kurzform" "Kurzform des Anzeigetextes - Diese Form sollte üblicherweise weniger umfassend sein als die Normalform und wird immer dann genutzt, wenn ein weniger platzintensive Darstellung erforderlich ist."
* #default "Normalform" "Normalform des Anzeigetextes - entspricht üblicherweise dem 'display'-Wert des Konzeptes"
* #long "Langform" "Langform des Anzeigetextes - Diese Form der Darstellung kann genutzt werden, wenn viel Platz vorhanden ist und ggf. mehr Informationen als in der Normalform transortiert werden müssen."

ValueSet: ConceptDesignationUse
Id: ConceptDesignationUse
Title: "Nutzungszwecke für Anzeigetexte (Werteliste)"
Description: "Werteliste mit Konzepten, die die Nutzungszwecke für Anzeigetexte beschreiben."
* insert MetadataTerminology
* ^version = "1.0.0"
* ^date = "2024-03-19"
* include codes from system ConceptDesignationUse