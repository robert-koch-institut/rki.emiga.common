import React, { useEffect, useState } from 'react';

const themeOptions = [
  { value: 'light', label: 'Light' },
  { value: 'dark', label: 'Dark' },
  { value: 'system', label: 'System Default' },
];

function Settings({ currentTheme, onThemeChange }) {
  const [theme, setTheme] = useState(currentTheme || 'system');
  const [notificationsEnabled, setNotificationsEnabled] = useState(true);
  const [compactMode, setCompactMode] = useState(false);

  useEffect(() => {
    setTheme(currentTheme || 'system');
  }, [currentTheme]);

  useEffect(() => {
    const storedNotifications = localStorage.getItem('settings.notificationsEnabled');
    const storedCompactMode = localStorage.getItem('settings.compactMode');

    if (storedNotifications !== null) {
      setNotificationsEnabled(storedNotifications === 'true');
    }
    if (storedCompactMode !== null) {
      setCompactMode(storedCompactMode === 'true');
    }
  }, []);

  const handleThemeChange = (event) => {
    const nextTheme = event.target.value;
    setTheme(nextTheme);
    localStorage.setItem('settings.theme', nextTheme);
    onThemeChange(nextTheme);
  };

  const toggleNotifications = () => {
    const next = !notificationsEnabled;
    setNotificationsEnabled(next);
    localStorage.setItem('settings.notificationsEnabled', next);
  };

  const toggleCompactMode = () => {
    const next = !compactMode;
    setCompactMode(next);
    localStorage.setItem('settings.compactMode', next);
  };

  return (
    <div className="settings-page">
      <h1>Settings</h1>

      <section className="settings-section">
        <h2>Appearance</h2>
        <p>Choose the theme for the app.</p>
        <label className="settings-field">
          Theme
          <select value={theme} onChange={handleThemeChange}>
            {themeOptions.map((option) => (
              <option key={option.value} value={option.value}>
                {option.label}
              </option>
            ))}
          </select>
        </label>
      </section>

      <section className="settings-section">
        <h2>Preferences</h2>
        <label className="settings-field checkbox-field">
          <input
            type="checkbox"
            checked={notificationsEnabled}
            onChange={toggleNotifications}
          />
          Enable notifications
        </label>

        <label className="settings-field checkbox-field">
          <input
            type="checkbox"
            checked={compactMode}
            onChange={toggleCompactMode}
          />
          Compact layout
        </label>
      </section>
    </div>
  );
}

export default Settings;