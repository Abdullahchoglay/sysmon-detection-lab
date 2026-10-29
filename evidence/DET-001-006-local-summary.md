# DET-001 through DET-006 — Sanitized local evidence

Test marker: `SYSMON-LAB-20261029-175405`  
Test start: `2026-10-29T17:54:05.3938730+02:00` / `2026-10-29T15:54:05.3938730Z`

Personal username and endpoint hostname fields are omitted. Raw events remain local and git-ignored.

## Process and parent-child events

| Event | Local time | Record | Image | Parent | Rule name |
|---:|---|---:|---|---|---|
| 1 | 17:54:05.700 +02:00 | 48 | `cmd.exe` | `powershell.exe` | T1059.003 Windows Command Shell |
| 1 | 17:54:06.866 +02:00 | 57 | `powershell.exe` | `powershell.exe` | T1059.001 PowerShell |

The marked `cmd.exe` command line was:

```text
cmd.exe /c echo SYSMON-LAB-20261029-175405
```

Relevant `cmd.exe` metadata:

- Process GUID: `{f1afc63f-6c1d-6ae3-f311-000000003800}`
- Parent process GUID: `{f1afc63f-6bdd-6ae3-e011-000000003800}`
- SHA-256: `15CD209C995B7D3009C91CA40892D5B8F1FB162F3E5F10716642EA278E8E0D7B`
- Company: Microsoft Corporation
- Integrity: High

The harmless suspicious-looking PowerShell string was:

```text
SYSMON-LAB-20261029-175405 -EncodedCommand SIMULATED-NOT-ENCODED
```

It resembles an encoded-command indicator but does not supply or execute encoded content.

Relevant PowerShell metadata:

- Process GUID: `{f1afc63f-6c1e-6ae3-f511-000000003800}`
- Parent process GUID: `{f1afc63f-6bdd-6ae3-e011-000000003800}`
- SHA-256: `60C9B29843624DD8AF6B6A7B26147753BE6AEEF65098B9A503CC50850AFE410F`
- Company: Microsoft Corporation
- Integrity: High

## Network events

Two Event ID 3 records captured the loopback TCP connection:

| Local time | Record | Initiated | Source | Destination | Process |
|---|---:|---|---|---|---|
| 17:54:13.241 +02:00 | 69 | true | `127.0.0.1:62950` | `127.0.0.1:62949` | `powershell.exe` |
| 17:54:13.241 +02:00 | 70 | false | `127.0.0.1:62950` | `127.0.0.1:62949` | `powershell.exe` |

Both events share process GUID `{f1afc63f-6bdd-6ae3-e011-000000003800}`. No external host was contacted.

## File creation event

Test marker: `SYSMON-LAB-FILE-20261029-175710`

| Event | Local time | Record | Image | Target |
|---:|---|---:|---|---|
| 11 | 17:57:11.791 +02:00 | 518 | `powershell.exe` | `C:\SysmonLab\SYSMON-LAB-FILE-20261029-175710.txt` |

The event matched the explicitly named configuration rule `Sysmon detection lab test directory`.

## What this proves

- Sysmon recorded process creation with command line, hashes, process GUIDs, parent fields, signer metadata, and integrity level.
- Sysmon recorded both sides of a loopback TCP connection and associated them with the initiating process.
- Sysmon recorded a marked file creation after the lab-specific include was applied.

## What remains unverified

These records prove local collection only. Wazuh ingestion, indexed rule IDs, alert levels, and custom-rule matches are not claimed here.
