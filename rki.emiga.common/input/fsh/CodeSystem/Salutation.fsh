CodeSystem: Salutation
Id: Salutation
Title: "Anrede"
Description: "Die Kodiersystematik 'Salutation' definiert Konzepte, die die Art der Anrede bestimmen."
* insert MetadataTerminology
* ^version = "1.0.0"
* ^date = "2024-11-07"
* ^caseSensitive = true
* ^content = #complete
* ^valueSet = "https://emiga.rki.de/fhir/ValueSet/Salutation"
* #SehrGeehrteFrau "Sehr geehrte Frau"
* #SehrGeehrterHerr "Sehr geehrter Herr"
* #SehrGeehrteFamilie "Sehr geehrte Familie"
* #SehrGeehrteErziehungsberechtigte "Sehr geehrte Erziehungsberechtigte des Kindes"
* #SehrGeehrteDameSehrGeehrterHerr "Sehr geehrte Dame, sehr geehrter Herr"



ValueSet: Salutation
Id: Salutation
Title: "Anrede"
Description: "Werteliste mit Konzepten, die die Art der Anrede bestimmen."
* ^url = "https://emiga.rki.de/fhir/ValueSet/Salutation"
* insert MetadataTerminology
* ^version = "1.0.0"
* ^date = "2024-11-07"
* include codes from system Salutation
* $v3-NullFlavor#NASK "not asked"