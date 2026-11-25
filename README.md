# Tofu DNS

![DNS](https://img.shields.io/badge/DNS-00599C?style=flat-square)

![OpenTofu](https://img.shields.io/badge/OpenTofu-FFDA18?style=for-the-badge&logo=opentofu&logoColor=black)
![Latest Release](https://img.shields.io/github/v/release/themakunga/tofu-dns?style=for-the-badge&color=success)

<!-- mtoc-start -->

- [English](#english)
  - [Overview](#overview)
  - [Dependencies](#dependencies)
  - [Usage](#usage)
  - [Repository Workflow (GitFlow)](#repository-workflow-gitflow)
- [Español](#español)
  - [Descripción](#descripción)
  - [Dependencias](#dependencias)
  - [Uso](#uso)
  - [Flujo de Repositorio (GitFlow)](#flujo-de-repositorio-gitflow)

<!-- mtoc-end -->

[English](#english) | [Español](#español)

---

## English

### Overview

This repository contains the declarative configuration for managing my domain names and DNS records as Code (IaC). It uses **OpenTofu** (the open-source fork of Terraform) to automate, version-control, and safely provision DNS infrastructure across providers (e.g., Cloudflare, Route53).

### Dependencies

Before working with this repository, ensure you have the following installed and configured:

- [OpenTofu](https://opentofu.org/) (`tofu`)
- Valid API tokens for your DNS provider(s) exported securely as environment variables (e.g., `CLOUDFLARE_API_TOKEN`).

**Installation on Debian/Ubuntu:**

```bash
# It is recommended to follow the official OpenTofu repository installation script
curl --proto '=https' --tlsv1.2 -fsSL https://get.opentofu.org/install-opentofu.sh -o install-opentofu.sh
chmod +x install-opentofu.sh
./install-opentofu.sh --install-method deb
```

**Installation on macOS (via Homebrew):**

```bash
brew install opentofu
```

**Installation on Arch Linux:**

```bash
sudo pacman -S opentofu
```

### Usage

To apply or test changes to the DNS infrastructure locally:

**1. Initialize OpenTofu:**
Downloads the necessary provider plugins and sets up the backend state.

```bash
tofu init
```

**2. Preview the changes:**
Generates an execution plan to show exactly what records will be created, modified, or deleted.

```bash
tofu plan
```

**3. Apply the configuration:**
Executes the planned changes to the DNS provider.

```bash
tofu apply
```

### Repository Workflow (GitFlow)

This repository enforces a strict, automated GitFlow architecture using GitHub Rulesets:

1. **`develop` branch:** The integration branch. All new DNS records and modifications go here first. CI pipelines typically run `tofu validate`, `tofu fmt`, and generate a speculative `tofu plan`.
2. **Release Train:** Triggering the **Start Release** workflow from GitHub Actions creates a `release/v*` branch and opens a Pull Request to `main`.
3. **`main` branch:** Protected production branch. Merging the PR applies the infrastructure changes (if automated via GitOps) and triggers the **Semantic Release** pipeline, which tags the current configuration state, generates the `CHANGELOG.md`, and creates the GitHub Release.

---

## Español

### Descripción

Este repositorio contiene la configuración declarativa para gestionar mis nombres de dominio y registros DNS como Código (IaC). Utiliza **OpenTofu** (el fork de código abierto de Terraform) para automatizar, versionar y aprovisionar de forma segura la infraestructura DNS en diferentes proveedores (ej. Cloudflare, Route53).

### Dependencias

Antes de trabajar con este repositorio, asegúrate de tener lo siguiente instalado y configurado:

- [OpenTofu](https://opentofu.org/) (`tofu`)
- Tokens de API válidos para los proveedores DNS exportados de manera segura como variables de entorno (ej. `CLOUDFLARE_API_TOKEN`).

**Instalación en Debian/Ubuntu:**

```bash
# Se recomienda seguir el script oficial de instalación de OpenTofu
curl --proto '=https' --tlsv1.2 -fsSL https://get.opentofu.org/install-opentofu.sh -o install-opentofu.sh
chmod +x install-opentofu.sh
./install-opentofu.sh --install-method deb
```

**Instalación en macOS (vía Homebrew):**

```bash
brew install opentofu
```

**Instalación en Arch Linux:**

```bash
sudo pacman -S opentofu
```

### Uso

Para aplicar o probar cambios en la infraestructura DNS de forma local:

**1. Inicializar OpenTofu:**
Descarga los plugins necesarios de los proveedores y configura el estado (backend).

```bash
tofu init
```

**2. Previsualizar los cambios:**
Genera un plan de ejecución para mostrar exactamente qué registros se crearán, modificarán o eliminarán.

```bash
tofu plan
```

**3. Aplicar la configuración:**
Ejecuta los cambios planificados en el proveedor DNS.

```bash
tofu apply
```

### Flujo de Repositorio (GitFlow)

Este repositorio impone una arquitectura estricta y automatizada mediante Rulesets de GitHub:

1. **Rama `develop`:** La rama de integración. Todos los nuevos registros DNS y modificaciones van aquí primero. Los pipelines de CI generalmente ejecutan `tofu validate`, `tofu fmt` y un `tofu plan` especulativo.
2. **Tren de Lanzamiento:** Al ejecutar el workflow **Start Release** desde GitHub Actions, se crea una rama `release/v*` y se abre un Pull Request hacia `main`.
3. **Rama `main`:** Rama de producción protegida. Al fusionar (merge) el PR se aplican los cambios de infraestructura (si está automatizado vía GitOps) y se dispara el pipeline de **Semantic Release**, el cual etiqueta el estado actual de la configuración, genera el `CHANGELOG.md` y crea el Release oficial en GitHub.

## Repository reference

| Path                           | Purpose                     |
| ------------------------------ | --------------------------- |
| [`main.tf`](main.tf)           | Infrastructure declarations |
| [`providers.tf`](providers.tf) | Project configuration       |
| [`variables.tf`](variables.tf) | Input declarations          |
| [`output.tf`](output.tf)       | Project configuration       |

The default branch is `main`. Use the tracked manifests and scripts above
when preparing changes; keep local credentials and generated files out of commits.
