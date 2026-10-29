# Evidence index

| ID | Scenario | Local event | Wazuh validation | Investigation | Status |
|---|---|---|---|---|---|
| PRE-001 | Environment preflight | N/A | Agent transport only | `docs/build-log.md` | Verified |
| ACQ-001 | Sysmon acquisition | Signature and SHA-256 | N/A | `evidence/acquisition-summary.md` | Verified |
| DET-001 | Process creation | Event 1, records 48/1555 | Rules 100200 L5 live | `IR-001-marked-process-chain.md` | End-to-end verified |
| DET-002 | PowerShell execution | Event 1, records 57/1569 | Rules 92057 L12 and 100203 L8 live | `IR-001-marked-process-chain.md` | End-to-end verified |
| DET-003 | Network connection | Event 3, records 69/70 | No live alert observed | `IR-002-network-and-file.md` | Local verified only |
| DET-004 | File creation | Event 11, records 518/2175 | Rule 100202 L6 logtest only | `IR-002-network-and-file.md` | Local + rule-test verified |
| DET-005 | Suspicious-looking command line | Event 1, record 1569 | Rule 100203 L8 live | `IR-001-marked-process-chain.md` | End-to-end verified |
| DET-006 | Parent-child relationship | Event 1 parent fields | Included in live Rule 100200/100203 alerts | `IR-001-marked-process-chain.md` | End-to-end verified |
