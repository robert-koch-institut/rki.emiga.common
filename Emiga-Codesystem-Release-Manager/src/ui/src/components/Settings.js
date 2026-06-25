import React, { useEffect, useState } from 'react';

const DEFAULT_SETTINGS = {
  fullName: '',
  email: '',
  language: 'English',
  timezone: 'UTC',
  notifications: {
    releaseAlerts: true,
    validationResults: true,
    systemUpdates: false,
  },
  preferences: {
    autoSaveEdits: true,
    compactLayout: false,
    showValidationHints: true,
  },
  theme: 'dark',
};

export default function Settings({ currentTheme, onThemeChange, user }) {
  const [settings, setSettings] = useState(DEFAULT_SETTINGS);
  const [status, setStatus] = useState('');

  useEffect(() => {
    const stored = localStorage.getItem('ecrm_settings');
    if (stored) setSettings((prev) => ({ ...prev, ...JSON.parse(stored) }));
  }, []);

  useEffect(() => {
    if (currentTheme) setSettings((prev) => ({ ...prev, theme: currentTheme }));
  }, [currentTheme]);

  const updateField = (field, value) => setSettings((prev) => ({ ...prev, [field]: value }));
  const updateNested = (section, field, value) => setSettings((prev) => ({ ...prev, [section]: { ...prev[section], [field]: value } }));

  const handleThemeChange = (theme) => { onThemeChange?.(theme); updateField('theme', theme); };
  const handleSave = (e) => { e.preventDefault(); localStorage.setItem('ecrm_settings', JSON.stringify(settings)); setStatus('Settings saved'); setTimeout(() => setStatus(''), 2200); };

  return (
    <div className="panel settings-panel">
      <h2><div className="panel-icon">⚙️</div>Settings</h2>
      <form onSubmit={handleSave}>
        <section className="settings-section">
          <h3>Account</h3>
          <div className="form-group"><label>Username</label><input type="text" value={user?.username || ''} disabled /></div>
          <div className="form-group"><label>Full name</label><input value={settings.fullName} onChange={(e) => updateField('fullName', e.target.value)} /></div>
          <div className="form-group"><label>Email address</label><input type="email" value={settings.email} onChange={(e) => updateField('email', e.target.value)} /></div>
        </section>

        <section className="settings-section">
          <h3>Appearance</h3>
          <div className="form-group">
            <label>Theme</label>
            <div style={{ display: 'flex', gap: 8, marginTop: 6 }}>
              <button type="button" className={`btn ${settings.theme === 'light' ? 'btn-primary' : 'btn-secondary'}`} onClick={() => handleThemeChange('light')}>Light</button>
              <button type="button" className={`btn ${settings.theme === 'dark' ? 'btn-primary' : 'btn-secondary'}`} onClick={() => handleThemeChange('dark')}>Dark</button>
            </div>
          </div>
          <div className="form-group"><label>Language</label><select value={settings.language} onChange={(e) => updateField('language', e.target.value)}><option>English</option><option>Deutsch</option><option>Español</option><option>Français</option></select></div>
          <div className="form-group"><label>Timezone</label><input value={settings.timezone} onChange={(e) => updateField('timezone', e.target.value)} /></div>
        </section>

        <section className="settings-section">
          <h3>Notifications</h3>
          <div className="form-group"><label><input type="checkbox" checked={settings.notifications.releaseAlerts} onChange={(e) => updateNested('notifications', 'releaseAlerts', e.target.checked)} /> Release alerts</label></div>
          <div className="form-group"><label><input type="checkbox" checked={settings.notifications.validationResults} onChange={(e) => updateNested('notifications', 'validationResults', e.target.checked)} /> Validation result notifications</label></div>
          <div className="form-group"><label><input type="checkbox" checked={settings.notifications.systemUpdates} onChange={(e) => updateNested('notifications', 'systemUpdates', e.target.checked)} /> System update messages</label></div>
        </section>

        <section className="settings-section">
          <h3>Preferences</h3>
          <div className="form-group"><label><input type="checkbox" checked={settings.preferences.autoSaveEdits} onChange={(e) => updateNested('preferences', 'autoSaveEdits', e.target.checked)} /> Auto-save edits</label></div>
          <div className="form-group"><label><input type="checkbox" checked={settings.preferences.compactLayout} onChange={(e) => updateNested('preferences', 'compactLayout', e.target.checked)} /> Use compact layout</label></div>
          <div className="form-group"><label><input type="checkbox" checked={settings.preferences.showValidationHints} onChange={(e) => updateNested('preferences', 'showValidationHints', e.target.checked)} /> Show validation hints</label></div>
        </section>

        <button type="submit" className="btn btn-primary">Save settings</button>
        {status && <div className="hint" style={{ marginTop: 8 }}>{status}</div>}
      </form>
    </div>
  );
}