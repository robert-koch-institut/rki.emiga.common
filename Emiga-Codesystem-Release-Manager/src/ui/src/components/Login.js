import { useState } from 'react';
import { login, signup } from '../services/api';

export default function Login({ onLogin }) {
  const [isRegistering, setIsRegistering] = useState(false);
  const [username, setUsername] = useState('admin');
  const [password, setPassword] = useState('password123');
  const [confirmPassword, setConfirmPassword] = useState('');
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);

  const handleSubmit = async (event) => {
    event.preventDefault();
    setError('');
    setLoading(true);

    if (isRegistering && password !== confirmPassword) {
      setError('Passwords do not match');
      setLoading(false);
      return;
    }

    try {
      const auth = isRegistering
        ? await signup(username, password)
        : await login(username, password);

      onLogin(auth);
    } catch (err) {
      setError(err.message || 'Authentication failed');
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="login-container">
      <div className="login-card">
        <h1>{isRegistering ? 'Create account' : 'ECUM'}</h1>
        <p>
          {isRegistering
            ? 'Sign up to manage CodeSystem resources.'
            : 'EMIGA Codesystem Update Manager'}
        </p>

        <form onSubmit={handleSubmit}>
          <div className="form-group">
            <label htmlFor="username">Username</label>
            <input
              id="username"
              type="text"
              value={username}
              onChange={(e) => setUsername(e.target.value)}
              required
            />
          </div>

          <div className="form-group">
            <label htmlFor="password">Password</label>
            <input
              id="password"
              type="password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              required
            />
          </div>

          {isRegistering && (
            <div className="form-group">
              <label htmlFor="confirm-password">Confirm Password</label>
              <input
                id="confirm-password"
                type="password"
                value={confirmPassword}
                onChange={(e) => setConfirmPassword(e.target.value)}
                required
              />
            </div>
          )}

          <button type="submit" disabled={loading}>
            {loading ? 'Working...' : isRegistering ? 'Sign up' : 'Sign in'}
          </button>
        </form>

        <button
          type="button"
          className="btn btn-secondary"
          onClick={() => {
            setIsRegistering(!isRegistering);
            setError('');
          }}
          style={{ width: '100%', marginTop: '1rem' }}
        >
          {isRegistering ? 'Back to login' : 'Create new account'}
        </button>

        <div className="hint">
          {isRegistering ? (
            <strong>After signing up, you will be logged in automatically.</strong>
          ) : (
            <>
              <strong>Demo Credentials:</strong>
              admin / password123<br />
              editor / editor1
            </>
          )}
        </div>

        {error && <div className="error">{error}</div>}
      </div>
    </div>
  );
}