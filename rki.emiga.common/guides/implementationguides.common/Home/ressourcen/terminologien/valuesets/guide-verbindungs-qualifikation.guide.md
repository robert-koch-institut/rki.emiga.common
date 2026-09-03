---
topic: FacilityAssociationTypeVS
canonical: https://emiga.rki.de/fhir/ValueSet/FacilityAssociationTypeVS
---

# {{page-title}}
## Beschreibung
<fql output= "inline" headers="false">
from 
    ValueSet
where
    url = %canonical
select
    description
</fql>
<br>&nbsp;<br>

<div id="rendered-codesystem">
    {{render:https://emiga.rki.de/fhir/ValueSet/FacilityAssociationTypeVS}}
</div>

<style>
  /* Entferne äußere Umrandung */
  #rendered-codesystem {
      border: none;
      padding: 0;
      margin: 0;
  }

  /* Tabelle formatieren */
  #rendered-codesystem table {
      border-collapse: collapse;
      width: auto;  /* Passt die Breite an den Inhalt an */
      border: 1px solid #d3d3d3;  /* Dünne, graue Umrandung der gesamten Tabelle */
  }

  /* Zellen formatieren */
  #rendered-codesystem th, 
  #rendered-codesystem td {
      padding: 8px 12px;  /* Weniger Innenabstand für kompakte Darstellung */
      text-align: left;
      border: 1px solid #d3d3d3;  /* Dünne Linien zwischen den Zellen */
      font-family: Arial, sans-serif;
      font-size: 14px;
  }

  /* Kopfzeile formatieren */
  #rendered-codesystem thead th {
      background-color: #f7f7f7;  /* Hellgrauer Hintergrund für die Kopfzeile */
      color: black;
      border: 1px solid #d3d3d3;
      font-weight: bold;
  }

  /* Dritte Spalte ausblenden, falls vorhanden */
  #rendered-codesystem td:nth-child(3), 
  #rendered-codesystem th:nth-child(3) {
      display: none;
  }
</style>
<br>&nbsp;<br>

## Inhalt
<tabs>
<tab= title="Darstellung">{{tree, buttons}} </tab>
<tab title="XML">{{xml}}</tab>
<tab title="JSON">{{json}}</tab>
<tab title="Link">{{link}}</tab>
</tabs>
<br>&nbsp;<br>