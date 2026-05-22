$ErrorActionPreference = "Stop"

$files = @(Get-ChildItem "d:\CominSoonPage\*.html")
$serviceFiles = @(Get-ChildItem "d:\CominSoonPage\Services\*.html")

$regexRootUsefulLinks = [regex]'(?s)<li><i class="fa-solid fa-arrow-right"></i><a href="contact.html" class="text-decoration-none">Contact Us</a></li>\s*</ul>\s*</div>'
$regexServiceUsefulLinks = [regex]'(?s)<li><i class="fa-solid fa-arrow-right"></i><a href="\.\./contact.html" class="text-decoration-none">Contact Us</a></li>\s*</ul>\s*</div>'

$replacementRoot = @"
<li><i class="fa-solid fa-arrow-right"></i><a href="photo-gallery.html" class="text-decoration-none">Gallery</a></li>
                                <li><i class="fa-solid fa-arrow-right"></i><a href="contact.html" class="text-decoration-none">Contact Us</a></li>
                            </ul>
                        </div>
"@

$replacementService = @"
<li><i class="fa-solid fa-arrow-right"></i><a href="../photo-gallery.html" class="text-decoration-none">Gallery</a></li>
                                <li><i class="fa-solid fa-arrow-right"></i><a href="../contact.html" class="text-decoration-none">Contact Us</a></li>
                            </ul>
                        </div>
"@

foreach ($file in $files) {
    $html = [IO.File]::ReadAllText($file.FullName)
    if ($html -match $regexRootUsefulLinks) {
        $html = $html -replace $regexRootUsefulLinks, $replacementRoot
        [IO.File]::WriteAllText($file.FullName, $html)
        Write-Host "Updated $($file.Name)"
    }
}

foreach ($file in $serviceFiles) {
    $html = [IO.File]::ReadAllText($file.FullName)
    if ($html -match $regexServiceUsefulLinks) {
        $html = $html -replace $regexServiceUsefulLinks, $replacementService
        [IO.File]::WriteAllText($file.FullName, $html)
        Write-Host "Updated $($file.Name) (Services)"
    }
}
