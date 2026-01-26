**feat:** Update code in meta.security[ResourceVisibilityType] to match new VS  
Examples/BundleCollection.json  
**feat:** Tighten cardinality to must (1..1) on Bundle.type element  
StructureDefinitions/AnnotationBundle.json  
**feat:** Iterate Profile version  
StructureDefinitions/PersonenTransactionBundle.json  
StructureDefinitions/PersonenTransactionResponseBundle.json  
**feat:** Remove EMIGA Prefix from Bundles and Example  
Examples/BundleTransactionCreatePerson.json  
StructureDefinitions/PersonenTransactionBundle.json  
StructureDefinitions/PersonenTransactionResponseBundle.json  
**fix:** Update Examples with new code: legalGuardian, display: Sorgeberechtigte Person  
Examples/BundleTransactionCreatePerson.json  
Examples/RelatedPerson-4551.json  
**feat:** Add code for "Sorgeberechtigte Person", remove previous codes  
CodeSystem/RelatedPersonRelationshipType.json  
**feat:** Update VS Binding to new VS name  
StructureDefinitions/AffectedPersonRelatedPerson.json  
**feat:** Adjust Examples with new code  
Examples/BundleTransactionCreatePerson.json  
Examples/RelatedPerson-4551.json  
**feat:** Add new code for "Sorgeberechtigte Person"  
CodeSystem/RelatedPersonRelationshipType.json  
**fix:** Typo in display value  
Examples/Patient-AffectedPerson-4550.json  
**fix:** remove _family and _given values, remove extension HumanNameDe, remove  _line.value, remove extension AddressDe, add address.state  
StructureDefinition-AnnotationCommunication.json  
Examples/Patient-AffectedPerson-4550.json  
**fix:** remove _family and _given values, remove extension HumanNameDe, remove  _line.value, add address.state  
Examples/Patient-AffectedPerson-4551.json  
**feat:** Add MS to address.state  
StructureDefinitions/AffectedPerson.json  
**feat:** fix bundle.type = collection, iterate profile.version  
StructureDefinitions/AnnotationBundle.json  
**feat:** Update Examples with new code from VS AnnotaionResourceVisibility Type  
Examples/BundleTransactionCreate.json  
Examples/Communication-441557618.json  
Examples/DocumentReference-441557619.json  
Examples/DocumentReference-441557620.json  
Examples/FillingNoteResponse.json  
**feat:** Add binding to new ValueSet AnnotationResourceVisibilityType on Profiles  
StructureDefinitions/AdditionalPropertiesQuestionnaire.json  
StructureDefinitions/AdditionalPropertiesQuestionnaireResponse.json  
StructureDefinitions/AnnotationCommunication.json  
StructureDefinitions/AttachmentDocumentReference.json  
**feat:** Add ValueSetS f├╝r Annotations - Additional Properties  
ValueSets/AnnotationResourceVisibilityType.json  
**feat:** Add SurvNet identifier in examples  
Examples/BundleCollection.json  
Examples/BundleTransactionCreate.json  
Examples/BundleTransactionCreatePerson.json  
Examples/Communication-441557618.json  
Examples/DocumentReference-441557619.json  
Examples/DocumentReference-441557620.json  
Examples/Patient-AffectedPerson-4550.json  
Examples/Patient-AffectedPerson-4551.json  
**feat:** Add codes, set codes deprecated  
CodeSystem/ResourceVisibilityType.json  
**feat:** Add Transaction Bundle Response  
StructureDefinitions/EMIGAPersonenTransactionResponseBundle.json  
**feat:** Cahnge Type to XX "Organization Identifier, (doc)nadd short and definition to MS Elements  
StructureDefinitions/IdentifierEmigaFileNumber.json  
StructureDefinitions/IdentifierEmigaID.json  
**feat:** Change Name and Cannonical of Bundle  
Examples/BundleTransactionCreatePerson.json  
StructureDefinitions/EMIGAPersonenTransactionBundle.json  
**feat:** Add SurvNet identifier and NamingSystem to all Profiles  
NamingSystem/SurvNetFileNumber.json  
StructureDefinitions/IdentifierSurvNetFileNumber.json  
rulesets.json  
**feat:** Remove unneeded Extension  
DeprecatedResources/ExtensionRelatedPersonLink.json  
Examples/BundleTransactionCreatePerson.json  
Examples/RelatedPerson-4551.json  
StructureDefinitions/AffectedPersonRelatedPerson.json  
**feat:** Add Example Bundle  
Examples/BundleTransactionCreatePerson.json  
**fix:** Add slice name to patient.link  
Examples/Patient-AffectedPerson-4551.json  
**fix:** slicing on patient.link.other  
StructureDefinitions/AffectedPerson.json  
**feat:** Loosen cardinality to extension to optional  
StructureDefinitions/AffectedPersonRelatedPerson.json  
**feat:** Add Personen Bundle  
StructureDefinitions/PersonenBundle.json  
**feat:** Add dependency to demis.disease 2.2.2-snapshots  
/sushi-config.yaml  
**feat:** Add Extension linkToRepresentedPerson to profile  
StructureDefinitions/AffectedPersonRelatedPerson.json  
**feat:** Add Extensions  
Extensions/ExtensionRegionalKey.json  
Extensions/ExtensionRelatedPersonLink.json  
**fix:** add url  
Extensions/ExtensionDateCreated.json  
Extensions/ExtensionFacilityAddressAffectedPerson.json  
Extensions/ExtensionNullFlavor.json  
Extensions/ExtensionProcessingStatus.json  
Extensions/ExtensionProcessingStatusAffectedPerson.json  
Extensions/ExtensionSalutation.json  
**feat:** Update Extension with modified VS CountryCodes  
Extensions/ExtensionLandOfBirth.json  
**feat:** Add extensions RegionalKey,Geolocation,FacilityAssosciation, update with new identifiers, EmigaID, EmihaFileNumber, update processingStatus to processingStatusAffectedPerson, add invariant on name.use=maidenname  
Examples/Patient-AffectedPerson-4550.json  
StructureDefinitions/AffectedPerson.json  
**feat:** Add new Identifiers, EmigaID, EmigaFileNumber  
Examples/BundleCollection.json  
Examples/BundleTransactionCreate.json  
Examples/Communication-441557618.json  
Examples/DocumentReference-441557619.json  
Examples/DocumentReference-441557620.json  
Questionnaire/FilingNote.json  
StructureDefinitions/AdditionalPropertiesQuestionnaire.json  
StructureDefinitions/AdditionalPropertiesQuestionnaireResponse.json  
StructureDefinitions/AnnotationCommunication.json  
StructureDefinitions/AttachmentDocumentReference.json  
**feat:** Add example  
Examples/RelatedPerson-4551.json  
**feat:** Add Type suffix  
CodeSystem/RelatedPersonRelationshipType.json  
**feat:** Add VS  
ValueSets/CommonLanguages.json  
**feat:** Rename VS and Add nullflavour Codes  
ValueSets/CountryCodes.json  
ValueSets/DeuevAnlage8CountryCodes.json  
**feat:** Add new Identifiers, EmigaID and EmigaFileNumber  
NamingSystem/EmigaFileNumber.json  
NamingSystem/EmigaID.json  
StructureDefinitions/IdentifierEmigaFileNumber.json  
StructureDefinitions/IdentifierEmigaID.json  
**feat:** Add VS and CS for Regional Keys  
CodeSystem/RegionKeys.json  
ValueSets/RegionKeys.json  
**feat:** Remove not needed resources  
CodeSystem/KeywordsGlobal.json  
CodeSystem/KeywordsLocal.json  
CodeSystem/MunicipalityKey.json  
Extensions/ExtensionCitizenship.json  
Extensions/ExtensionMunicipalityKey.json  
NamingSystem/EmigaAnnotationFileNumber.json  
NamingSystem/EmigaAnnotationId.json  
NamingSystem/EmigaAttachmentFileNumber.json  
NamingSystem/EmigaAttachmentId.json  
NamingSystem/FileNumberPatientId.json  
NamingSystem/ReferenceNumberPatientID.json  
NamingSystem/SurvNetAnnotationFileNumber.json  
NamingSystem/SurvNetAnnotationId.json  
StructureDefinitions/IdentifierEmigaAnnotationFileNumber.json  
StructureDefinitions/IdentifierEmigaAnnotationId.json  
StructureDefinitions/IdentifierEmigaAttachmentFileNumber.json  
StructureDefinitions/IdentifierEmigaAttachmentId.json  
StructureDefinitions/IdentifierFileNumberPatientId.json  
StructureDefinitions/IdentifierReferenceNumberPatientId.json  
StructureDefinitions/IdentifierSurvNetAnnotationFileNumber.json  
StructureDefinitions/IdentifierSurvNetAnnotationId.json  
**feat:** Rename CS to FacilityAssociationType  
CodeSystem/AssociationType.json  
CodeSystem/FacilityAssociationType.json  
**feat:** Add ruleset IdentifierCommon  
rulesets.json  
**feat:** Adjust Extension, add slicing and codeable concept  
Extensions/ExtensionFacilityAddressAffectedPerson.json  
**feat:** Rename Example file  
Examples/Patient-AffectedPerson-4550.json  
**feat:** Adjust Profile and Example to support the customized Extensions, add geolocation extension  
Examples/Patient.json  
StructureDefinitions/AffectedPerson.json  
**feat:** Add extension so to bind Processingstatus only for AffectedPerson  
Extensions/ExtensionProcessingStatusAffectedPerson.json  
**feat:** Loosen Cardinality on subextensions  
Extensions/ExtensionFacilityAddressAffectedPerson.json  
**feat:** Modify extensions to proprietary to be able to bind the German Base Profile CS and VS  
Extensions/ExtensionCitizenship.json  
Extensions/ExtensionLandOfBirth.json  
**feat:** Add RelatedPerson Profile  
StructureDefinitions/AffectedPersonRelatedPerson.json  
**feat:** Add CS and VS for RelatedPerson RelationshipTypes  
CodeSystem/RelatedPersonRelationshipType.json  
**feat:** Add VS for country codes including non existent countries  
ValueSets/DeuevAnlage8CountryCodes.json  
**feat:** Add VS for AffectedPerson ProcessingStatus Codes  
ValueSets/ProcessingStatusAffectedPersonVS.json  
**feat:** Rename CS and VS, adjust canonnicals  
CodeSystem/AssociationType.json  
**feat:** Add dependencies  
sushi-config.yaml  
**fix:** remove redundant invariant (exists in patient profile)  
StructureDefinitions/EmigaUserPractitioner.json  
**feat:** Move AffectedPerson example to common package  
Examples/Patient.json  
**feat:** Move affectedPerson relevant CodeSystem to common package  
CodeSystem/AssociationType.json  
CodeSystem/Salutation.json  
**feat:** Add NullFlavor ValueSet for "nicht ermittelbar/nicht erhoben" values  
ValueSets/NullFlavor.json  
**feat:** Move Patient Extensions to common package  
Extensions/ExtensionCitizenship.json  
Extensions/ExtensionFacilityAddressAffectedPerson.json  
Extensions/ExtensionNullFlavor.json  
Extensions/ExtensionSalutation.json  
**feat:** Move AffectedPerson Identifiers to common package  
NamingSystem/FileNumberPatientId.json  
NamingSystem/ReferenceNumberPatientID.json  
StructureDefinitions/IdentifierFileNumberPatientId.json  
StructureDefinitions/IdentifierReferenceNumberPatientId.json  
**feat:** Move AffectedPerson profile to common packe, adjust cannonical  
StructureDefinitions/AffectedPerson.json  
**feat:** Add meta.tag personalinformation  
Examples/DocumentReference-441557619.json  
Examples/DocumentReference-441557620.json  
StructureDefinitions/AttachmentDocumentReference.json  
