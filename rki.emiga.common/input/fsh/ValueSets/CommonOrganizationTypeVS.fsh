ValueSet: CommonOrganizationTypeVS
Id: CommonOrganizationTypeVS
Title: "Gemeinsame Organisationstypen ohne ÖGD-Organisationen"
Description: "Werteliste mit Konzepten, die die Art/den Typ einer gemeinsamen Organisation aus Sicht des ÖGD grob charakterisieren."
* insert MetadataTerminology
* ^version = "0.1.0"
* ^date = "2026-06-18"
* ^url = "https://emiga.rki.de/fhir/ValueSet/CommonOrganizationTypeVS"

* $DemisOrgType#medFacility "Medizinische Einrichtung"
* $DemisOrgType#outpatSurgery "Einrichtung für ambulantes Operieren"
* $DemisOrgType#prevCareRehab "Vorsorge- oder Reha-Einrichtung"
* $DemisOrgType#dialysisFacility "Dialyseeinrichtung"
* $DemisOrgType#dayHospital "Tagesklinik"
* $DemisOrgType#maternity "Entbindungseinrichtung"
* $DemisOrgType#physicianOffice "Arztpraxis"
* $DemisOrgType#dentalSurgery "Zahnarztpraxis"
* $DemisOrgType#psycFacility "Psychotherapeutische Praxis"
* $DemisOrgType#othMedPractice "Sonstige Heilberufepraxis"
* $DemisOrgType#medFacPHA "Medizinische Einrichtung des ÖGDs"
* $DemisOrgType#emResServ "Rettungsdienst"
* $DemisOrgType#civDisFacility "Einrichtungen des Zivil- und Katastrophenschutzes"

* $DemisOrgType#hospital "Krankenhaus"
//* $DemisOrgType#hospital ^designation[0].language = #en-US
//* $DemisOrgType#hospital ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
//* $DemisOrgType#hospital ^designation[=].use = $HL7DesignationUse#display
//* $DemisOrgType#hospital ^designation[=].value = "Hospital"
//* $DemisOrgType#othMedFacility "Sonstige medizinische Einrichtung"

* $DemisOrgType#childCareFacility "Gemeinschaftseinrichtung"
* $DemisOrgType#kindergarten "Kindertageseinrichtung (z. B. Kita)"
* $DemisOrgType#childDayNursery "Kindertagespflege"
* $DemisOrgType#school "Schule"
* $DemisOrgType#childHome "Kinderheim o.ä." 
* $DemisOrgType#holidayCamp "Ferienlager"
* $DemisOrgType#childDayCare "Kinderhort"
* $DemisOrgType#othEdFac "sonstige Ausbildungseinrichtung"
* $DemisOrgType#othChildCareFac "Sonstige Kinderbetreuungseinrichtung" 

* $DemisOrgType#housingFacility "Gemeinschaftsunterkunft" 
* $DemisOrgType#homelessShelter "Obdachlosenunterkunft"
* $DemisOrgType#migrantAccom "Migrantenunterkunft"
* $DemisOrgType#prison "Justizvollzugsanstalt"
* $DemisOrgType#othMassAccom "Sonstige Massenunterkunft"

* $DemisOrgType#nursingHome "voll- oder teilstationäre Einrichtung und besondere Wohnform zur Betreuung und Unterbringung"
* $DemisOrgType#elderlyCareHome "Einrichtung zur Betreuung/Unterbringung älterer Menschen"
* $DemisOrgType#disabledCareHome "Einrichtung zur Betreuung/Unterbringung behinderter Menschen"
* $DemisOrgType#assistedCareHome "Einrichtung zur Betreuung/Unterbringung pflegebedürftiger Menschen"
* $DemisOrgType#outpatICServ "Ambulanter Intensivpflegedienst"
* $DemisOrgType#othOutpatCareS "Sonstiger ambulanter Pflegedienst"

* $DemisOrgType#othBloodRiskFac "Sonstige Einrichtung mit Blutübertragungsrisiko"

* $DemisOrgType#othHygRelFacility "Sonstige hygienerelevante Einrichtung"

* $DemisOrgType#othAccom "Andere Unterkunft"
* $DemisOrgType#hotel "Hotel o.ä."
* $DemisOrgType#holidayHome "Ferienwohnung"
* $DemisOrgType#camping "Campingplatz o.ä."
* $DemisOrgType#ship "Schiff o.ä."

* $DemisOrgType#foodEstablmt "Lebensmittelbetrieb"

* $DemisOrgType#laboratory "Erregerdiagnostische Untersuchungsstelle"
* $DemisOrgType#publicHealthLab "Medizinaluntersuchungsamt"
* $DemisOrgType#refLab "Einrichtung der Spezialdiagnostik"
* $DemisOrgType#hospitalLab "Krankenhauslabor"
* $DemisOrgType#pathology "Pathologisch-anatomische Einrichtung"
* $DemisOrgType#othPublicLab "Sonstige öffentliche Untersuchungsstelle"
* $DemisOrgType#othPrivatLab "Sonstige private Untersuchungsstelle"

* $OrganizationType#authority "Behörde"
/*
* $OrganizationType#authority ^designation[0].language = #en-US
* $OrganizationType#authority ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* $OrganizationType#authority ^designation[=].use = $HL7DesignationUse#display
* $OrganizationType#authority ^designation[=].value = "Authority"
*/

* $OrganizationType#sepFedAut "Oberste Bundesbehörde"
/*
* $OrganizationType#sepFedAut ^designation[0].language = #en-US
* $OrganizationType#sepFedAut ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* $OrganizationType#sepFedAut ^designation[=].use = $HL7DesignationUse#display
* $OrganizationType#sepFedAut ^designation[=].value = "Supreme federal authority"
*/

* $OrganizationType#hiFedAut "Bundesoberbehörde"
/*
* $OrganizationType#hiFedAut ^designation[0].language = #en-US
* $OrganizationType#hiFedAut ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* $OrganizationType#hiFedAut ^designation[=].use = $HL7DesignationUse#display
* $OrganizationType#hiFedAut ^designation[=].value = "Higher federal authority"
*/

* $OrganizationType#fedInsti "Bundesanstalt"
/*
* $OrganizationType#fedInsti ^designation[0].language = #en-US
* $OrganizationType#fedInsti ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* $OrganizationType#fedInsti ^designation[=].use = $HL7DesignationUse#display
* $OrganizationType#fedInsti ^designation[=].value = "Federal Institute"
*/
* $OrganizationType#supFedStaAut "Oberste Landesbehörde"
/*
* $OrganizationType#supFedStaAut ^designation[0].language = #en-US
* $OrganizationType#supFedStaAut ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* $OrganizationType#supFedStaAut ^designation[=].use = $HL7DesignationUse#display
* $OrganizationType#supFedStaAut ^designation[=].value = "Supreme Federal State authority"
*/

* $OrganizationType#otherAutFed "Sonstige Behörde auf Bundesebene"
/*
* $OrganizationType#otherAutFed ^designation[0].language = #en-US
* $OrganizationType#otherAutFed ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* $OrganizationType#otherAutFed ^designation[=].use = $HL7DesignationUse#display
* $OrganizationType#otherAutFed ^designation[=].value = "Other authority federal" 
*/
* $OrganizationType#otherAutState "Sonstige Behörde auf Landesebene"
/*
* $OrganizationType#otherAutState ^designation[0].language = #en-US
* $OrganizationType#otherAutState ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* $OrganizationType#otherAutState ^designation[=].use = $HL7DesignationUse#display
* $OrganizationType#otherAutState ^designation[=].value = "Other authority state" 
*/

* $OrganizationType#intOrg "Internationale Organisation"
/*
* $OrganizationType#intOrg ^designation[0].language = #en-US
* $OrganizationType#intOrg ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* $OrganizationType#intOrg ^designation[=].use = $HL7DesignationUse#display
* $OrganizationType#intOrg ^designation[=].value = "International Organization"
*/

* $OrganizationType#resFacility "Forschungseinrichtung"
/*
* $OrganizationType#resFacility ^designation[0].language = #en-US  
* $OrganizationType#resFacility ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage" 
* $OrganizationType#resFacility ^designation[=].use = $HL7DesignationUse#display 
* $OrganizationType#resFacility ^designation[=].value = "Research Facility" 
*/

* $OrganizationType#otherOrg "sonstige Einrichtung"
/*
* $OrganizationType#otherOrg ^designation[0].language = #en-US  
* $OrganizationType#otherOrg ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage" 
* $OrganizationType#otherOrg ^designation[=].use = $HL7DesignationUse#display 
* $OrganizationType#otherOrg ^designation[=].value = "other Organization" 
*/

* $OrganizationType#transport "Transport"
/*
* $OrganizationType#transport ^designation[0].language = #en-US
* $OrganizationType#transport ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* $OrganizationType#transport ^designation[=].use = $HL7DesignationUse#display
* $OrganizationType#transport ^designation[=].value = "Transport"
*/

* $OrganizationType#airport "Flughafen"
/*
* $OrganizationType#airport ^designation[0].language = #en-US
* $OrganizationType#airport ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* $OrganizationType#airport ^designation[=].use = $HL7DesignationUse#display
* $OrganizationType#airport ^designation[=].value = "Airport"
*/

* $OrganizationType#harbor "Hafen"
/*
* $OrganizationType#harbor ^designation[0].language = #en-US
* $OrganizationType#harbor ^designation[=].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* $OrganizationType#harbor ^designation[=].use = $HL7DesignationUse#display
* $OrganizationType#harbor ^designation[=].value = "Harbor" 
*/

* $OrganizationType#barracks "Kaserne"
* $OrganizationType#carWash "Autowaschanlage"
* $OrganizationType#cemetery "Friedhof"
* $OrganizationType#coolingTowers "Kühltürme"
* $OrganizationType#crematorium "Krematorium"
* $OrganizationType#deportationDetCenter "Abschiebehaftanstalt"
* $OrganizationType#detentionCenter "Untersuchungshaftanstalt"
* $OrganizationType#evaporativeCoolingSystem "Verdunstungskühlanlage"
* $OrganizationType#fullInpatientCareNursingFacility "Pflege- und Betreuungseinrichtung, Vollstationäre Pflegeeinrichtung"
* $OrganizationType#funeralHome "Bestattungsunternehmen"
* $OrganizationType#funeralServiceEstab "Einrichtung des Bestattungswesens"
* $OrganizationType#gym "Fitnessstudio"
* $OrganizationType#healthInsurance "Krankenkasse"
* $OrganizationType#initialReceptionCenter "Erstaufnahmeeinrichtung"
* $OrganizationType#inpatientHospice "Stationäres Hospiz"
* $OrganizationType#inpatientIntegrationAssistance "Stationäre Eingliederungshilfe"
* $OrganizationType#juvenileDetentionCenter "Jugendstrafanstalt"
* $OrganizationType#majorEvent "Großveranstaltung"
* $OrganizationType#nightclub "Diskothek"
//* $OrganizationType#otherFacility "Sonstige Einrichtung"
* $OrganizationType#pharmacy "Apotheke"
* $OrganizationType#professionalSchool  "Berufsschule"
* $OrganizationType#prostitutionIndustryEstab "Einrichtung des Prostitutionsgewerbes"
* $OrganizationType#publicHealthServiceEstab "Einrichtung des öffentlichen Gesundheitsdienstes"
* $OrganizationType#publicHealthSystemEstab "Einrichtung des öffentlichen Gesundheitswesens"
* $OrganizationType#retirementHomeWithoutService "Altenwohnheim"
* $OrganizationType#retirementHomeWithService "Altenheim"
* $OrganizationType#saunaWellnessFacility "Sauna- und Wellnessanlage"
* $OrganizationType#sea "Sonstige Einrichtung mit relevanter Wasser Aerosolierung"
* $OrganizationType#sewageTreatmentPlant "Kläranlage"
* $OrganizationType#sportsLeisureRecreationFacility "Sport- Freizeit- und Erholungsanlage"
* $OrganizationType#substituteImprisonmentPenalInstitution   "Vollzugsanstalt für Ersatzfreiheitsstrafe"
* $OrganizationType#swimmingBathingArea "Schwimm- und Badestelle"
* $OrganizationType#tanningSalon "Sonnenstudio"
* $OrganizationType#testCenter "Teststelle"
* $OrganizationType#university "Hochschule"
* $OrganizationType#wasteDisposalFacility "Abfallbeseitigungsanlage"
* $OrganizationType#womenShelter "Frauenhaus"
* $OrganizationType#workplace "Arbeitsstätte"