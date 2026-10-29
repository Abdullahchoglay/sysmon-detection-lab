# Build log

## 2026-10-29 — Read-only preflight

- Confirmed Windows 11 Home build 26200 and approximately 16 GB RAM.
- Confirmed only 5.7 GB free on drive C:.
- Confirmed Wazuh agent 4.14.7 is running automatically as LocalSystem.
- Confirmed an established localhost TCP session to Wazuh port 1514.
- Confirmed Sysmon is not installed and its Operational event channel is absent.
- Confirmed the Wazuh VirtualBox VM is running with 8 GB RAM, 2 vCPU, NAT, guest IP 10.0.2.15, and a 42 GB dynamic disk consuming about 40.2 GB on the host.
- Confirmed the VM has no snapshots.
- No system or Wazuh configuration was changed during preflight.

## 2026-10-29 — Acquisition

- Downloaded `Sysmon.zip` from `download.sysinternals.com`.
- Verified Sysmon64.exe version 15.22 and a valid Microsoft Windows Publisher Authenticode signature.
- Recorded SHA-256 `83D31F2478DC6716CFDBF69E5C384BF043072B5F0D8D7B2EEA365F709FDA4352`.
- Downloaded the versioned balanced Sysmon Modular profile and verified its release checksum.

Installation and Wazuh ingestion remain unverified at this stage.
