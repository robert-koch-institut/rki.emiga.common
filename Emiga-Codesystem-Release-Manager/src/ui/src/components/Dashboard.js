import { useEffect, useState } from 'react';
import { fetchResources } from '../services/api';

export default function Dashboard({ token, user, onLogout }) {
  const [resources, setResources] = useState([]);
  const [loading, setLoading] = useState(true);
  const [validationResult, setValidationResult] = useState(null);
  const [validatingId, setValidatingId] = useState(null);
  const [error, setError] = useState('');

  useEffect(() => {
    loadResources();
  }, [token]);

  const loadResources = async () => {
    setLoading(true);
    setError('');

    try {
      const items = await fetchResources(token);
      setResources(items);
    } catch (err) {
      setError(err.message || 'Failed to load resources');
    } finally {
      setLoading(false);
    }
  };

  const handleValidate = async (resource) => {
    setError('');
    setValidatingId(resource.id);

    try {
      const response = await fetch('http://localhost:5000/validate', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          resource: {
            ...resource,
            resourceType: 'CodeSystem',
            concept: resource.concepts,
          },
        }),
      });

      if (!response.ok) {
        const body = await response.json();
        throw new Error(body.detail || 'Validation failed');
      }

      const payload = await response.json();
      setValidationResult(payload);
    } catch (err) {
      setError(err.message || 'Validation request failed');
    } finally {
      setValidatingId(null);
    }
  };

  const getStatusBadge = (status) => {
    return `badge-${status}`;
  };

  const getSeverityClass = (severity) => {
    return severity?.toLowerCase() || 'info';
  };

  return (
    <div className="dashboard">
      {/* SIDEBAR */}
      <div className="dashboard-sidebar">
        <div className="sidebar-logo">
          🏥 EMIGA TUM
        </div>
        
        <nav className="sidebar-nav">
          <a href="#dashboard" className="active">📊 Dashboard</a>
          <a href="#resources">📋 Resources</a>
          <a href="#releases">📦 Releases</a>
          <a href="#settings">⚙️ Settings</a>
        </nav>

        <div className="sidebar-user">
          <div className="user-info">
            <div className="user-name">{user?.username}</div>
            <div className="user-role">{user?.role}</div>
          </div>
          <button className="logout-btn" onClick={onLogout}>
            Sign Out
          </button>
        </div>
      </div>

      {/* MAIN CONTENT */}
      <div className="dashboard-content">
        <div className="dashboard-header">
          <h1>Dashboard</h1>
          <p>Manage and validate FHIR CodeSystem resources</p>
        </div>

        {error && <div className="panel" style={{ background: '#fef2f2', borderLeft: '4px solid #dc2626' }}>
          <strong style={{ color: '#dc2626' }}>⚠️ Error:</strong> {error}
        </div>}

        {/* RESOURCES PANEL */}
        <div className="panel">
          <h2>
            <div className="panel-icon">📋</div>
            CodeSystem Resources
          </h2>

          {loading ? (
            <div className="empty-state">
              <div className="loading-spinner"></div>
              <p style={{ marginTop: '1rem' }}>Loading resources...</p>
            </div>
          ) : resources.length === 0 ? (
            <div className="empty-state">
              <div className="empty-state-icon">📭</div>
              <div className="empty-state-title">No resources found</div>
              <div className="empty-state-text">Start by creating a new CodeSystem</div>
            </div>
          ) : (
            <table className="resource-table">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Name</th>
                  <th>Status</th>
                  <th>Version</th>
                  <th>Concepts</th>
                  <th>Actions</th>
                </tr>
              </thead>
              <tbody>
                {resources.map((resource) => (
                  <tr key={resource.id}>
                    <td><strong>{resource.id}</strong></td>
                    <td>{resource.name}</td>
                    <td>
                      <span className={`resource-badge ${getStatusBadge(resource.status)}`}>
                        {resource.status}
                      </span>
                    </td>
                    <td>{resource.version}</td>
                    <td>{resource.concepts?.length || 0}</td>
                    <td>
                      <div className="action-buttons">
                        <button
                          className="btn btn-primary"
                          onClick={() => handleValidate(resource)}
                          disabled={validatingId === resource.id}
                        >
                          {validatingId === resource.id ? '⊙ Validating' : '✓ Validate'}
                        </button>
                      </div>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          )}
        </div>

        {/* VALIDATION RESULT PANEL */}
        {validationResult && (
          <div className="panel">
            <h2>
              <div className="panel-icon">✓</div>
              Validation Result
            </h2>

            <div className="validation-result">
              <h3>Resource: <strong>{validationResult.resource_id}</strong></h3>
              <div className="validation-stats">
                <div className="stat">
                  <span className="stat-label">Status</span>
                  <span className={`stat-value ${validationResult.valid ? 'success' : 'error'}`}>
                    {validationResult.valid ? '✓ Valid' : '✗ Invalid'}
                  </span>
                </div>
                <div className="stat">
                  <span className="stat-label">Total Issues</span>
                  <span className="stat-value">{validationResult.issues_count}</span>
                </div>
                <div className="stat">
                  <span className="stat-label">Errors</span>
                  <span className={`stat-value ${validationResult.errors_count > 0 ? 'error' : 'success'}`}>
                    {validationResult.errors_count}
                  </span>
                </div>
                <div className="stat">
                  <span className="stat-label">Warnings</span>
                  <span className={`stat-value ${validationResult.warnings_count > 0 ? 'warning' : 'success'}`}>
                    {validationResult.warnings_count}
                  </span>
                </div>
              </div>
            </div>
          </div>
        )}
      </div>
    </div>
  );
}