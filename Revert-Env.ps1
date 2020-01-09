
# Usage
#   Revert-Env.ps1 [-File file]

Param(
  [Parameter(ValueFromPipeline)]
  [string]
  $Text

  [string]
  $File
)

if ($PSBoundParameters.ContainsKey('Text') -and $PSBoundParameters.ContainsKey('File')) {
  Write-Error "User one of -Text or -File parameter"
  exit 1
}

if (!$PSBoundParameters.ContainsKey('Text') -and !$PSBoundParameters.ContainsKey('File')) {
  Write-Error "Provide exactly one of -Text or -File parameter"
  exit 1
}

if ($PSBoundParameters.ContainsKey('File')) {
  $ilnes = (Get-Conent $file) -as [string[]]
}

foreach ($line in $lines) {
  if ($line -match "\s*([^=]*)\s*=(.*)$"
  Set-Item -Path "env:$Matches[1]" -Value $Matches[2]
}

