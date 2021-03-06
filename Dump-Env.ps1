
# Usage
#   Dump-Env.ps1 [-File file]

Param(
  [string]
  $File
)

if ($PSBoundParameters.ContainsKey('File')) {
  Get-ChildItem env: | %{ "$($_.Name)=$($_.Value)" } | Out-String | %{ [Text.Encoding]::UTF8.GetBytes($_) } | Set-Content -Path $File -Encoding Byte
} else {
  Get-ChildItem env: | %{ "$($_.Name)=$($_.Value)" }
}

