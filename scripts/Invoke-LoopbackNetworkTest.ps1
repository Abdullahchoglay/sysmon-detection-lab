[CmdletBinding()]
param(
    [string]$Marker = ('SYSMON-LAB-NET-' + (Get-Date -Format 'yyyyMMdd-HHmmss')),
    [int]$Port = 49191
)

$ErrorActionPreference = 'Stop'
$start = Get-Date
$listener = [Net.Sockets.TcpListener]::new([Net.IPAddress]::Loopback, $Port)
$listener.Start()
$accept = $listener.AcceptTcpClientAsync()
$client = [Net.Sockets.TcpClient]::new()
$client.Connect([Net.IPAddress]::Loopback, $Port)
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
    Port = $Port
}
