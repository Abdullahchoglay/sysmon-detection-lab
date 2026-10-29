# Scope and limitations

## In scope

- Official Sysmon acquisition and verification
- Sysmon configuration selection and attribution
- Wazuh Sysmon event-channel collection
- Harmless process, PowerShell, network, file, command-line, and parent-child tests
- Hash and metadata analysis
- Custom-rule preparation and manager-side validation
- Evidence sanitization and portfolio documentation

## Out of scope

- Malware execution, persistence, credential access, exploitation, or traffic to third-party systems
- Production capacity planning and enterprise tuning
- Automated response or containment
- Repeating the original lab's installation, FIM, failed-logon, and Event ID 4104 work

## Current limitation

Local telemetry is verified. Manager-side Wazuh ingestion, indexed rule IDs, severities, and custom-rule validation are pending authenticated VM access. Those outcomes are not implied by the healthy agent connection.
