import React, { useEffect, useState } from 'react';
import './App.css';
import Login from './components/Login';
import Dashboard from './components/Dashboard';
import Particles from './Particles';

function App() {
  const [auth, setAuth] = useState(() => {
    const token = localStorage.getItem('ecrm_token');
    const userJson = localStorage.getItem('ecrm_user');
    let user = null;
    if (userJson) {
      try {
        user = JSON.parse(userJson);
      } catch { }
    }
    return token ? { token, user } : { token: null, user: null };
  });

  const [theme, setTheme] = useState(() => localStorage.getItem('ecrm_theme') || 'dark');
  const [timezone, setTimezone] = useState(() => localStorage.getItem('ecrm_timezone') || Intl.DateTimeFormat().resolvedOptions().timeZone || 'UTC');

  useEffect(() => {
    document.documentElement.setAttribute('data-theme', theme);
    localStorage.setItem('ecrm_theme', theme);
  }, [theme]);

  useEffect(() => {
    localStorage.setItem('ecrm_timezone', timezone);
  }, [timezone]);

  const handleLogin = ({ access_token, username, role }) => {
    const user = { username, role };
    localStorage.setItem('ecrm_token', access_token);
    localStorage.setItem('ecrm_user', JSON.stringify(user));
    setAuth({ token: access_token, user });
  };

  const handleLogout = () => {
    localStorage.removeItem('ecrm_token');
    localStorage.removeItem('ecrm_user');
    setAuth({ token: null, user: null });
  };

  const handleThemeChange = (newTheme) => setTheme(newTheme);
  const handleTimezoneChange = (newTimezone) => setTimezone(newTimezone);

  return (
    <>
      <Particles
        particleColors={["#a9a1a1"]}
        particleCount={200}
        particleSpread={10}
        speed={0.1}
        particleBaseSize={100}
        moveParticlesOnHover={false}
        alphaParticles={false}
        disableRotation={false}
        pixelRatio={1}

      />
      <div className="app-content">
        {auth.token ? (
          <Dashboard
            token={auth.token}
            user={auth.user}
            onLogout={handleLogout}
            theme={theme}
            onThemeChange={handleThemeChange}
            timezone={timezone}
            onTimezoneChange={handleTimezoneChange}
          />
        ) : (
          <Login onLogin={handleLogin} />
        )}
      </div>
    </>
  );
}

export default App;
