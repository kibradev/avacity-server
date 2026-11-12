import { defineConfig } from "vite"
import react from "@vitejs/plugin-react"
import legacy from "@vitejs/plugin-legacy"

export default defineConfig({
  plugins: [
    react(),
    legacy({
      targets: ["defaults", "not dead", "ie 11", "chrome >= 40", "safari >= 8"],
      renderLegacyChunks: true,
      modernPolyfills: true,
      polyfills: true,
    }),
  ],
  build: { outDir: "dist", emptyOutDir: true },
  server: { proxy: { "/api": "http://127.0.0.1", "/auth": "http://127.0.0.1" } },
})
