import { useState } from 'react';
import Login from './components/Login';
import Dashboard from './components/Dashboard';
import './App.css';

function App() {
  const storedToken = localStorage.getItem('ecum_token') || '';
  const storedUser = JSON.parse(localStorage.getItem('ecum_user') || 'null');

  const [token, setToken] = useState(storedToken);
  const [user, setUser] = useState(storedUser);

  const handleLogin = (auth) => {
    localStorage.setItem('ecum_token', auth.access_token);
    localStorage.setItem('ecum_user', JSON.stringify({ username: auth.username, role: auth.role }));
    setToken(auth.access_token);
    setUser({ username: auth.username, role: auth.role });
  };

  const handleLogout = () => {
    localStorage.removeItem('ecum_token');
    localStorage.removeItem('ecum_user');
    setToken('');
    setUser(null);
  };

  return (
    <div className="app-shell">
      {token ? (
        <Dashboard token={token} user={user} onLogout={handleLogout} />
      ) : (
        <Login onLogin={handleLogin} />
      )}
    </div>
  );
}

export default App;
