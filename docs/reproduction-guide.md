# Reproduction guide

1. Confirm adequate disk space and verify the Wazuh agent and manager are healthy.
2. Download Sysmon only from the official Microsoft Sysinternals page.
3. Verify the Microsoft Authenticode signer and record SHA-256.
4. Download the pinned Sysmon Modular balanced profile and verify its release checksum.
5. Back up `C:\Program Files (x86)\ossec-agent\ossec.conf` and record its hash.
6. On current Windows 11, enable the built-in Sysmon optional feature following Microsoft guidance. Do not install built-in and standalone Sysmon together.
7. Validate and install the configuration, then confirm the Sysmon service, driver, and Operational channel.
8. Add the following validated Wazuh agent entry and restart only the agent:

```xml
<localfile>
  <location>Microsoft-Windows-Sysmon/Operational</location>
  <log_format>eventchannel</log_format>
</localfile>
```

9. Confirm Sysmon and Wazuh services are running and the agent retains its port 1514 connection.
10. Run `scripts/Invoke-SafeSysmonTests.ps1`, capture the marker and timestamps, and verify local events before querying Wazuh.
11. Copy `rules/sysmon_lab_rules.xml` to the manager only after checking for rule-ID collisions. Test representative JSON events with `wazuh-logtest`, then restart the manager and re-check every required Wazuh service.

Never publish raw EVTX files, agent keys, installer credentials, usernames, or unsanitized logs.
