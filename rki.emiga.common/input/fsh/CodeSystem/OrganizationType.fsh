CodeSystem: OrganizationType
Id: OrganizationType
Title: "Organizationstyp"
Description: "Die Kodiersystematik 'OrganizationType' definiert Konzepte, die die Art/den Typ einer Organisation aus Sicht des ÖGD grob charakterisieren."
* insert MetadataTerminology
* ^version = "2.0.0"
* ^date = "2026-07-03"
* ^caseSensitive = true
* ^content = #complete
* ^url = "https://emiga.rki.de/fhir/vzd/CodeSystem/OrganizationType"
//* ^valueSet = "https://emiga.rki.de/fhir/vzd/ValueSet/OrganizationType"
* ^hierarchyMeaning = #is-a

* #ga "Gesundheitsamt"
* #ga ^designation[0].language = #de-DE
* #ga ^designation[=].use = $ConceptDesignationUse#abbreviation
* #ga ^designation[=].value = "GA"
* #lb "Landesbehörde"
* #lb ^designation[0].language = #de-DE
* #lb ^designation[=].use = $ConceptDesignationUse#abbreviation
* #lb ^designation[=].value = "LB"
* #rki "Robert Koch-Institut"
* #rki ^designation[0].language = #de-DE
* #rki ^designation[=].use = $ConceptDesignationUse#abbreviation
* #rki ^designation[=].value = "RKI"
* #bw "Sanitätsdienst der Bundeswehr"
* #bw ^designation[0].language = #de-DE
* #bw ^designation[=].use = $ConceptDesignationUse#abbreviation
* #bw ^designation[=].value = "BW"

* #authority "Behörde"
* #authority ^designation[0].language = #en-US
* #authority ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #authority ^designation[=].use = $HL7DesignationUse#display
* #authority ^designation[=].value = "Authority"

* #authority #sepFedAut "Oberste Bundesbehörde"
* #authority #sepFedAut ^designation[0].language = #en-US
* #authority #sepFedAut ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #authority #sepFedAut ^designation[=].use = $HL7DesignationUse#display
* #authority #sepFedAut ^designation[=].value = "Supreme federal authority"

* #authority #hiFedAut "Bundesoberbehörde"
* #authority #hiFedAut ^designation[0].language = #en-US
* #authority #hiFedAut ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #authority #hiFedAut ^designation[=].use = $HL7DesignationUse#display
* #authority #hiFedAut ^designation[=].value = "Higher federal authority"

* #authority #fedInsti "Bundesanstalt"
* #authority #fedInsti ^designation[0].language = #en-US
* #authority #fedInsti ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #authority #fedInsti ^designation[=].use = $HL7DesignationUse#display
* #authority #fedInsti ^designation[=].value = "Federal Institute"

* #authority #supFedStaAut "Oberste Landesbehörde"
* #authority #supFedStaAut ^designation[0].language = #en-US
* #authority #supFedStaAut ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #authority #supFedStaAut ^designation[=].use = $HL7DesignationUse#display
* #authority #supFedStaAut ^designation[=].value = "Supreme Federal State authority"

* #authority #otherAutFed "Sonstige Behörde auf Bundesebene"
* #authority #otherAutFed ^designation[0].language = #en-US
* #authority #otherAutFed ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #authority #otherAutFed ^designation[=].use = $HL7DesignationUse#display
* #authority #otherAutFed ^designation[=].value = "Other authority federal" 

* #authority #otherAutState "Sonstige Behörde auf Landesebene"
* #authority #otherAutState ^designation[0].language = #en-US
* #authority #otherAutState ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #authority #otherAutState ^designation[=].use = $HL7DesignationUse#display
* #authority #otherAutState ^designation[=].value = "Other authority state" 

* #authority #intOrg "Internationale Organisation"
* #authority #intOrg ^designation[0].language = #en-US  
* #authority #intOrg ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage" 
* #authority #intOrg ^designation[=].use = $HL7DesignationUse#display
* #authority #intOrg ^designation[=].value = "International Organization"  

* #resFacility "Forschungseinrichtung"
* #resFacility ^designation[0].language = #en-US  
* #resFacility ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage" 
* #resFacility ^designation[=].use = $HL7DesignationUse#display
* #resFacility ^designation[=].value = "Research Facility" 

* #otherOrg "sonstige Einrichtung"
* #otherOrg ^designation[0].language = #en-US  
* #otherOrg ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage" 
* #otherOrg ^designation[=].use = $HL7DesignationUse#display
* #otherOrg ^designation[=].value = "other Organization" 

* #transport "Transport"
* #transport ^designation[0].language = #en-US  
* #transport ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage" 
* #transport ^designation[=].use = $HL7DesignationUse#display 
* #transport ^designation[=].value = "Transport" 

* #transport #airport "Flughafen"
* #transport #airport ^designation[0].language = #en-US  
* #transport #airport ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage" 
* #transport #airport ^designation[=].use = $HL7DesignationUse#display 
* #transport #airport ^designation[=].value = "Airport" 

* #transport #harbor "Hafen"
* #transport #harbor ^designation[0].language = #en-US  
* #transport #harbor ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage" 
* #transport #harbor ^designation[=].use = $HL7DesignationUse#display 
* #transport #harbor ^designation[=].value = "Harbor" 

* #barracks "Kaserne"
* #barracks ^designation[0].language = #en-US  
* #barracks ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage" 
* #barracks ^designation[=].use = $HL7DesignationUse#display 
* #barracks ^designation[=].value = "Barracks" 

* #carWash "Autowaschanlage"
* #carWash ^designation[0].language = #en-US
* #carWash ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #carWash ^designation[=].use = $HL7DesignationUse#display
* #carWash ^designation[=].value = "Car Wash"

* #cemetery "Friedhof"
* #cemetery ^designation[0].language = #en-US
* #cemetery ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #cemetery ^designation[=].use = $HL7DesignationUse#display
* #cemetery ^designation[=].value = "Cemetery"

* #coolingTowers "Kühltürme"
* #coolingTowers ^designation[0].language = #en-US
* #coolingTowers ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #coolingTowers ^designation[=].use = $HL7DesignationUse#display
* #coolingTowers ^designation[=].value = "Cooling Towers"

* #crematorium "Krematorium"
* #crematorium ^designation[0].language = #en-US
* #crematorium ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #crematorium ^designation[=].use = $HL7DesignationUse#display
* #crematorium ^designation[=].value = "Crematorium"

* #deportationDetCenter "Abschiebehaftanstalt"
* #deportationDetCenter ^designation[0].language = #en-US
* #deportationDetCenter ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #deportationDetCenter ^designation[=].use = $HL7DesignationUse#display
* #deportationDetCenter ^designation[=].value = "Deportation Detention Center"

* #detentionCenter "Untersuchungshaftanstalt"
* #detentionCenter ^designation[0].language = #en-US
* #detentionCenter ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #detentionCenter ^designation[=].use = $HL7DesignationUse#display
* #detentionCenter ^designation[=].value = "Detention Center"

* #evaporativeCoolingSystem "Verdunstungskühlanlage"
* #evaporativeCoolingSystem ^designation[0].language = #en-US
* #evaporativeCoolingSystem ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #evaporativeCoolingSystem ^designation[=].use = $HL7DesignationUse#display
* #evaporativeCoolingSystem ^designation[=].value = "Evaporative Cooling System"

* #fullInpatientCareNursingFacility "Pflege- und Betreuungseinrichtung, Vollstationäre Pflegeeinrichtung"
* #fullInpatientCareNursingFacility ^designation[0].language = #en-US
* #fullInpatientCareNursingFacility ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #fullInpatientCareNursingFacility ^designation[=].use = $HL7DesignationUse#display
* #fullInpatientCareNursingFacility ^designation[=].value = "Full Inpatient Care Nursing Facility"

* #funeralHome "Bestattungsunternehmen"
* #funeralHome ^designation[0].language = #en-US
* #funeralHome ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #funeralHome ^designation[=].use = $HL7DesignationUse#display
* #funeralHome ^designation[=].value = "Funeral Home"

* #funeralServiceEstab "Einrichtung des Bestattungswesens"
* #funeralServiceEstab ^designation[0].language = #en-US
* #funeralServiceEstab ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #funeralServiceEstab ^designation[=].use = $HL7DesignationUse#display
* #funeralServiceEstab ^designation[=].value = "Funeral Service Establishment"

* #gym "Fitnessstudio"
* #gym ^designation[0].language = #en-US
* #gym ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #gym ^designation[=].use = $HL7DesignationUse#display
* #gym ^designation[=].value = "Gym"

* #healthInsurance "Krankenkasse"
* #healthInsurance ^designation[0].language = #en-US
* #healthInsurance ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #healthInsurance ^designation[=].use = $HL7DesignationUse#display
* #healthInsurance ^designation[=].value = "Health Insurance"

* #initialReceptionCenter "Erstaufnahmeeinrichtung"
* #initialReceptionCenter ^designation[0].language = #en-US
* #initialReceptionCenter ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #initialReceptionCenter ^designation[=].use = $HL7DesignationUse#display
* #initialReceptionCenter ^designation[=].value = "Initial Reception Center"

* #inpatientHospice "Stationäres Hospiz"
* #inpatientHospice ^designation[0].language = #en-US
* #inpatientHospice ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #inpatientHospice ^designation[=].use = $HL7DesignationUse#display
* #inpatientHospice ^designation[=].value = "Inpatient Hospice"

* #inpatientIntegrationAssistance "Stationäre Eingliederungshilfe"
* #inpatientIntegrationAssistance ^designation[0].language = #en-US
* #inpatientIntegrationAssistance ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #inpatientIntegrationAssistance ^designation[=].use = $HL7DesignationUse#display
* #inpatientIntegrationAssistance ^designation[=].value = "Inpatient Integration Assistance"

* #juvenileDetentionCenter "Jugendstrafanstalt"
* #juvenileDetentionCenter ^designation[0].language = #en-US
* #juvenileDetentionCenter ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #juvenileDetentionCenter ^designation[=].use = $HL7DesignationUse#display
* #juvenileDetentionCenter ^designation[=].value = "Juvenile Detention Center"

* #majorEvent "Großveranstaltung"
* #majorEvent ^designation[0].language = #en-US
* #majorEvent ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #majorEvent ^designation[=].use = $HL7DesignationUse#display
* #majorEvent ^designation[=].value = "Major Event"

* #nightclub "Diskothek"
* #nightclub ^designation[0].language = #en-US
* #nightclub ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #nightclub ^designation[=].use = $HL7DesignationUse#display
* #nightclub ^designation[=].value = "Nightclub"

* #pharmacy "Apotheke"
* #pharmacy ^designation[0].language = #en-US
* #pharmacy ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #pharmacy ^designation[=].use = $HL7DesignationUse#display
* #pharmacy ^designation[=].value = "Pharmacy"

* #professionalSchool  "Berufsschule"
* #professionalSchool  ^designation[0].language = #en-US
* #professionalSchool  ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #professionalSchool  ^designation[=].use = $HL7DesignationUse#display
* #professionalSchool  ^designation[=].value = "Professional School"

* #prostitutionIndustryEstab "Einrichtung des Prostitutionsgewerbes"
* #prostitutionIndustryEstab ^designation[0].language = #en-US
* #prostitutionIndustryEstab ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #prostitutionIndustryEstab ^designation[=].use = $HL7DesignationUse#display
* #prostitutionIndustryEstab ^designation[=].value = "Prostitution Industry Establishment"

* #publicHealthServiceEstab "Einrichtung des öffentlichen Gesundheitsdienstes"
* #publicHealthServiceEstab ^designation[0].language = #en-US
* #publicHealthServiceEstab ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #publicHealthServiceEstab ^designation[=].use = $HL7DesignationUse#display
* #publicHealthServiceEstab ^designation[=].value = "Public Health Service Establishment"

* #publicHealthSystemEstab "Einrichtung des öffentlichen Gesundheitswesens"
* #publicHealthSystemEstab ^designation[0].language = #en-US
* #publicHealthSystemEstab ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #publicHealthSystemEstab ^designation[=].use = $HL7DesignationUse#display
* #publicHealthSystemEstab ^designation[=].value = "Public Health System Establishment"

* #retirementHomeWithoutService "Altenwohnheim"
* #retirementHomeWithoutService ^designation[0].language = #en-US
* #retirementHomeWithoutService ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #retirementHomeWithoutService ^designation[=].use = $HL7DesignationUse#display
* #retirementHomeWithoutService ^designation[=].value = "Retirement Home without Service"

* #retirementHomeWithService "Altenheim"
* #retirementHomeWithService ^designation[0].language = #en-US
* #retirementHomeWithService ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #retirementHomeWithService ^designation[=].use = $HL7DesignationUse#display
* #retirementHomeWithService ^designation[=].value = "Retirement Home with Service"

* #saunaWellnessFacility "Sauna- und Wellnessanlage"
* #saunaWellnessFacility ^designation[0].language = #en-US
* #saunaWellnessFacility ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #saunaWellnessFacility ^designation[=].use = $HL7DesignationUse#display
* #saunaWellnessFacility ^designation[=].value = "Sauna and Wellness Facility"

* #sea "Sonstige Einrichtung mit relevanter Wasser Aerosolierung"
* #sea ^designation[0].language = #en-US
* #sea ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #sea ^designation[=].use = $HL7DesignationUse#display
* #sea ^designation[=].value = "SEA (Other Facility with relevant water aerosolization)"

* #sewageTreatmentPlant "Kläranlage"
* #sewageTreatmentPlant ^designation[0].language = #en-US
* #sewageTreatmentPlant ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #sewageTreatmentPlant ^designation[=].use = $HL7DesignationUse#display
* #sewageTreatmentPlant ^designation[=].value = "Sewage Treatment Plant"

* #sportsLeisureRecreationFacility "Sport- Freizeit- und Erholungsanlage"
* #sportsLeisureRecreationFacility ^designation[0].language = #en-US
* #sportsLeisureRecreationFacility ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #sportsLeisureRecreationFacility ^designation[=].use = $HL7DesignationUse#display
* #sportsLeisureRecreationFacility ^designation[=].value = "Sports, Leisure and Recreation Facility"

* #substituteImprisonmentPenalInstitution   "Vollzugsanstalt für Ersatzfreiheitsstrafe"
* #substituteImprisonmentPenalInstitution   ^designation[0].language = #en-US
* #substituteImprisonmentPenalInstitution   ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #substituteImprisonmentPenalInstitution   ^designation[=].use = $HL7DesignationUse#display
* #substituteImprisonmentPenalInstitution   ^designation[=].value = "Substitute Imprisonment Penal Institution"

* #swimmingBathingArea "Schwimm- und Badestelle"
* #swimmingBathingArea ^designation[0].language = #en-US
* #swimmingBathingArea ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #swimmingBathingArea ^designation[=].use = $HL7DesignationUse#display
* #swimmingBathingArea ^designation[=].value = "Swimming and Bathing Area"

* #tanningSalon "Sonnenstudio"
* #tanningSalon ^designation[0].language = #en-US
* #tanningSalon ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #tanningSalon ^designation[=].use = $HL7DesignationUse#display
* #tanningSalon ^designation[=].value = "Tanning Salon"

* #testCenter "Teststelle"
* #testCenter ^designation[0].language = #en-US
* #testCenter ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #testCenter ^designation[=].use = $HL7DesignationUse#display
* #testCenter ^designation[=].value = "Test Center"

* #university "Hochschule"
* #university ^designation[0].language = #en-US
* #university ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #university ^designation[=].use = $HL7DesignationUse#display
* #university ^designation[=].value = "University"

* #wasteDisposalFacility "Abfallbeseitigungsanlage"
* #wasteDisposalFacility ^designation[0].language = #en-US
* #wasteDisposalFacility ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #wasteDisposalFacility ^designation[=].use = $HL7DesignationUse#display
* #wasteDisposalFacility ^designation[=].value = "Waste Disposal Facility"

* #womenShelter "Frauenhaus"
* #womenShelter ^designation[0].language = #en-US
* #womenShelter ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #womenShelter ^designation[=].use = $HL7DesignationUse#display
* #womenShelter ^designation[=].value = "Women Shelter"

* #workplace "Arbeitsstätte"
* #workplace ^designation[0].language = #en-US
* #workplace ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* #workplace ^designation[=].use = $HL7DesignationUse#display
* #workplace ^designation[=].value = "Workplace"