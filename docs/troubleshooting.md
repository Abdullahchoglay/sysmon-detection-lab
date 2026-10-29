# Troubleshooting record

## Low host disk capacity

Preflight found only 5.7 GB free. The active dynamic Wazuh virtual disk consumed about 40.2 GB and no snapshots existed. No deletion was attempted. The balanced non-archiving configuration was chosen to limit growth.

## Standalone Sysmon manifest failure

The verified Sysinternals 15.22 binary validated the configuration but failed its first installation with:

```text
wevtutil.exe returned failure
Event manifest installation failed with last error:
The operation completed successfully.
```

No standalone service or event channel was created. Microsoft documentation published in 2026 describes built-in Sysmon as an optional Windows 11 feature and warns against coexistence with standalone Sysmon. The lab therefore enabled the built-in feature and installed the same reviewed configuration successfully.

## FileCreate marker initially absent

The first test produced process and network events but no Event ID 11 for `C:\SysmonLab\`. The balanced profile is intentionally selective. A narrow include for that directory was added, the XML was validated, and Sysmon accepted the dynamic update. The repeated test produced Event ID 11 record 518.

## Manager access unavailable

The VM exposes SSH through localhost port 2222, but the forwarded connection did not return an SSH banner and no local SSH key exists. Manager-side rule installation, `wazuh-logtest`, service inspection, and indexed-event verification are therefore not claimed yet.
