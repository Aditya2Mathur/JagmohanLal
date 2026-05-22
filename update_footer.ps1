$ErrorActionPreference = "Stop"

$files = @(Get-ChildItem "d:\CominSoonPage\*.html")
$serviceFiles = @(Get-ChildItem "d:\CominSoonPage\Services\*.html")

$regexUsefulLinks = [regex]'(?s)<div class="links">\s*<h5 class="heading">Useful Links</h5>\s*<ul class="list-unstyled mb-0">.*?</ul>\s*</div>'

$regexTreatment = [regex]'(?s)<div class="timing">\s*<h5 class="heading">Treatment</h5>\s*<ul class="list-unstyled mb-0">.*?</ul>\s*</div>'

# Replacement for root files
$rootUsefulLinks = @"
<div class="links">
                            <h5 class="heading">Useful Links</h5>
                            <ul class="list-unstyled mb-0">
                                <li><i class="fa-solid fa-arrow-right"></i><a href="index.html" class="text-decoration-none">Home</a></li>
                                <li><i class="fa-solid fa-arrow-right"></i><a href="about.html" class="text-decoration-none">About</a></li>
                                <li><i class="fa-solid fa-arrow-right"></i><a href="service.html" class="text-decoration-none">Services</a></li>
                                <li><i class="fa-solid fa-arrow-right"></i><a href="contact.html" class="text-decoration-none">Contact Us</a></li>
                            </ul>
                        </div>
"@

$rootTreatment = @"
<div class="links">
                            <h5 class="heading">Treatments</h5>
                            <ul class="list-unstyled mb-0">
                                <li><i class="fa-solid fa-arrow-right"></i><a href="Services/cataract-surgery.html" class="text-decoration-none">Cataract</a></li>
                                <li><i class="fa-solid fa-arrow-right"></i><a href="Services/vitrectomy-surgery.html" class="text-decoration-none">Retina</a></li>
                                <li><i class="fa-solid fa-arrow-right"></i><a href="Services/glaucoma-surgery.html" class="text-decoration-none">Glaucoma</a></li>
                                <li><i class="fa-solid fa-arrow-right"></i><a href="Services/corneal-transplantation.html" class="text-decoration-none">Cornea</a></li>
                                <li><i class="fa-solid fa-arrow-right"></i><a href="Services/pediatric-ophthalmology.html" class="text-decoration-none">Pediatric Eye Care</a></li>
                            </ul>
                        </div>
"@

# Replacement for service files
$serviceUsefulLinks = @"
<div class="links">
                            <h5 class="heading">Useful Links</h5>
                            <ul class="list-unstyled mb-0">
                                <li><i class="fa-solid fa-arrow-right"></i><a href="../index.html" class="text-decoration-none">Home</a></li>
                                <li><i class="fa-solid fa-arrow-right"></i><a href="../about.html" class="text-decoration-none">About</a></li>
                                <li><i class="fa-solid fa-arrow-right"></i><a href="../service.html" class="text-decoration-none">Services</a></li>
                                <li><i class="fa-solid fa-arrow-right"></i><a href="../contact.html" class="text-decoration-none">Contact Us</a></li>
                            </ul>
                        </div>
"@

$serviceTreatment = @"
<div class="links">
                            <h5 class="heading">Treatments</h5>
                            <ul class="list-unstyled mb-0">
                                <li><i class="fa-solid fa-arrow-right"></i><a href="cataract-surgery.html" class="text-decoration-none">Cataract</a></li>
                                <li><i class="fa-solid fa-arrow-right"></i><a href="vitrectomy-surgery.html" class="text-decoration-none">Retina</a></li>
                                <li><i class="fa-solid fa-arrow-right"></i><a href="glaucoma-surgery.html" class="text-decoration-none">Glaucoma</a></li>
                                <li><i class="fa-solid fa-arrow-right"></i><a href="corneal-transplantation.html" class="text-decoration-none">Cornea</a></li>
                                <li><i class="fa-solid fa-arrow-right"></i><a href="pediatric-ophthalmology.html" class="text-decoration-none">Pediatric Eye Care</a></li>
                            </ul>
                        </div>
"@

foreach ($file in $files) {
    $html = [IO.File]::ReadAllText($file.FullName)
    $modified = $false
    
    if ($html -match $regexUsefulLinks) {
        $html = $html -replace $regexUsefulLinks, $rootUsefulLinks
        $modified = $true
    }
    if ($html -match $regexTreatment) {
        $html = $html -replace $regexTreatment, $rootTreatment
        $modified = $true
    }
    
    if ($modified) {
        [IO.File]::WriteAllText($file.FullName, $html)
        Write-Host "Updated $($file.Name)"
    }
}

foreach ($file in $serviceFiles) {
    $html = [IO.File]::ReadAllText($file.FullName)
    $modified = $false
    
    if ($html -match $regexUsefulLinks) {
        $html = $html -replace $regexUsefulLinks, $serviceUsefulLinks
        $modified = $true
    }
    if ($html -match $regexTreatment) {
        $html = $html -replace $regexTreatment, $serviceTreatment
        $modified = $true
    }
    
    if ($modified) {
        [IO.File]::WriteAllText($file.FullName, $html)
        Write-Host "Updated $($file.Name) (Services)"
    }
}
