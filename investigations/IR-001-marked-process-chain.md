# IR-001 — Marked process chain

## Summary

At 17:54 local time on 2026-10-29, controlled lab activity launched `cmd.exe` and a child PowerShell process with marker `SYSMON-LAB-20261029-175405`. Sysmon recorded both as Event ID 1.

## Findings

- Both executables were Microsoft Windows binaries with recorded multi-algorithm hashes.
- Process and parent GUIDs preserved the execution relationship independently of reusable process IDs.
- The PowerShell command contained `-EncodedCommand` only inside a printed marker; it did not invoke that parameter or execute encoded content.
- The processes ran at high integrity because the controlled setup session was elevated.

## Assessment

Benign true positive. The telemetry is useful for identifying command-shell and PowerShell execution, but the marker and known test context explain the activity.

## Evidence boundary

Local Sysmon collection is verified. Wazuh ingestion and custom-rule alerting are pending manager access.
