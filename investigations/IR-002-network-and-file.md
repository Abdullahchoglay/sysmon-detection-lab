# IR-002 — Loopback network and file activity

## Summary

The lab generated one loopback-only TCP exchange and one marked text file. Sysmon recorded Event IDs 3 and 11.

## Findings

- The network connection stayed on `127.0.0.1`; no external endpoint was contacted.
- Initiated and accepted connection records shared the same PowerShell process GUID.
- The file was a plain-text marker in the dedicated `C:\SysmonLab\` directory.
- The file event matched the narrowly scoped lab configuration rule.

## Assessment

Benign true positive. The activity proves process-to-network and process-to-file attribution without simulating destructive behavior.

## Evidence boundary

Local Sysmon collection is verified. Wazuh rule ID, severity, and indexing remain pending.
