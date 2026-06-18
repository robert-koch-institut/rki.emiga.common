const API_BASE = 'http://localhost:5000';

async function handleResponse(response) {
  if (!response.ok) {
    const body = await response.json().catch(() => null);
    throw new Error(body?.detail || 'Request failed');
  }
  return response.json();
}

export async function login(username, password) {
  const response = await fetch(`${API_BASE}/api/v1/auth/login`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ username, password }),
  });
  return handleResponse(response);
}

export async function signup(username, password) {
  const response = await fetch(`${API_BASE}/api/v1/auth/signup`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ username, password }),
  });
  return handleResponse(response);
}

export async function fetchResources(token) {
  const response = await fetch(`${API_BASE}/api/v1/resources`, {
    headers: { Authorization: `Bearer ${token}` },
  });
  return handleResponse(response);
}

export async function fetchFshCodeSystems(token) {
  const response = await fetch(`${API_BASE}/api/v1/fsh-codesystems`, {
    headers: { Authorization: `Bearer ${token}` },
  });
  return handleResponse(response);
}

export async function importFshCodeSystem(token, resourceId) {
  const response = await fetch(`${API_BASE}/api/v1/fsh-codesystems/import/${resourceId}`, {
    method: 'POST',
    headers: {
      Authorization: `Bearer ${token}`,
      'Content-Type': 'application/json',
    },
  });
  return handleResponse(response);
}

export async function updateResource(token, resourceId, data) {
  const response = await fetch(`${API_BASE}/api/v1/resources/${resourceId}`, {
    method: 'PUT',
    headers: {
      Authorization: `Bearer ${token}`,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(data),
  });
  return handleResponse(response);
}

export async function logout(token) {
  try {
    await fetch(`${API_BASE}/api/v1/auth/logout`, {
      method: 'POST',
      headers: { Authorization: `Bearer ${token}` },
    });
  } catch (err) {
    // ignore network errors; still clear client state
    console.warn('logout API failed', err);
  }
}