Template Registries
Get Started
* [Installation](../../docs/setup/installation)
* [Podman](../../docs/setup/podman)
* [LXC Container Setup](../../docs/guides/lxc-container)
* [Migrate to 1.0](../../docs/setup/migrate-v1)
* [Next Builds](../../docs/setup/next-images)
Security
* [Verify Artifacts](../../docs/security/verify-artifacts)
* [Socket Proxy Setup](../../docs/setup/socket-proxy)
Configuration
* [Environment Variables](../../docs/configuration/environment)
* [Appearance](../../docs/configuration/appearance)
* [Notifications](../../docs/configuration/notifications)
* [OIDC Single Sign-On](../../docs/configuration/sso)
* [Analytics](../../docs/configuration/analytics)
Networking
* [HTTP Proxy](../../docs/configuration/proxy)
* [Websocket Configuration](../../docs/configuration/websockets-reverse-proxies)
* [TLS and HTTP/2](../../docs/configuration/tls)
Features
* [Projects](../../docs/features/projects)
* [Containers](../../docs/features/containers)
* [Images](../../docs/features/images)
* [Image Builds](../../docs/features/image-builds)
* [Volumes](../../docs/features/volumes)
* [Networks](../../docs/features/networks)
* [Vulnerability Scans](../../docs/features/vulnerability-scans)
* [Remote Environments](../../docs/features/environments)
* [Auto Updates](../../docs/guides/updates)
* [Custom Metadata](../../docs/guides/custom-metadata)
* [Using Templates](../../docs/templates)
* [Template Registries](../../docs/templates/registries)
* [Docker Swarm](../../docs/features/swarm)
Guides
* [Buildables](../../docs/guides/buildables)
* [GPU Monitoring Setup](../../docs/guides/gpu-setup)
CLI
* [Installation](../../docs/cli/install)
* [Configuration](../../docs/cli/config)
Development
* [Contributing to Arcane](../../docs/dev/contribute)
* [Translating Arcane](../../docs/dev/translate)
Community
* [Discord ](https://discord.gg/WyXYpdyV3Z)
A template registry is a JSON file on the internet that tells Arcane which templates are available and where to download them.
## Quick Setup
### 1. Create the registry file
Create a JSON file that lists your templates. If you use a code editor, include the `$schema` field so it can help you spot mistakes:
`&#123;
"$schema": "https://github.com/getarcaneapp/arcane-templates/schema.json",
"name": "My Company Templates",
"description": "Docker templates for internal applications",
"version": "1.0.0",
"author": "Your Team",
"url": "https://github.com/yourcompany/docker-templates",
"templates": [
&#123;
"id": "internal-app",
"name": "Internal Application",
"description": "Company application stack with database",
"version": "1.0.0",
"author": "DevOps Team",
"compose\_url": "https://raw.githubusercontent.com/yourcompany/docker-templates/main/internal-app/docker-compose.yml",
"env\_url": "https://raw.githubusercontent.com/yourcompany/docker-templates/main/internal-app/.env.example",
"documentation\_url": "https://github.com/yourcompany/docker-templates/tree/main/internal-app",
"tags": ["internal", "webapp", "postgres"]
&#125;
]
&#125;
`
### 2. Host your files
* **Option A: GitHub (recommended)**
1. Create a GitHub repository
2. Add your `registry.json` file
3. Add template directories with `docker-compose.yml` files
4. Use raw GitHub URLs for file access
5. **Option B: Web server**
* Host `registry.json` on any web server
* Make sure it uses HTTPS
* Turn on CORS if your setup needs it ### 3. Template file structure
For each template, create a directory with:
`docker-templates/
└── your-template/
├── docker-compose.yml
├── .env.example
└── README.md
`
## Registry JSON Reference
The registry must match the Arcane Templates Registry Schema:
* Schema ID: `https://github.com/getarcaneapp/arcane-templates/schema.json`
* JSON Schema Draft: 07
* No extra fields are allowed beyond the ones listed below ### Top-level fields
* Optional:
* `$schema`: URL to the registry schema (recommended for tooling)
* Required:
* `name`: Registry display name (string)
* `description`: Brief description (string)
* `version`: Registry version (semver)
* `author`: Registry maintainer (string)
* `url`: Repository or homepage URL (URI)
* `templates`: Array of template objects (min 1) ### Template object fields
* Required:
* `id`: Unique slug (lowercase, hyphens only)
* `name`: Display name (string)
* `description`: Detailed description (string)
* `version`: Template version (semver)
* `author`: Template author (string)
* `compose\_url`: Direct URL to docker-compose.yml (URI)
* `env\_url`: Direct URL to .env.example (URI)
* `documentation\_url`: URL to template docs/README (URI)
* `tags`: Array of slugs (lowercase, hyphens; min 1; unique)
* Additional properties are not allowed ## Example Repository Structure
`docker-templates/
├── registry.json
├── wordpress/
│ ├── docker-compose.yml
│ ├── .env.example
│ └── README.md
├── nextcloud/
│ ├── docker-compose.yml
│ ├── .env.example
│ └── README.md
└── nginx-proxy/
├── docker-compose.yml
└── README.md
`
## Testing Your Registry
1. Validate JSON syntax and schema (Draft 07) against `https://github.com/getarcaneapp/arcane-templates/schema.json`
2. Test URLs: ensure all file URLs are accessible (HTTPS)
3. Add to Arcane: Settings → Templates → Add Registry
4. Verify: templates appear and download correctly
5. Ensure no extra properties exist beyond the schema ## Best Practices
### Template quality
* Use specific image tags (not `latest`)
* Include health checks
* Add restart policies
* Document required environment variables
* Test templates before publishing ### Registry management
* Version your templates and registry (semantic versioning)
* Keep documentation current
* Regular updates and maintenance
* Monitor for security updates ### Security
* Use HTTPS for all URLs
* Validate environment variable examples
* Don't include sensitive data in examples
* Consider image security scanning ## GitHub Example
Here is a minimal GitHub setup:
1. **Create repository:** `my-docker-templates`
2. **Add registry.json:**
`&#123;
"$schema": "https://github.com/getarcaneapp/arcane-templates/schema.json",
"name": "My Templates",
"description": "Custom Docker templates",
"version": "1.0.0",
"author": "Acme Corp",
"url": "https://github.com/username/my-docker-templates",
"templates": [
&#123;
"id": "wordpress",
"name": "WordPress",
"description": "Production-ready WordPress with MariaDB and health checks.",
"version": "1.2.3",
"author": "Acme Corp",
"compose\_url": "https://raw.githubusercontent.com/username/my-docker-templates/main/wordpress/docker-compose.yml",
"env\_url": "https://raw.githubusercontent.com/username/my-docker-templates/main/wordpress/.env.example",
"documentation\_url": "https://raw.githubusercontent.com/username/my-docker-templates/main/wordpress/README.md",
"tags": ["cms", "php", "wordpress"]
&#125;
]
&#125;
`
3. **Registry URL:** `https://raw.githubusercontent.com/username/my-docker-templates/main/registry.json` ## Community registry
Don't want to maintain your own? Contribute to our community registry:
**GitHub:** [https://github.com/getarcaneapp/templates](https://github.com/getarcaneapp/templates)
Submit pull requests to add your templates to the community collection!
## Troubleshooting
**Registry not loading?**
* Check the JSON for mistakes and validate it against the schema
* Make sure the URL works and uses HTTPS
* Turn on CORS if you are using a custom domain
* Confirm there are no extra fields in the file
**Templates not downloading?**
* Check that all download links point to real files
* Make sure the files exist at the URLs you listed
* Check file permissions
* Look for errors in your browser