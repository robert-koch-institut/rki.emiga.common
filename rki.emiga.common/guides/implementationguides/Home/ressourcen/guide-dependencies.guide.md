## {{page-title}}


<table id="dependencies-table" style="border: 1px solid #e0e0e0; width: 100%; position: relative; display: table !important; font-family: 'Open Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 1.42857; margin-bottom: 10px; border-collapse: collapse;">
    <thead>
        <tr style="background-color: #e8e8e8; color: black;">
            <th style="padding: 10px; text-align: left; border: 1px solid #e0e0e0;">Package</th>
            <th style="padding: 10px; text-align: left; border: 1px solid #e0e0e0;">Version</th>
        </tr>
    </thead>
    <tbody>
        <!-- Rows will be populated by JavaScript -->
    </tbody>
</table>

<script>
    // Example script to populate the table dynamically
    const dependencies = {
        "hl7.fhir.r4.core": "4.0.1",
        "de.basisprofil.r4": "1.5.3",
        "rki.demis.disease": "2.2.2",
        "rki.demis.common": "2.2.1"        
    };

    const tableBody = document.querySelector('#dependencies-table tbody');
    for (const [name, version] of Object.entries(dependencies)) {
        const row = `<tr>
                        <td style="padding: 10px; border: 1px solid #e0e0e0;">${name}</td>
                        <td style="padding: 10px; border: 1px solid #e0e0e0;">${version}</td>
                    </tr>`;
        tableBody.innerHTML += row;
    }
</script>
