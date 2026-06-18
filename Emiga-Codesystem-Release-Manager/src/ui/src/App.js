import React, { useEffect, useState } from 'react';
import Dashboard from './components/Dashboard';
import Login from './components/Login';
import './App.css';

function App() {
  const [auth, setAuth] = useState(() => {
    const token = localStorage.getItem('ecum_token');
    const userJson = localStorage.getItem('ecum_user');
    let user = null;

    if (userJson) {
      try {
        user = JSON.parse(userJson);
      } catch {
        user = null;
      }
    }

    return token ? { token, user } : { token: null, user: null };
  });

  // theme state persisted in localStorage
  const [theme, setTheme] = useState(() => localStorage.getItem('ecum_theme') || 'light');

  useEffect(() => {
    document.documentElement.setAttribute('data-theme', theme);
    localStorage.setItem('ecum_theme', theme);
  }, [theme]);

  const handleLogin = ({ access_token, username, role }) => {
    const user = { username, role };
    localStorage.setItem('ecum_token', access_token);
    localStorage.setItem('ecum_user', JSON.stringify(user));
    setAuth({ token: access_token, user });
  };

  const handleLogout = () => {
    localStorage.removeItem('ecum_token');
    localStorage.removeItem('ecum_user');
    setAuth({ token: null, user: null });
  };

  const handleThemeChange = (newTheme) => {
    setTheme(newTheme);
  };

  return auth.token ? (
    <Dashboard
      token={auth.token}
      user={auth.user}
      onLogout={handleLogout}
      theme={theme}
      onThemeChange={handleThemeChange}
    />
  ) : (
    <Login onLogin={handleLogin} />
  );
}

export default App;
