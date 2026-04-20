# Remix [![Version](https://img.shields.io/badge/version-2.16-3992ff)](https://github.com/stackblaze-templates/remix) [![Maintained by StackBlaze](https://img.shields.io/badge/maintained%20by-StackBlaze-blue)](https://stackblaze.com) [![Weekly Updates](https://img.shields.io/badge/updates-weekly-green)](https://github.com/stackblaze-templates/remix/actions) [![Deploy on StackBlaze](https://img.shields.io/badge/Deploy%20on-StackBlaze-orange)](https://stackblaze.com)

<p align="center"><img src="logo.png" alt="Remix" width="120"></p>

A full-stack React framework by Shopify with nested routing, progressive enhancement, and SSR.

> **Credits**: Built on [Remix](https://remix.run) by [Shopify](https://github.com/remix-run). All trademarks belong to their respective owners.

## Deploy on StackBlaze

[![Deploy on StackBlaze](https://img.shields.io/badge/Deploy%20on-StackBlaze-orange)](https://stackblaze.com)

## Local Development

**With Docker (recommended):**

```bash
docker compose up
```

**Without Docker:**

```bash
npm install
npm run dev
```

## Production Security

> ⚠️ Review these settings before deploying to production.

This template ships with sensible security defaults:

- **HTTP security headers** — `Content-Security-Policy`, `X-Frame-Options`, `X-Content-Type-Options`, `Referrer-Policy`, and `Permissions-Policy` are set on every document response via `app/root.tsx`.
- **`NODE_ENV=production`** — set automatically by the Dockerfile and `docker-compose.yml`; ensure it is also set in your hosting environment.
- **Non-root Docker container** — the production image runs as an unprivileged user (`remixuser`, UID 1001).
- **Multi-stage Docker build** — build tooling is not present in the final image.

### Environment variables

| Variable | Required | Description |
|---|---|---|
| `NODE_ENV` | Yes | Set to `production` in all production environments. |
| `SESSION_SECRET` | If using sessions | Secret used to sign session cookies. Use a long random string; never commit a real value. |

> **Never commit real secrets to source control.** Use your hosting provider's secrets management or a `.env` file that is listed in `.gitignore`.

### Content Security Policy

The default CSP (`app/root.tsx`) includes `'unsafe-inline'` for `script-src` because Remix's hydration payload uses an inline `<script>` tag. For stricter security in production, replace the static CSP with a [nonce-based strategy](https://remix.run/docs/en/main/guides/csp).

---

### Maintained by [StackBlaze](https://stackblaze.com)

This template is actively maintained by StackBlaze. We perform **weekly automated checks** to ensure:

- **Up-to-date dependencies** — frameworks, libraries, and base images are kept current
- **Security scanning** — continuous monitoring for known vulnerabilities and CVEs
- **Best practices** — configurations follow current recommendations from upstream projects

Found an issue? [Open a ticket](https://github.com/stackblaze-templates/remix/issues).
