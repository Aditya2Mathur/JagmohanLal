$ErrorActionPreference = "Stop"

$services = @(
    @{ file="cataract-surgery.html"; title="Cataract Surgery"; desc="Advanced phacoemulsification cataract surgery with premium IOL implants. Safe, painless procedure with quick recovery and excellent visual outcomes." },
    @{ file="glaucoma-surgery.html"; title="Glaucoma Surgery"; desc="Comprehensive glaucoma treatment including trabeculectomy, glaucoma drainage devices, and laser procedures to prevent vision loss." },
    @{ file="corneal-transplantation.html"; title="Corneal Transplantation"; desc="Full-thickness and lamellar corneal transplants using modern techniques. Restores vision in cases of corneal scarring and diseases." },
    @{ file="vitrectomy-surgery.html"; title="Vitrectomy Surgery"; desc="Micro-incision vitrectomy for retinal detachment, diabetic retinopathy, macular holes, and vitreous hemorrhage treatment." },
    @{ file="oculoplasty-treatment.html"; title="Oculoplasty Treatment"; desc="Eyelid surgery for ptosis, entropion, ectropion, and cosmetic improvements. Restores function and enhances appearance." },
    @{ file="pediatric-ophthalmology.html"; title="Pediatric Ophthalmology"; desc="Specialized eye care for children including squint surgery, lazy eye treatment, and congenital eye disorder management." },
    @{ file="neuro-ophthalmology.html"; title="Neuro Ophthalmology"; desc="Expert diagnosis and management of complex visual problems related to the nervous system, including optic nerve disorders." },
    @{ file="vision-rehabilitation.html"; title="Vision Rehabilitation"; desc="Comprehensive low vision assessment and therapy to help patients maximize their remaining vision and maintain independence." }
)

$serviceHtml = [IO.File]::ReadAllText("d:\CominSoonPage\service.html")

# Extract what we offer section from service.html
$whatWeOfferRegex = [regex]'(?s)<!-- Service -->\s*<section class="service-con servicepage-con position-relative pt-0">.*?<!-- Choose -->'
$whatWeOfferMatch = $whatWeOfferRegex.Match($serviceHtml)
$whatWeOffer = $whatWeOfferMatch.Value.Replace('<!-- Choose -->', '')
# Update links to relative for Services folder
$whatWeOffer = $whatWeOffer.Replace('src="assets/', 'src="../assets/')
$whatWeOffer = $whatWeOffer.Replace('href="Services/', 'href="')
# Edge case: service.html had a link to 'service.html' directly for Neuro/Vision initially, but we fixed it to 'Services/...' in my previous step! So the above replace fixes it.

# Read the base from cataract-surgery.html
$baseContent = [IO.File]::ReadAllText("d:\CominSoonPage\Services\cataract-surgery.html")

# Replace the navbar in baseContent with the new one from service.html
$navbarRegex = [regex]'(?s)<header class="header">.*?</header>'
$newNavbarMatch = $navbarRegex.Match($serviceHtml)
$newNavbar = $newNavbarMatch.Value

# Fix links in the new navbar for Services directory
$newNavbar = $newNavbar.Replace('href="./"', 'href="../index.html"')
$newNavbar = $newNavbar.Replace('href="charity-welfare.html"', 'href="../charity-welfare.html"')
$newNavbar = $newNavbar.Replace('href="service.html"', 'href="../service.html"')
$newNavbar = $newNavbar.Replace('href="leadership.html"', 'href="../leadership.html"')
$newNavbar = $newNavbar.Replace('href="career.html"', 'href="../career.html"')
$newNavbar = $newNavbar.Replace('href="about-jagmohanlal-hospital.html"', 'href="../about-jagmohanlal-hospital.html"')
$newNavbar = $newNavbar.Replace('href="history-of-hospital.html"', 'href="../history-of-hospital.html"')
$newNavbar = $newNavbar.Replace('href="vision-and-mission.html"', 'href="../vision-and-mission.html"')
$newNavbar = $newNavbar.Replace('href="facilities-technologies.html"', 'href="../facilities-technologies.html"')
$newNavbar = $newNavbar.Replace('href="patient-rights.html"', 'href="../patient-rights.html"')
$newNavbar = $newNavbar.Replace('href="insurance-tpa.html"', 'href="../insurance-tpa.html"')
$newNavbar = $newNavbar.Replace('href="contact.html"', 'href="../contact.html"')
$newNavbar = $newNavbar.Replace('src="assets/', 'src="../assets/')

# Replace the vertical buttons
$vertBtnsRegex = [regex]'(?s)<!-- Fixed Vertical Side Buttons -->.*?</div>'
$vertBtnsMatch = $vertBtnsRegex.Match($serviceHtml)
$vertBtns = $vertBtnsMatch.Value
$vertBtns = $vertBtns.Replace('href="contact.html"', 'href="../contact.html"')

# Styles needed
$styles = @"
    <!-- Custom Dropdown Styles -->
    <style>
        .navbar-nav .dropdown-menu {
            border: none;
            border-radius: 8px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            padding: 10px 0;
            overflow: hidden;
            animation: fadeIn 0.3s ease;
        }
        .navbar-nav .dropdown-item {
            padding: 10px 20px;
            font-weight: 500;
            color: #333;
            transition: all 0.3s;
        }
        .navbar-nav .dropdown-item:hover {
            background-color: #f8f9fa;
            color: #bd2a2a;
            padding-left: 25px;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        body { overflow-x: hidden; }
        .vertical-buttons {
            position: fixed; right: 0; top: 50%; transform: translateY(-50%); z-index: 9999; display: flex; flex-direction: column; gap: 15px;
        }
        .vertical-buttons a {
            writing-mode: vertical-rl; text-orientation: mixed; display: inline-block; padding: 15px 10px; background-color: #015099; color: #fff !important; font-weight: bold; text-transform: uppercase; text-decoration: none; border-radius: 5px 0 0 5px; box-shadow: -3px 0px 5px rgba(0,0,0,0.2); font-size: 14px; transition: 0.3s; text-align: center;
        }
        .vertical-buttons a.donation { background-color: #f2613d; }
        .vertical-buttons a:hover { padding-right: 15px; background-color: #0b3459; }
        .vertical-buttons a.donation:hover { background-color: #d74825; }
        @media (max-width: 768px) { .vertical-buttons { transform: scale(0.8) translateY(-50%); right: -6px; gap: 10px; } }
        @media (max-width: 480px) { .vertical-buttons { transform: scale(0.65) translateY(-50%); right: -10px; } }
    </style>
"@

# Update the base content
$baseContent = $baseContent -replace '(?s)</head>', "$styles`n</head>"
$baseContent = $baseContent -replace '(?s)<body>\s*<!-- Back to top button -->', "<body>`n    $vertBtns`n    <!-- Back to top button -->"
$baseContent = $navbarRegex.Replace($baseContent, $newNavbar)

$oldOfferRegex = [regex]'(?s)<!-- Service -->.*?<!-- Footer -->'
$baseContent = $oldOfferRegex.Replace($baseContent, "$whatWeOffer`n    <!-- Footer -->")

# Now loop through services and generate files
foreach ($svc in $services) {
    $content = $baseContent
    
    # Replace Titles
    $content = $content -replace '<title>Cataract Surgery \| Jagmohan Lal Hospital</title>', "<title>$($svc.title) | Jagmohan Lal Hospital</title>"
    $content = $content -replace '<h1 class="text-white">Cataract Surgery</h1>', "<h1 class=`"text-white`">$($svc.title)</h1>"
    $content = $content -replace '<span class="mb-0 box_span">Cataract Surgery</span>', "<span class=`"mb-0 box_span`">$($svc.title)</span>"
    $content = $content -replace '<h3 data-aos="fade-up">Cataract Surgery</h3>', "<h3 data-aos=`"fade-up`">$($svc.title)</h3>"
    
    # Replace Description
    $loremRegex = [regex]'(?s)<p class="text1 text-size-16" data-aos="fade-up">.*?</p>'
    $content = $loremRegex.Replace($content, "<p class=`"text1 text-size-16`" data-aos=`"fade-up`">$($svc.desc)</p>", 1)
    
    # Replace Sub_banner description
    $content = $content -replace '<p class="text-white text-size-18">Advanced phacoemulsification cataract surgery with premium IOL implants. Safe, painless procedure with quick recovery and excellent visual outcomes.</p>', "<p class=`"text-white text-size-18`">$($svc.desc)</p>"
    
    $filePath = "d:\CominSoonPage\Services\$($svc.file)"
    [IO.File]::WriteAllText($filePath, $content)
    Write-Host "Created $filePath"
}
