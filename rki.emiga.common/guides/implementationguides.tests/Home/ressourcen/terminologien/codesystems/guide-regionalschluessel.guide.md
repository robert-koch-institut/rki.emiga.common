---
topic: RegionKeys
canonical: urn:de:bund:destatis:bevoelkerungsstatistik:schluessel:rs_2025-09-30
---

# {{page-title}}
## Beschreibung
<fql output= "inline" headers="false">
from 
    CodeSystem
where
    url = %canonical
select
    description
</fql>
<br>&nbsp;<br>

### Metadaten
<fql output="transpose" headers="true">
from
	CodeSystem
where
	url = %canonical
select
	CanonicalURL: url, Status: status, Version: version, Herausgeber: publisher
</fql>
<br>&nbsp;<br>
