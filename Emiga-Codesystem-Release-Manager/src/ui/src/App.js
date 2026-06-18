import React, { useEffect, useState } from 'react';
import Dashboard from './components/Dashboard';
import Login from './components/Login';
import './App.css';

function App() {
  const [theme, setTheme] = useState('system');

  useEffect(() => {
    const savedTheme = localStorage.getItem('settings.theme') || 'system';
    setTheme(savedTheme);
  }, []);

  useEffect(() => {
    const resolvedTheme =
      theme === 'system'
        ? window.matchMedia?.('(prefers-color-scheme: dark)').matches
          ? 'dark'
          : 'light'
        : theme;

    document.documentElement.classList.remove('theme-light', 'theme-dark');
    document.documentElement.classList.add(`theme-${resolvedTheme}`);
  }, [theme]);

  const handleThemeChange = (nextTheme) => {
    localStorage.setItem('settings.theme', nextTheme);
    setTheme(nextTheme);
  };

  return (
    <div className="app-shell">
      {/* ...existing app shell content... */}
      <Dashboard theme={theme} onThemeChange={handleThemeChange} />
    </div>
  );
}

export default App;
