import React from 'react';

export default function About() {
  return (
    <div className="panel about-panel">
      <h2><div className="panel-icon">ℹ️</div>About ECRM</h2>

      <p><strong>Emiga Codesystem Release Manager (ECRM)</strong> — prototype release manager for FHIR CodeSystem changes.</p>

      <section className="about-section">
        <h3>Purpose</h3>
        <p>Automate FSH → SUSHI → FHIR JSON → packaging and optional publish workflows. Provide a SPA for authorized users to edit, validate, version and prepare CodeSystem releases.</p>
      </section>

      <section className="about-section">
        <h3>How it works</h3>
        <ol>
          <li>Users import or edit FSH CodeSystems in the UI.</li>
          <li>Backend stores user-scoped resources and supports validation.</li>
          <li>CI can run SUSHI, build packages and publish artifacts.</li>
        </ol>
      </section>

      <section className="about-section">
        <h3>Key features</h3>
        <ul>
          <li>User-scoped resource workspaces</li>
          <li>Import from local fsh-generated/resources</li>
          <li>Validation, edit and local persistence (SQLite)</li>
          <li>CI packaging and publish hooks</li>
        </ul>
      </section>

      <section className="about-section">
        <h3>Notes</h3>
        <p>The app is a prototype. Production requires proper auth, audit trails, and secure CI secret management.</p>
      </section>
    </div>
  );
}