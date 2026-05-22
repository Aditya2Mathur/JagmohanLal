$ErrorActionPreference = "Stop"

$files = Get-ChildItem "d:\CominSoonPage\Services\*.html"

# The regex matches everything from <!-- Service --> to right before <!-- Footer -->
$regex = [regex]'(?s)\s*<!-- Service -->\s*<section class="service-con servicepage-con position-relative pt-0">.*?</section>\s*(?=<!-- Footer -->)'

foreach ($file in $files) {
    $html = [IO.File]::ReadAllText($file.FullName)
    
    if ($html -match $regex) {
        $newHtml = $html -replace $regex, "`n    "
        [IO.File]::WriteAllText($file.FullName, $newHtml)
        Write-Host "Removed section from $($file.Name)"
    } else {
        Write-Host "Could not find target section in $($file.Name)"
    }
}
