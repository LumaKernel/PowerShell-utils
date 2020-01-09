
# Usage
#   Revert-Env.ps1 [-File file]

Param(
  [Parameter(ValueFromPipeline, ValueFromPipelineByPropertyName)]
  [string[]]
  $Line,

  [string]
  $File
)

begin {
  $script:lines = @()
  if ($PSBoundParameters.ContainsKey('File')) {
    $script:lines = (Get-Conent $file) -as [string[]]
  }
}

process {
  $script:lines += $line
}

end {
  Get-ChildItem env: | %{ Remove-Item env:$($_.Name) -ErrorAction SilentlyContinue }
  foreach ($str in $script:lines) {
    if ($str -match "^\s*([^=]+)\s*=(.*)$") {
      Set-Item -Path env:$($Matches[1]) -Value $Matches[2]
    }
  }
}

