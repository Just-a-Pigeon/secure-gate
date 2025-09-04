import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import tailwindcss from "@tailwindcss/vite";
import mkcert from 'vite-plugin-mkcert';
import path from 'path';
import { fileURLToPath } from 'url';
// ignored cuz issue with package
// @ts-ignore
import eslint from 'vite-plugin-eslint'

const __filename = fileURLToPath(import.meta.url)
const __dirname = path.dirname(__filename)

// https://vite.dev/config/
export default defineConfig({
    resolve: {
        alias: {
            '@': path.resolve(__dirname, 'src')
        }
    },
    server: {
        port: 5173,
        proxy: {
            '/api': {
                target: 'https://localhost:5168',
                changeOrigin: true,
                secure: false,
                xfwd: true
            }
        }
    },
    build: {
        outDir: '../SecureGate.Api/wwwroot',
        emptyOutDir: true,
        chunkSizeWarningLimit: 2000
    },
    plugins: [mkcert(), vue(), tailwindcss(), eslint({
        include: "src/**/*.{ts,tsx,vue}",
        fix: true
    })
    ],
})