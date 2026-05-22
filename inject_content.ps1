$ErrorActionPreference = "Stop"

$contentMap = @{
    "cataract-surgery.html" = @'
<p class="text2 text-size-16" data-aos="fade-up">Cataracts cause a progressive clouding of the eye's natural lens, leading to blurred vision, glare, and difficulty seeing at night. At Jagmohan Lal Hospital, we specialize in advanced cataract treatments to restore clear vision and improve your quality of life safely and effectively.</p>
                        <ul class="list-unstyled list" data-aos="fade-up">
                            <li class="text-size-16"><i class="fa-solid fa-check"></i>Micro-Incision Cataract Surgery (Phacoemulsification)</li>
                            <li class="text-size-16"><i class="fa-solid fa-check"></i>Premium Intraocular Lens (IOL) Implants (Multifocal, Toric)</li>
                            <li class="text-size-16"><i class="fa-solid fa-check"></i>Painless, sutureless, and bloodless procedure</li>
                            <li class="text-size-16"><i class="fa-solid fa-check"></i>Rapid recovery and minimal downtime</li>
                        </ul>
                        <p class="text1 text-size-16" data-aos="fade-up">Our state-of-the-art operating theaters are equipped with the latest surgical technology, ensuring precision and exceptional visual outcomes. Our experienced surgical team carefully evaluates your vision needs to recommend the best customized IOL for your lifestyle.</p>
                        <p class="text-size-16 mb-0" data-aos="fade-up">Don't let cataracts dim your world. We are committed to providing personalized, compassionate care from your initial consultation through your rapid post-operative recovery, helping you see clearly again.</p>
'@

    "glaucoma-surgery.html" = @'
<p class="text2 text-size-16" data-aos="fade-up">Glaucoma is often called the "silent thief of sight" because it can cause irreversible damage to the optic nerve without early symptoms. Effective management is critical to halting progression and preserving your vision.</p>
                        <ul class="list-unstyled list" data-aos="fade-up">
                            <li class="text-size-16"><i class="fa-solid fa-check"></i>Advanced diagnostic imaging (OCT, Visual Field Testing)</li>
                            <li class="text-size-16"><i class="fa-solid fa-check"></i>Laser procedures (SLT, YAG PI)</li>
                            <li class="text-size-16"><i class="fa-solid fa-check"></i>Trabeculectomy and minimally invasive glaucoma surgery (MIGS)</li>
                            <li class="text-size-16"><i class="fa-solid fa-check"></i>Comprehensive medical management and monitoring</li>
                        </ul>
                        <p class="text1 text-size-16" data-aos="fade-up">Our dedicated glaucoma specialists employ a step-wise approach, utilizing the latest diagnostic tools to detect changes early. When eye drops are insufficient, we offer the most advanced laser and surgical interventions to safely lower intraocular pressure.</p>
                        <p class="text-size-16 mb-0" data-aos="fade-up">At Jagmohan Lal Hospital, we focus on long-term disease management, educating patients and providing continuous monitoring to ensure your vision is protected for the years to come.</p>
'@

    "corneal-transplantation.html" = @'
<p class="text2 text-size-16" data-aos="fade-up">The cornea is the eye's clear front window. Diseases, infections, or injuries can cause it to become cloudy or misshapen, drastically impairing vision. Corneal transplantation can restore sight for patients suffering from severe corneal conditions.</p>
                        <ul class="list-unstyled list" data-aos="fade-up">
                            <li class="text-size-16"><i class="fa-solid fa-check"></i>Penetrating Keratoplasty (Full-thickness transplant)</li>
                            <li class="text-size-16"><i class="fa-solid fa-check"></i>Lamellar Keratoplasty (DSEK/DMEK)</li>
                            <li class="text-size-16"><i class="fa-solid fa-check"></i>Keratoconus management and cross-linking</li>
                            <li class="text-size-16"><i class="fa-solid fa-check"></i>Treatment of corneal ulcers and severe scarring</li>
                        </ul>
                        <p class="text1 text-size-16" data-aos="fade-up">Our corneal specialists use the most advanced microscopic surgical techniques to replace diseased tissue with healthy donor tissue. Lamellar transplants, which replace only specific layers of the cornea, offer faster visual recovery and reduced rejection risks compared to traditional methods.</p>
                        <p class="text-size-16 mb-0" data-aos="fade-up">We provide comprehensive pre-surgical evaluation and dedicated post-operative care, ensuring the best possible outcome for graft survival and visual rehabilitation.</p>
'@

    "vitrectomy-surgery.html" = @'
<p class="text2 text-size-16" data-aos="fade-up">Conditions affecting the retina and the vitreous gel inside the eye require highly specialized care. Vitrectomy is a delicate microsurgical procedure used to treat severe, vision-threatening conditions at the back of the eye.</p>
                        <ul class="list-unstyled list" data-aos="fade-up">
                            <li class="text-size-16"><i class="fa-solid fa-check"></i>Retinal detachment repair</li>
                            <li class="text-size-16"><i class="fa-solid fa-check"></i>Advanced diabetic retinopathy management</li>
                            <li class="text-size-16"><i class="fa-solid fa-check"></i>Macular hole and epiretinal membrane surgery</li>
                            <li class="text-size-16"><i class="fa-solid fa-check"></i>Treatment for severe vitreous hemorrhage</li>
                        </ul>
                        <p class="text1 text-size-16" data-aos="fade-up">Our expert retina surgeons utilize state-of-the-art sutureless micro-incision vitrectomy technology, allowing for precise interventions with enhanced safety and quicker recovery times. We handle complex intraocular surgeries with the utmost care and expertise.</p>
                        <p class="text-size-16 mb-0" data-aos="fade-up">Because retinal conditions can escalate quickly, our facility is fully equipped to provide immediate diagnostic evaluations and emergency surgical interventions to save and restore your sight.</p>
'@

    "oculoplasty-treatment.html" = @'
<p class="text2 text-size-16" data-aos="fade-up">Oculoplasty deals with the reconstructive and cosmetic surgery of the eyelids, tear ducts, and the orbit (the bony socket surrounding the eye). These procedures aim to restore both proper function and natural appearance.</p>
                        <ul class="list-unstyled list" data-aos="fade-up">
                            <li class="text-size-16"><i class="fa-solid fa-check"></i>Ptosis (drooping eyelid) correction</li>
                            <li class="text-size-16"><i class="fa-solid fa-check"></i>Entropion and Ectropion (inward/outward turning eyelids) repair</li>
                            <li class="text-size-16"><i class="fa-solid fa-check"></i>Dacryocystorhinostomy (DCR) for blocked tear ducts</li>
                            <li class="text-size-16"><i class="fa-solid fa-check"></i>Eyelid tumor excision and reconstruction</li>
                        </ul>
                        <p class="text1 text-size-16" data-aos="fade-up">Whether addressing age-related structural changes, congenital abnormalities, or trauma, our oculoplastic surgeons blend functional medical knowledge with aesthetic precision. We prioritize procedures that protect the eye while enhancing facial symmetry.</p>
                        <p class="text-size-16 mb-0" data-aos="fade-up">We offer individualized surgical plans designed to provide long-lasting, natural-looking results with minimal scarring and a swift recovery period.</p>
'@

    "pediatric-ophthalmology.html" = @'
<p class="text2 text-size-16" data-aos="fade-up">Children's eyes are not just small adult eyes; they require specialized diagnostic approaches and gentle care. Early detection and treatment of childhood eye conditions are critical for normal visual development.</p>
                        <ul class="list-unstyled list" data-aos="fade-up">
                            <li class="text-size-16"><i class="fa-solid fa-check"></i>Strabismus (squint or misaligned eyes) assessment and surgery</li>
                            <li class="text-size-16"><i class="fa-solid fa-check"></i>Amblyopia (lazy eye) therapy and patching</li>
                            <li class="text-size-16"><i class="fa-solid fa-check"></i>Refractive error correction in children</li>
                            <li class="text-size-16"><i class="fa-solid fa-check"></i>Management of pediatric cataracts and congenital glaucoma</li>
                        </ul>
                        <p class="text1 text-size-16" data-aos="fade-up">Our pediatric ophthalmologists are trained to make eye exams engaging and stress-free for young patients. We use child-friendly diagnostic tools to accurately assess vision even in non-verbal infants and toddlers.</p>
                        <p class="text-size-16 mb-0" data-aos="fade-up">At Jagmohan Lal Hospital, we work closely with parents to develop effective treatment strategies, ensuring your child achieves optimal visual health to support their learning and development.</p>
'@

    "neuro-ophthalmology.html" = @'
<p class="text2 text-size-16" data-aos="fade-up">Neuro-ophthalmology bridges the fields of neurology and ophthalmology, focusing on complex visual problems that are tied to the nervous system rather than the eye itself.</p>
                        <ul class="list-unstyled list" data-aos="fade-up">
                            <li class="text-size-16"><i class="fa-solid fa-check"></i>Evaluation of unexplained vision loss</li>
                            <li class="text-size-16"><i class="fa-solid fa-check"></i>Optic neuritis and ischemic optic neuropathy management</li>
                            <li class="text-size-16"><i class="fa-solid fa-check"></i>Treatment of double vision and cranial nerve palsies</li>
                            <li class="text-size-16"><i class="fa-solid fa-check"></i>Idiopathic intracranial hypertension (pseudotumor cerebri) care</li>
                        </ul>
                        <p class="text1 text-size-16" data-aos="fade-up">Our specialists perform comprehensive neurological eye exams to pinpoint the exact source of visual disturbances. We collaborate with neurologists and neurosurgeons to formulate an integrated approach to diagnosing and treating complex systemic conditions.</p>
                        <p class="text-size-16 mb-0" data-aos="fade-up">We utilize advanced neuro-imaging and visual pathway testing to deliver accurate diagnoses and tailored treatment plans for these highly specialized, vision-threatening conditions.</p>
'@

    "vision-rehabilitation.html" = @'
<p class="text2 text-size-16" data-aos="fade-up">When medical and surgical treatments cannot fully restore sight, vision rehabilitation helps individuals maximize their remaining vision. Our goal is to empower patients to maintain their independence and quality of life despite visual impairment.</p>
                        <ul class="list-unstyled list" data-aos="fade-up">
                            <li class="text-size-16"><i class="fa-solid fa-check"></i>Comprehensive low vision evaluations</li>
                            <li class="text-size-16"><i class="fa-solid fa-check"></i>Prescription of specialized optical magnifiers and telescopes</li>
                            <li class="text-size-16"><i class="fa-solid fa-check"></i>Training with electronic and digital reading aids</li>
                            <li class="text-size-16"><i class="fa-solid fa-check"></i>Orientation, mobility, and daily living skills training</li>
                        </ul>
                        <p class="text1 text-size-16" data-aos="fade-up">Our multidisciplinary team includes low vision specialists who work closely with patients to understand their specific daily challenges. We create personalized rehabilitation plans tailored to help patients continue reading, navigating, and performing tasks they love.</p>
                        <p class="text-size-16 mb-0" data-aos="fade-up">At Jagmohan Lal Hospital, we believe that vision loss should not mean a loss of independence. We provide continuous support, resources, and therapeutic interventions to help our patients adapt and thrive.</p>
'@
}

$files = Get-ChildItem "d:\CominSoonPage\Services\*.html"

foreach ($file in $files) {
    $filename = $file.Name
    if ($contentMap.ContainsKey($filename)) {
        $html = [IO.File]::ReadAllText($file.FullName)
        
        $regex = [regex]'(?s)<p class="text2 text-size-16" data-aos="fade-up">Excepteur.*?<p class="text-size-16 mb-0" data-aos="fade-up">Sunt in culpa qui officia deserunt mollit.*?Ut enim ad minim veniam, quis nostrud exercitation.\s*</p>'
        
        if ($html -match $regex) {
            $replacement = $contentMap[$filename]
            $newHtml = $html -replace $regex, $replacement
            [IO.File]::WriteAllText($file.FullName, $newHtml)
            Write-Host "Updated $($filename)"
        } else {
            Write-Host "Could not find target text block in $($filename)"
        }
    }
}
