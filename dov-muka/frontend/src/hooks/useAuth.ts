import { create } from 'zustand'
import api from '../services/api'

interface User {
  id: number
  email: string
  username: string
  full_name: string
  role: string
}

interface AuthState {
  user: User | null
  token: string | null
  login: (username: string, password: string) => Promise<void>
  logout: () => void
  loadUser: () => Promise<void>
}

export const useAuth = create<AuthState>((set) => ({
  user: null,
  token: localStorage.getItem('access_token'),

  login: async (username, password) => {
    const { data } = await api.post('/auth/login', { username, password })
    localStorage.setItem('access_token', data.access_token)
    localStorage.setItem('refresh_token', data.refresh_token)
    set({ token: data.access_token })
    await useAuth.getState().loadUser()
  },

  logout: () => {
    localStorage.removeItem('access_token')
    localStorage.removeItem('refresh_token')
    set({ user: null, token: null })
  },

  loadUser: async () => {
    try {
      const { data } = await api.get('/auth/me')
      set({ user: data })
    } catch {
      set({ user: null, token: null })
    }
  },
}))
