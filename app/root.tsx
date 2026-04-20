import type { HeadersFunction } from "@remix-run/node";
import { Links, Meta, Outlet, Scripts } from "@remix-run/react";

export const headers: HeadersFunction = () => ({
  // Restrict resource loading to the same origin. 'unsafe-inline' for scripts
  // is required by Remix's server-side hydration payload; replace with a nonce
  // strategy when stricter CSP is needed in production.
  "Content-Security-Policy":
    "default-src 'self'; script-src 'self' 'unsafe-inline'; style-src 'self' 'unsafe-inline'; img-src 'self' data:; font-src 'self'; connect-src 'self';",
  "X-Frame-Options": "DENY",
  "X-Content-Type-Options": "nosniff",
  "Referrer-Policy": "strict-origin-when-cross-origin",
  "Permissions-Policy": "camera=(), microphone=(), geolocation=()",
});

export default function App() {
  return (<html lang="en"><head><meta charSet="utf-8" /><Meta /><Links /></head><body><Outlet /><Scripts /></body></html>);
}
