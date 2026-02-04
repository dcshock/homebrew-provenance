# Provenance Blockchain CLI — Homebrew Install Guide

This document describes how to install the **Provenance Blockchain CLI (`provenanced`)** using Homebrew, including what happens during the install process and how to interpret common output.

---

## Overview

Homebrew provides a convenient way to install and manage the Provenance CLI on macOS and Linux (via Linuxbrew).

This process:

- Uses a custom Homebrew **tap**
- Builds the CLI from source using `make build`
- Installs the `provenanced` binary into your Homebrew prefix
- Ensures reproducible, checksum-verified builds

---

## Prerequisites

- Homebrew installed  
  - macOS: `/opt/homebrew`  
  - Linuxbrew: `/home/linuxbrew/.linuxbrew`
- Command Line Tools installed (macOS)
- Internet access for the initial download

---

## Step 1: Add the Provenance Homebrew Tap

```bash
brew tap dcshock/provenance
```

### What this does

- Registers the tap `dcshock/provenance`
- Clones the tap repository locally
- Makes the `provenanced` formula available for installation

Local tap location:

```
/opt/homebrew/Library/Taps/dcshock/homebrew-provenance
```

---

## Step 2: Install the Provenance CLI

```bash
brew install provenanced
```

---

## What Happens During Installation

1. Downloads the Provenance source archive (v1.27.2)
2. Verifies the SHA-256 checksum
3. Creates an isolated build sandbox
4. Executes `make build`
5. Installs the resulting `provenanced` binary into the Homebrew Cellar
6. Removes temporary build artifacts

---

## Example Output

```
==> Fetching downloads for: provenanced
✔︎ Formula provenanced (1.27.2) Verified 4.8MB/4.8MB
==> Installing provenanced from dcshock/provenance
==> make build
🍺  /opt/homebrew/Cellar/provenanced/1.27.2: 7 files, 115.2MB, built in 24 seconds
```

---

## Verifying the Installation

```bash
provenanced version
```

or

```bash
which provenanced
```

Expected path:

```
/opt/homebrew/bin/provenanced
```

---

## File Locations

| Item | Location |
|------|----------|
| Formula | `/opt/homebrew/Library/Taps/dcshock/homebrew-provenance/Formula/provenanced.rb` |
| Binary | `/opt/homebrew/bin/provenanced` |
| Cellar | `/opt/homebrew/Cellar/provenanced/1.27.2/` |
| Build dir | `/var/tmp/provenanced-*` |

---

## Updating

```bash
brew update
brew upgrade provenanced
```

---

## Troubleshooting

```bash
brew install -v --debug --build-from-source provenanced
brew edit provenanced
brew info provenanced
```

---

## Summary

Homebrew is the recommended way to install the Provenance CLI, providing reproducible builds, clean upgrades, and consistent behavior across macOS and Linux.

