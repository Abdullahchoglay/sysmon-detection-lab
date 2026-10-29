# Sysmon Threat Detection and Incident Response Lab

> Status: Build in progress. Results are not claimed until linked evidence is marked verified.

## Overview

This project extends the existing [Home SOC Lab](https://github.com/Abdullahchoglay/home-soc-lab) with Sysmon telemetry, Wazuh detections, and incident-response investigations. It intentionally does not repeat the original lab's Wazuh installation, endpoint enrollment, FIM, failed-logon, or PowerShell Event ID 4104 work.

## Objectives

- Deploy Microsoft Sysmon from an official source and verify its signature and hash.
- Forward `Microsoft-Windows-Sysmon/Operational` through the existing Wazuh agent.
- Validate process, network, file, parent-child, command-line, and hash telemetry.
- Test custom Wazuh rules with harmless, uniquely marked activity.
- Publish only sanitized evidence supporting each verified claim.

## Architecture

```mermaid
flowchart LR
  A[Windows 11 endpoint] -->|Sysmon Operational channel| B[Wazuh agent 4.14.7]
  B -->|TCP 1514 via localhost NAT forwarding| C[Wazuh manager VM]
  C --> D[Wazuh indexer]
  D --> E[Wazuh dashboard]
```

## Current verified state

| Item | Result |
|---|---|
| Windows endpoint | Windows 11 Home, build 26200 |
| Wazuh agent | 4.14.7, service running |
| Agent transport | Established localhost TCP connection to port 1514 |
| Wazuh VM | Running in VirtualBox, 8 GB RAM, 2 vCPU, NAT |
| Sysmon before deployment | Not installed; Operational channel absent |
| Host free space at preflight | 5.7 GB — operational constraint |
| Sysmon package | Version 15.22; Microsoft signatures verified locally |
| Sysmon configuration | Sysmon Modular balanced 15.21 profile; release checksum verified |

## Verified local results

- Event ID 1 captured marked `cmd.exe` and PowerShell execution with command lines, hashes, process GUIDs, parent fields, company metadata, and integrity level.
- Event ID 3 captured both sides of a loopback-only TCP connection and associated them with the responsible PowerShell process GUID.
- Event ID 11 captured a marked text file in `C:\SysmonLab\` after a narrow lab-specific include was applied.
- The Sysmon and Wazuh services remained running and automatic after deployment, and the agent retained its established port 1514 connection.

Wazuh ingestion and custom-rule alert results are not claimed yet because manager access has not been completed.

## Repository layout

- `config/` — pinned Sysmon configuration and attribution
- `rules/` — custom Wazuh rules
- `detections/` — detection logic and analyst guidance
- `investigations/` — scenario reports
- `evidence/` — sanitized, text-first evidence summaries
- `docs/` — architecture, build, reproduction, troubleshooting, and evidence index
- `scripts/` — safe test and validation helpers
- `screenshots/` — reviewed screenshots only

## Safety and scope

All activity is restricted to systems owned by the project author. Tests create benign markers, text files, local process chains, and local network traffic. This is a learning lab, not a production monitoring design.

## Limitations

- The host began with limited free disk space; event volume and index growth must be monitored.
- The balanced configuration targets Sysmon 15.21 and is being used as a compatible pinned starting point for Sysmon 15.22. Runtime configuration acceptance must be verified before this becomes a completed result.
- Screenshots, live rule IDs, severity levels, and indexed events will be documented only after direct verification.
