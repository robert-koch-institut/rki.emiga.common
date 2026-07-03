ValueSet: PersonOrganizationTypeVS
Id: PersonOrganizationTypeVS
Title: "Werteliste für die die Personen-zu-Organisation-Zuordnung."
Description: "Enthält alle Organisationen für die Personen-zu-Organisation-Zuordnung. Es kombiniert die Value Sets für Krankenhäuser und generische Organisationen, ausgenommen davon sind ÖGD-Organisationen (GA, LB, RKI, BW)."
* insert MetadataTerminology
* ^version = "0.2.0"
* ^date = "2026-07-03"
* ^url = "https://emiga.rki.de/fhir/ValueSet/PersonOrganizationTypeVS"

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


* $OrganizationType#sepFedAut "Oberste Bundesbehörde"


* $OrganizationType#hiFedAut "Bundesoberbehörde"


* $OrganizationType#fedInsti "Bundesanstalt"

* $OrganizationType#supFedStaAut "Oberste Landesbehörde"


* $OrganizationType#otherAutFed "Sonstige Behörde auf Bundesebene"

* $OrganizationType#otherAutState "Sonstige Behörde auf Landesebene"


* $OrganizationType#intOrg "Internationale Organisation"

* $OrganizationType#resFacility "Forschungseinrichtung"


* $OrganizationType#otherOrg "sonstige Einrichtung"


* $OrganizationType#transport "Transport"

* $OrganizationType#airport "Flughafen"

* $OrganizationType#harbor "Hafen"

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