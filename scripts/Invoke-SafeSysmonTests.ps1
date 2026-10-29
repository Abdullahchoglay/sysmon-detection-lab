[CmdletBinding()]
param(
    [string]$Marker = ('SYSMON-LAB-' + (Get-Date -Format 'yyyyMMdd-HHmmss')),
    [string]$TestDirectory = 'C:\SysmonLab'
)

$ErrorActionPreference = 'Stop'
$start = Get-Date
New-Item -ItemType Directory -Path $TestDirectory -Force | Out-Null

# DET-001 and DET-006: a harmless parent-child process chain.
$child = Start-Process -FilePath "$env:SystemRoot\System32\cmd.exe" `
    -ArgumentList '/c', "echo $Marker" -PassThru -Wait

# DET-002 and DET-005: a suspicious-looking flag in a benign marked command.
& "$env:SystemRoot\System32\WindowsPowerShell\v1.0\powershell.exe" `
    -NoProfile -Command "Write-Output '$Marker -EncodedCommand SIMULATED-NOT-ENCODED'" | Out-Null

# DET-004: a harmless marked text file.
$testFile = Join-Path $TestDirectory "$Marker.txt"
Set-Content -LiteralPath $testFile -Value "Benign Sysmon lab marker: $Marker"

# DET-003: a loopback-only TCP connection. A temporary listener receives one line.
$listener = [System.Net.Sockets.TcpListener]::new([Net.IPAddress]::Loopback, 0)
$listener.Start()
$port = ([Net.IPEndPoint]$listener.LocalEndpoint).Port
$accept = $listener.AcceptTcpClientAsync()
$client = [System.Net.Sockets.TcpClient]::new()
$client.Connect([Net.IPAddress]::Loopback, $port)
$stream = $client.GetStream()
$bytes = [Text.Encoding]::UTF8.GetBytes($Marker)
$stream.Write($bytes, 0, $bytes.Length)
$stream.Dispose()
$client.Dispose()
$serverClient = $accept.GetAwaiter().GetResult()
$serverClient.Dispose()
$listener.Stop()

[pscustomobject]@{
    Marker = $Marker
    StartLocal = $start.ToString('o')
    StartUtc = $start.ToUniversalTime().ToString('o')
    EndLocal = (Get-Date).ToString('o')
    ChildProcessId = $child.Id
    File = $testFile
    LoopbackPort = $port
}
