import React, { useMemo, useState } from 'react';
import resourcesIcon from '../images/icons/resources.png';
import emptyStateIcon from '../images/icons/empty-state.png';

export default function Resources({ resources = [], loading }) {
  const [search, setSearch] = useState('');

  const filteredResources = useMemo(() => {
    if (!search) return resources;
    const query = search.toLowerCase();
    return resources.filter((item) => {
      return (
        item.id?.toLowerCase().includes(query) ||
        item.name?.toLowerCase().includes(query) ||
        item.status?.toLowerCase().includes(query) ||
        item.version?.toLowerCase().includes(query)
      );
    });
  }, [resources, search]);

  return (
    <div className="panel resources-panel">
      <div className="panel-heading" style={{ display: 'flex', alignItems: 'center', gap: '0.85rem', marginBottom: '1rem' }}>
        <img src={resourcesIcon} alt="Resources" style={{ width: 24, height: 24 }} />
        <div>
          <h2>Resources</h2>
          <p style={{ margin: 0, color: 'var(--muted)' }}>
            Browse all imported CodeSystem resources and search by name, ID, status, or version.
          </p>
        </div>
      </div>

      <div className="form-group" style={{ marginBottom: '1rem' }}>
        <label htmlFor="resource-search">Search resources</label>
        <input
          id="resource-search"
          type="text"
          placeholder="Search by name, id, status, version"
          value={search}
          onChange={(e) => setSearch(e.target.value)}
        />
      </div>

      {loading ? (
        <div className="empty-state">
          <div className="loading-spinner" />
          <p style={{ marginTop: '1rem' }}>Loading resources...</p>
        </div>
      ) : filteredResources.length === 0 ? (
        <div className="empty-state">
          <img
            src={emptyStateIcon}
            alt="No resources"
            className="empty-state-icon"
            style={{ width: 48, height: 48 }}
          />
          <div className="empty-state-title">No resources found</div>
          <div className="empty-state-text">Use the Dashboard tab to import CodeSystem resources first.</div>
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
            </tr>
          </thead>
          <tbody>
            {filteredResources.map((resource) => (
              <tr key={resource.id}>
                <td><strong>{resource.id}</strong></td>
                <td>{resource.name}</td>
                <td>
                  <span className={`resource-badge ${resource.status ? `badge-${resource.status}` : ''}`}>
                    {resource.status}
                  </span>
                </td>
                <td>{resource.version}</td>
                <td>{resource.concepts?.length || 0}</td>
              </tr>
            ))}
          </tbody>
        </table>
      )}
    </div>
  );
}