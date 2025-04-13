import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

export default defineConfig({
  plugins: [
    vue(),
  ],
  server: {
    host: '0.0.0.0',
    proxy: {
      '/api/v1': {
        target: 'http://localhost:8082', //API服务器的地址
        changeOrigin: true,
        ws: true,
      },
    }
  },
})
