const API_BASE = 'http://localhost:5000';

export async function login(username, password) {
  const response = await fetch(`${API_BASE}/api/v1/auth/login`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ username, password }),
  });

  if (!response.ok) {
    const body = await response.json().catch(() => null);
    throw new Error(body?.detail || 'Unable to authenticate');
  }

  return response.json();
}

export async function fetchResources(token) {
  const response = await fetch(`${API_BASE}/api/v1/resources`, {
    headers: {
      Authorization: `Bearer ${token}`,
    },
  });

  if (!response.ok) {
    const body = await response.json().catch(() => null);
    throw new Error(body?.detail || 'Unable to fetch resources');
  }

  return response.json();
}