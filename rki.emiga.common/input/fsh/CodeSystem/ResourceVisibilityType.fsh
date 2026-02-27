CodeSystem: ResourceVisibilityType
Id: ResourceVisibilityType
Title: "Ressourcensichtbarkeit"
Description: "Die Kodiersystematik 'ResourceVisibilityType' definiert Konzepte, die die gewünschte Sichtbarkeit von Ressourcen beschreiben. Die entsprechende Information kann herangezogen werden, um im Rahmen des Access Control Systems zu entscheiden, ob eine Information für bestimmte Nutzergruppen sichtbar gemacht werden soll, oder nicht."
* insert MetadataTerminology
* ^version = "2.0.0"
* ^date = "2024-09-26"
* ^caseSensitive = true
* ^content = #complete

* ^property[0].code = #status
* ^property[0].uri = "http://hl7.org/fhir/concept-properties#status"
* ^property[0].description = "Gekennzeichnet, ob ein Konzept verworfen ist."
* ^property[0].type = #code

* ^property[+].code = #replaced-by
* ^property[=].description = "Der Code, den dieser Code ersetzt."
* ^property[=].type = #code

* #public "öffentlich" "Öffentliche Sichtbarkeit - Ressourcen, die entsprechend ausgezeichnet sind, dürfen durch beliebige Akteure (auch die Öffentlichkeit) zur Anzeige gebracht werden."
* #internal "intern" "ÖGD interne Sichtbarkeit - Ressourcen, die entsprechend ausgezeichnet sind, dürfen durch beliebige Stellen des ÖGD eingesehen werden."
* #internal ^property[0].code = #status
* #internal ^property[0].valueCode = #deprecated
* #internal ^property[1].code = #replaced-by
* #internal ^property[1].valueCode = #inPublicHealthService
* #private "privat" "Private Sichtbarkeit - Ressourcen, die entsprechend ausgezeichnet sind, dürfen lediglich im Kontext einer bestimmten Stelle des Öffentlichen Gesundheitsdienstes zur Anzeige gebracht werden."
* #private ^property[0].code = #status
* #private ^property[0].valueCode = #deprecated
* #private ^property[1].code = #replaced-by
* #private ^property[1].valueCode = #inAgency
* #inPublicHealthService "ÖGD-weit" "Ressourcen, die entsprechend ausgezeichnet sind, dürfen durch beliebige Stellen des ÖGD eingesehen werden."
* #inFederalState "BL-weit" "Ressourcen, die entsprechend ausgezeichnet sind, dürfen durch beliebige Stellen des ÖGD im eigenen Bundesland eingesehen werden."
* #inAgency "Eigene ÖGD-Stelle" "Ressourcen, die entsprechend ausgezeichnet sind, dürfen lediglich im Kontext einer bestimmten Stelle des Öffentlichen Gesundheitsdienstes zur Anzeige gebracht werden."
* #transferable "übermittelbar" "Ressourcen, die entsprechend ausgezeichnet sind, werden an die Bundesstelle und das RKI übermittelt."