param(
    $inputFile,
    $symbol,
    $value,
    $outputFile
)

$targetDir = Split-Path $outputFile
if (Test-Path $targetDir) {
    (Get-Content $inputFile) -Replace $symbol,$value | Out-File $outputFile -Encoding ASCII -Force
} else {
    Write-Warning "Directory $targetDir does not exists. This may be caused by an empty \$\(TargetFramework\) property generated by msbuild, skipping..."
}
