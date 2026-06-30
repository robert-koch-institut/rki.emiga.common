import React, { useEffect, useState } from 'react';
import { fetchResources, fetchFshCodeSystems, importFshCodeSystem, updateResource, logout as apiLogout } from '../services/api';
import Settings from './Settings';
import About from './About';

export default function Dashboard({ token, user, onLogout, theme, onThemeChange, timezone, onTimezoneChange }) {
  const [resources, setResources] = useState([]);
  const [loading, setLoading] = useState(true);
  const [validationResult, setValidationResult] = useState(null);
  const [validatingId, setValidatingId] = useState(null);
  const [editingResource, setEditingResource] = useState(null);
  const [editForm, setEditForm] = useState({ name: '', status: '', version: '', url: '' });
  const [error, setError] = useState('');
  const [fshCodeSystems, setFshCodeSystems] = useState([]);
  const [selectedFshId, setSelectedFshId] = useState('');
  const [importing, setImporting] = useState(false);
  const [activeTab, setActiveTab] = useState('dashboard');
  const [localTime, setLocalTime] = useState(() => formatTime(new Date(), timezone));

  useEffect(() => {
    loadResources();
    loadFshCodeSystems();
  }, [token]);

  useEffect(() => {
    const updateClock = () => setLocalTime(formatTime(new Date(), timezone));
    updateClock();
    const timer = setInterval(updateClock, 1000);
    return () => clearInterval(timer);
  }, [timezone]);

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

  const loadFshCodeSystems = async () => {
    try {
      const list = await fetchFshCodeSystems(token);
      setFshCodeSystems(list);
    } catch (err) {
      console.warn('Unable to load FSH codesystems', err);
    }
  };

  const handleImportCodeSystem = async () => {
    if (!selectedFshId) {
      setError('Select a CodeSystem first');
      return;
    }
    setError('');
    setImporting(true);
    try {
      const imported = await importFshCodeSystem(token, selectedFshId);
      setResources((prev) => [...prev, imported]);
      setSelectedFshId('');
    } catch (err) {
      setError(err.message || 'Unable to import CodeSystem');
    } finally {
      setImporting(false);
    }
  };

  const handleSignOut = async () => {
    try {
      await apiLogout(token);
    } catch (e) {
      console.warn('Logout error', e);
    }
    onLogout();
  };

  const handleEdit = (resource) => {
    setEditingResource(resource.id);
    setEditForm({
      name: resource.name,
      status: resource.status,
      version: resource.version,
      url: resource.url,
    });
    setValidationResult(null);
  };

  const handleCancelEdit = () => {
    setEditingResource(null);
    setEditForm({ name: '', status: '', version: '', url: '' });
  };

  const handleSave = async () => {
    if (!editingResource) return;
    setError('');
    try {
      const existing = resources.find((r) => r.id === editingResource);
      const updated = await updateResource(token, editingResource, {
        id: editingResource,
        name: editForm.name,
        status: editForm.status,
        version: editForm.version,
        url: editForm.url,
        concepts: existing?.concepts || [],
      });
      setResources((prev) =>
        prev.map((resource) => (resource.id === editingResource ? updated : resource))
      );
      setEditingResource(null);
    } catch (err) {
      setError(err.message || 'Unable to save resource');
    }
  };

  const getStatusBadge = (status) => `badge-${status}`;

  const tabInfo = {
    dashboard: {
      title: 'Dashboard',
      subtitle: 'Manage and validate FHIR CodeSystem resources',
    },
    resources: {
      title: 'Resources',
      subtitle: 'View and manage imported CodeSystem resources',
    },
    releases: {
      title: 'Releases',
      subtitle: 'Prepare and review release packages',
    },
    settings: {
      title: 'Settings',
      subtitle: 'Personalize your preferences and appearance',
    },
    about: {
      title: 'About',
      subtitle: 'Learn more about ECRM and how it works',
    },
  };

  const currentTab = tabInfo[activeTab] || tabInfo.dashboard;

  return (
    <div className="dashboard">
      <div className="dashboard-sidebar">
        <div className="sidebar-logo">ECRM</div>

        <nav className="sidebar-nav">
          <button type="button" className={activeTab==='dashboard'?'active':''} onClick={()=>setActiveTab('dashboard')}>📊 Dashboard</button>
          <button type="button" className={activeTab==='resources'?'active':''} onClick={()=>setActiveTab('resources')}>📋 Resources</button>
          <button type="button" className={activeTab==='releases'?'active':''} onClick={()=>setActiveTab('releases')}>📦 Releases</button>
          <button type="button" className={activeTab==='settings'?'active':''} onClick={()=>setActiveTab('settings')}>⚙️ Settings</button>
          <button type="button" className={activeTab==='about'?'active':''} onClick={()=>setActiveTab('about')}>ℹ️ About</button>
        </nav>

        <div className="sidebar-user">
          <div className="user-info"><div className="user-name">{user?.username}</div><div className="user-role">{user?.role}</div></div>
          <button type="button" className="logout-btn" onClick={handleSignOut}>Sign Out</button>
        </div>
      </div>

      <div className="dashboard-content">
        <div className="dashboard-header">
          <div>
            <h1>{currentTab.title}</h1>
            <p>{currentTab.subtitle}</p>
          </div>
          <div className="time-display">
            <div>{localTime}</div>
            <small>{timezone}</small>
          </div>
        </div>

        {activeTab === 'settings' ? (
          <Settings currentTheme={theme} onThemeChange={onThemeChange} currentTimezone={timezone} onTimezoneChange={onTimezoneChange} user={user} />
        ) : activeTab === 'about' ? (
          <About />
        ) : (
          <>
            {error && <div className="panel" style={{ background: '#fef2f2', borderLeft: '4px solid #dc2626' }}><strong style={{ color: '#dc2626' }}>⚠️ Error:</strong> {error}</div>}

            <div className="panel">
              <h2><div className="panel-icon">🔎</div>Select CodeSystem to Import</h2>
              <div className="form-group">
                <label>Choose a CodeSystem</label>
                <select value={selectedFshId} onChange={(e)=>setSelectedFshId(e.target.value)} style={{ width:'100%' }}>
                  <option value="">Select a CodeSystem</option>
                  {fshCodeSystems.map((item)=> (<option key={item.id} value={item.id}>{item.name || item.id} — {item.version || 'no version'}</option>))}
                </select>
              </div>
              <div style={{ marginTop:'1rem' }}>
                <button className="btn btn-primary" onClick={handleImportCodeSystem} disabled={!selectedFshId || importing}>{importing ? 'Importing…' : 'Import selected CodeSystem'}</button>
              </div>
            </div>

            <div className="panel">
              <h2><div className="panel-icon">📋</div>CodeSystem Resources</h2>
              {loading ? <div className="empty-state"><p>Loading resources...</p></div> : resources.length===0 ? <div className="empty-state"><div>No resources</div></div> : (
                <table className="resource-table"><thead><tr><th>ID</th><th>Name</th><th>Status</th><th>Version</th><th>Concepts</th><th>Actions</th></tr></thead>
                  <tbody>{resources.map((resource)=>(
                    <tr key={resource.id}>
                      <td><strong>{resource.id}</strong></td>
                      <td>{resource.name}</td>
                      <td><span className={`resource-badge ${getStatusBadge(resource.status)}`}>{resource.status}</span></td>
                      <td>{resource.version}</td>
                      <td>{resource.concepts?.length || 0}</td>
                      <td><div className="action-buttons"><button className="btn btn-primary" onClick={()=>{}}>✓ Validate</button><button className="btn btn-secondary" onClick={()=>handleEdit(resource)}>✎ Edit</button></div></td>
                    </tr>
                  ))}</tbody>
                </table>
              )}
            </div>

            {editingResource && (
              <div className="panel">
                <h2><div className="panel-icon">✎</div>Edit Resource</h2>
                <div className="form-group"><label>Name</label><input value={editForm.name} onChange={(e)=>setEditForm({...editForm, name: e.target.value})} /></div>
                <div className="form-group"><label>Status</label><input value={editForm.status} onChange={(e)=>setEditForm({...editForm, status: e.target.value})} /></div>
                <div className="form-group"><label>Version</label><input value={editForm.version} onChange={(e)=>setEditForm({...editForm, version: e.target.value})} /></div>
                <div className="form-group"><label>URL</label><input value={editForm.url} onChange={(e)=>setEditForm({...editForm, url: e.target.value})} /></div>
                <div style={{ marginTop:'1rem' }}><button className="btn btn-primary" onClick={handleSave}>Save Changes</button><button className="btn btn-secondary" onClick={handleCancelEdit} style={{ marginLeft: '0.6rem' }}>Cancel</button></div>
              </div>
            )}
          </>
        )}
      </div>
    </div>
  );
}

function formatTime(date, tz) {
  return new Intl.DateTimeFormat('en-GB', {
    timeZone: tz,
    hour12: false,
    weekday: 'short',
    month: 'short',
    day: 'numeric',
    hour: '2-digit',
    minute: '2-digit',
    second: '2-digit',
  }).format(date);
}

function formatTimezoneLabel(timezone) {
  const date = new Date();
  const formatted = new Intl.DateTimeFormat('en-GB', {
    timeZone: timezone,
    timeZoneName: 'shortOffset',
  }).format(date);

  const match = formatted.match(/GMT([+-]\d{1,2})(?::?(\d{2}))?/);
  if (!match) return timezone;

  const hours = match[1].padStart(3, '0');
  const minutes = match[2] ? match[2].padStart(2, '0') : '00';
  return `UTC${hours}:${minutes} ${timezone}`;
}