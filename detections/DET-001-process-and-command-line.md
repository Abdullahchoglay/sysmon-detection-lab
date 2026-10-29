# DET-001/002/005/006 — Process and command-line telemetry

## Objective

Validate Sysmon Event ID 1 for process creation, PowerShell execution, a suspicious-looking benign argument, parent-child relationships, and executable hashes.

## Data source

`Microsoft-Windows-Sysmon/Operational`, Event ID 1.

## Detection approach

Custom rules `100200`–`100203` use the unique `SYSMON-LAB-*` marker, PowerShell image path, and simulated encoded-command text. The rules are prepared but are not reported as live Wazuh alerts until manager-side validation is captured.

## ATT&CK mapping

- T1059.001 — PowerShell
- T1059.003 — Windows Command Shell
- T1027 — Obfuscated/Compressed Files and Information, used only as an analytical mapping for the simulated encoded-command indicator

## Analyst guidance

Review the command line, image hash, company, process GUID, parent process GUID, parent image, user context, and integrity level. A suspicious flag alone is not proof of malicious execution; examine whether encoded content exists and what it decodes to.
