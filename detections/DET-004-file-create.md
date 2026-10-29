# DET-004 — File creation telemetry

## Objective

Validate Sysmon Event ID 11 for a harmless marked file in `C:\SysmonLab\`.

## Configuration

The balanced upstream configuration was extended with one narrow `FileCreate` include for the test directory. Broad file collection and FileDelete archiving were not enabled.

## ATT&CK mapping

T1105 — Ingress Tool Transfer can involve files written to endpoints, but this local text-file test does not simulate or prove a transfer. The mapping describes a potential detection use case only.

## Result

Verified locally: Event ID 11, record 518, captured the marked text file and creating PowerShell process. Wazuh indexing remains to be verified.
