# Sanitized Wazuh validation summary

Raw manager alerts remain outside Git because they contain endpoint usernames, hostnames, and local paths.

## Built-in detection

Marker: `SYSMON-LAB-20261029-175405`

| UTC alert time | Sysmon event | Wazuh rule | Level | Description | MITRE |
|---|---:|---:|---:|---|---|
| 2026-10-29 15:54:08.589 | 1 | 92057 | 12 | PowerShell spawned PowerShell with an encoded-command indicator | T1059.001 |

This proves the marked endpoint event traversed the Wazuh agent, manager decoder, rule engine, and alert pipeline.

## Custom live detections

Marker: `SYSMON-LAB-20261029-181203`
Test start: `2026-10-29T18:12:03.5090065+02:00` / `2026-10-29T16:12:03.5090065Z`

| UTC alert time | Sysmon event | Record | Wazuh rule | Level | Result |
|---|---:|---:|---:|---:|---|
| 2026-10-29 16:12:04.889 | 1 | 1555 | 100200 | 5 | Marked `cmd.exe` process detected live |
| 2026-10-29 16:12:12.095 | 1 | 1569 | 100203 | 8 | Harmless encoded-command marker detected live |

Rule `100203` mapped to MITRE ATT&CK T1027. Both alerts were associated with active agent `001` and decoded by `windows_eventchannel`.

## File rule validation

Wazuh `wazuh-logtest` decoded a synthetic Event ID 11 sample and produced:

- Rule ID: `100202`
- Level: `6`
- Description: `Sysmon lab: marked file created in the monitored test directory`
- Result: `Alert to be generated`

Repeated real Event ID 11 tests were verified locally, including record `2175` at `2026-10-29T18:18:00.7793834+02:00`, but did not produce a live manager alert. Live Event ID 11 ingestion is therefore not claimed.

## Network evidence boundary

Event ID 3 records were verified locally. A dedicated live Wazuh rule was deployed and tested with controlled loopback traffic, but no live alert was observed. Event ID 3 ingestion is not claimed.

## Health validation

After rule validation and manager restarts:

- Wazuh manager: active
- Wazuh indexer: active
- Wazuh dashboard: active
- Filebeat: active
- Windows agent `001`: active
- Sysmon and Wazuh Windows services: running and automatic
