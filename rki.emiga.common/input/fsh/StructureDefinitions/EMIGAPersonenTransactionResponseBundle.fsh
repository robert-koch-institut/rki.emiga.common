Profile: EMIGAPersonenTransactionResponse
Parent: Bundle
Id: EMIGAPersonenTransactionResponse
Title: "EMIGA Personen TransactionBundle-Response"
Description: "Dieses Profil definiert die Server-Antwort auf Transaktions-Bundles im Rahmen von EMIGA Personen-Szenarien."
* ^version = "0.1.0"
* ^experimental = false
* ^date = "2025-09-26"
* ^publisher = "Robert Koch-Institut (RKI)"
* type = #transaction-response (exactly)
* type MS
* type ^short = "Type des Bundles"
* type ^comment = "fix: transaction-response"
* entry 1.. MS
* entry ^short = "Der einzelne Eintrag zur Interaktion"
* entry.link ..0
* entry.fullUrl MS
* entry.fullUrl ^short = "vollständige URL der Ressource"
* entry.resource MS
* entry.resource ^short = "Die Ressourcen-Instanz der Interaktion"
* entry.search ..0
//* entry.search ^short = "Such-Parameter der Interaktion"
* entry.search ^comment = "wird in einem Transaktions-Response-Bundle nicht verwendet"
* entry.request ..0
//* entry.request ^short = "HTTP-Request
* entry.request ^comment = "wird in einem Transaktions-Response-Bundle nicht verwendet"
* entry.response 1.. MS
* entry.response ^short = "HTTP-Response des Servers innerhalb der Transaktions-Antwort"
* entry.response.status MS
* entry.response.status ^short = "HTTP-Statuscode"
* entry.response.location MS
* entry.response.location ^short = "Location der Ressource (URL) auf dem Server"
* entry.response.location ^comment = "Gemäß FHIR-Spezifikation MUSS hier der Pfad zur exakten Version (History) enthalten sein, wenn der Server History unterstützt."
* entry.response.outcome MS
* entry.response.outcome ^short = "OperationOutcome-Ressource zur Rückgabe von Fehler-Details sowie Informationen."