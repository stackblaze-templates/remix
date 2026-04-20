# syntax=docker/dockerfile:1

# ── Stage 1: build ────────────────────────────────────────────────────────────
FROM node:22-slim AS builder

WORKDIR /app

COPY package*.json ./
RUN npm ci --ignore-scripts

COPY . .
RUN npm run build

# Remove dev dependencies so the production install is clean
RUN npm ci --omit=dev --ignore-scripts

# ── Stage 2: production ───────────────────────────────────────────────────────
FROM node:22-slim AS production

ENV NODE_ENV=production

WORKDIR /app

# Create a non-root user/group and own the workdir
RUN addgroup --system --gid 1001 remixgroup \
    && adduser --system --uid 1001 --ingroup remixgroup remixuser \
    && chown -R remixuser:remixgroup /app

# Copy only the production artefacts from the builder stage
COPY --from=builder --chown=remixuser:remixgroup /app/node_modules ./node_modules
COPY --from=builder --chown=remixuser:remixgroup /app/build ./build
COPY --from=builder --chown=remixuser:remixgroup /app/package.json ./package.json

USER remixuser

EXPOSE 3000

HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
    CMD node -e "require('http').get('http://localhost:3000/', (r) => { process.exit(r.statusCode === 200 ? 0 : 1) }).on('error', () => process.exit(1))"

CMD ["node_modules/.bin/remix-serve", "./build/server/index.js"]
