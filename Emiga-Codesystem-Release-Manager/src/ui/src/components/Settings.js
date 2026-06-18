import React, { useEffect, useState } from 'react';

export default function Settings({ currentTheme, onThemeChange }) {
  const [theme, setTheme] = useState(currentTheme || 'light');

  const change = (t) => {
    setTheme(t);
    onThemeChange && onThemeChange(t);
  };

  return (
    <div className="panel">
      <h2><div className="panel-icon">⚙️</div>Settings</h2>

      <div className="form-group" style={{ marginTop: '1rem' }}>
        <label>Theme</label>
        <div style={{ display: 'flex', gap: '0.5rem', marginTop: '0.5rem' }}>
          <button
            className={`btn ${theme === 'light' ? 'btn-primary' : 'btn-secondary'}`}
            onClick={() => change('light')}
          >
            Light
          </button>
          <button
            className={`btn ${theme === 'dark' ? 'btn-primary' : 'btn-secondary'}`}
            onClick={() => change('dark')}
          >
            Dark
          </button>
        </div>
        <p style={{ color: 'var(--muted)', marginTop: '0.5rem' }}>
          Switch between light and dark UI. Preference is saved in browser.
        </p>
      </div>

      {/* future settings can be added here */}
    </div>
  );
}