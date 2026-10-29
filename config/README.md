# Sysmon configuration provenance

`sysmonconfig-15.21.xml` is the balanced profile from Olaf Hartong's [Sysmon Modular](https://github.com/olafhartong/sysmon-modular) release `configs-a45dedb13a43`, published 2026-10-14.

It was selected because it is maintained as modular source, generated and validated in CI, version-pinned, mapped to ATT&CK, and less disk-intensive than the FileDelete archive profile. It remains a starting point that must be tested and tuned for this endpoint.

- Release asset SHA-256: `64bec37ba849c5f2934a55d2a29e7ddfae46a30d56f7f2908d1f8a454898797e`
- Local SHA-256: `64bec37ba849c5f2934a55d2a29e7ddfae46a30d56f7f2908d1f8a454898797e`
- Checksum source: the release's `SHA256SUMS` asset
- Upstream attribution: Sysmon Modular by Olaf Hartong and contributors, inspired by SwiftOnSecurity's original configuration

The upstream project does not currently expose a root `LICENSE` file at the pinned branch. Attribution and the exact upstream release are therefore retained here; no authorship of the configuration is claimed.

## Local change

The checked-in copy adds one narrowly scoped `FileCreate` include for `C:\SysmonLab\`. This makes the benign DET-004 marker observable without enabling broad file collection. The original downloaded asset and checksum remain recorded above, so the modification is transparent and reproducible.
