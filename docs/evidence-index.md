# Evidence index

| ID | Scenario | Local event | Wazuh validation | Investigation | Status |
|---|---|---|---|---|---|
| PRE-001 | Environment preflight | N/A | Agent transport only | `docs/build-log.md` | Verified |
| ACQ-001 | Sysmon acquisition | Signature and SHA-256 | N/A | `evidence/acquisition-summary.md` | Verified |
| DET-001 | Process creation | Event 1, records 48/57 | Pending | `IR-001-marked-process-chain.md` | Local verified |
| DET-002 | PowerShell execution | Event 1, record 57 | Pending | `IR-001-marked-process-chain.md` | Local verified |
| DET-003 | Network connection | Event 3, records 69/70 | Pending | `IR-002-network-and-file.md` | Local verified |
| DET-004 | File creation | Event 11, record 518 | Pending | `IR-002-network-and-file.md` | Local verified |
| DET-005 | Suspicious-looking command line | Event 1, record 57 | Pending | `IR-001-marked-process-chain.md` | Local verified |
| DET-006 | Parent-child relationship | Event 1 parent fields | Pending | `IR-001-marked-process-chain.md` | Local verified |
