# DET-003 — Network connection telemetry

## Objective

Validate Sysmon Event ID 3 and correlate a TCP connection with its process GUID.

## Safe test

A PowerShell `TcpListener` and `TcpClient` exchanged the unique marker over loopback only. No external system was contacted.

## ATT&CK mapping

T1071 — Application Layer Protocol is relevant to process-associated application traffic generally. This loopback test proves telemetry mechanics, not adversary behavior or a particular malicious protocol.

## Result

Verified locally: Event ID 3 records 69 and 70 captured both sides of the connection and linked them to the same PowerShell process GUID. Wazuh indexing remains to be verified.
