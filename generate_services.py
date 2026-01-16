
import os
import re

services = [
    {
        "filename": "cataract-surgery.html",
        "title": "Cataract Surgery",
        "description": "Advanced phacoemulsification cataract surgery with premium IOL implants. Safe, painless procedure with quick recovery and excellent visual outcomes."
    },
    {
        "filename": "glaucoma-surgery.html",
        "title": "Glaucoma Surgery",
        "description": "Comprehensive glaucoma treatment including trabeculectomy, glaucoma drainage devices, and laser procedures to prevent vision loss."
    },
    {
        "filename": "corneal-transplantation.html",
        "title": "Corneal Transplantation",
        "description": "Full-thickness and lamellar corneal transplants using modern techniques. Restores vision in cases of corneal scarring and diseases."
    },
    {
        "filename": "refractive-surgery.html",
        "title": "Refractive Surgery",
        "description": "LASIK, PRK, and SMILE procedures to correct myopia, hyperopia, and astigmatism. Freedom from glasses and contact lenses."
    },
    {
        "filename": "vitrectomy-surgery.html",
        "title": "Vitrectomy Surgery",
        "description": "Micro-incision vitrectomy for retinal detachment, diabetic retinopathy, macular holes, and vitreous hemorrhage treatment."
    },
    {
        "filename": "laser-photocoagulation.html",
        "title": "Laser Photocoagulation",
        "description": "Laser treatment for diabetic retinopathy, retinal tears, and macular edema. Precise, non-invasive procedure with minimal discomfort."
    },
    {
        "filename": "oculoplasty-treatment.html",
        "title": "Oculoplasty Treatment",
        "description": "Eyelid surgery for ptosis, entropion, ectropion, and cosmetic improvements. Restores function and enhances appearance."
    },
    {
        "filename": "pediatric-ophthalmology.html",
        "title": "Pediatric Ophthalmology",
        "description": "Specialized eye care for children including squint surgery, lazy eye treatment, and congenital eye disorder management."
    }
]

with open('service-detail.html', 'r', encoding='utf-8') as f:
    template_content = f.read()

def adjust_paths(content):
    # Adjust assets paths
    content = content.replace('href="assets/', 'href="../assets/')
    content = content.replace('src="assets/', 'src="../assets/')
    
    # Adjust simple html links (excluding absolute urls and anchors)
    # This is a bit tricky, but looking at the file:
    # href="about.html", href="service.html" etc.
    # We can regex for href="[^"#:]+" 
    
    def replace_link(match):
        url = match.group(1)
        if url.startswith('http') or url.startswith('#') or url.startswith('mailto:') or url.startswith('javascript:'):
            return f'href="{url}"'
        if url == "./" or url == ".":
             return 'href="../"'
        if not url.startswith('../') and not url.startswith('assets/'):
            return f'href="../{url}"'
        return f'href="{url}"'

    content = re.sub(r'href="([^"]+)"', replace_link, content)
    
    # Also fix form action if any relative
    # <form action="javascript:;"> is safe.
    
    return content

base_content = adjust_paths(template_content)

for service in services:
    content = base_content
    
    # Replace Title in Head
    content = content.replace('<title>Service Details | Opticest</title>', f'<title>{service["title"]} | Jagmohan Lal Hospital</title>')
    
    # Replace Banner Heading
    content = content.replace('<h1 class="text-white">Service Details</h1>', f'<h1 class="text-white">{service["title"]}</h1>')
    
    # Replace Banner Description (Generic placeholder in template: "Nuis nostrud...")
    # Let's just use the service description here too or a shorter one? 
    # Use the service description.
    content = content.replace('Nuis nostrud exercitation ullamco laboris nisi aut aliquio modo consenuar irure in reprehenderit esse.', service["description"])

    # Replace Breadcrumb
    # <span class="mb-0 box_span">Service Details</span>
    content = content.replace('<span class="mb-0 box_span">Service Details</span>', f'<span class="mb-0 box_span">{service["title"]}</span>')
    
    # Replace Main Content Heading
    # <h3 data-aos="fade-up">Laser Eye Surgery</h3>
    content = content.replace('Laser Eye Surgery', service["title"])
    
    # Replace Main Content Description (First Paragraph)
    # <p class="text1 text-size-16" data-aos="fade-up">Lorem ipsum dolor sit amet...
    # We will regex this to be safe as it spans lines or contains whitespace
    
    # Simple replace for the Lorem Ipsum start?
    # "Lorem ipsum dolor sit amet, consectet ur adipiscing elit, sed do eiusmod tem por incididunt ut labore. Eiusmod tempor incididunt ut labore et \n                        dolore magna aliqua. Quis ipsum suspendisse. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis."
    
    lorem_pattern = r'<p class="text1 text-size-16" data-aos="fade-up">Lorem ipsum dolor sit amet.*?<\/p>'
    new_p = f'<p class="text1 text-size-16" data-aos="fade-up">{service["description"]}</p>'
    content = re.sub(lorem_pattern, new_p, content, flags=re.DOTALL)

    # Write to file
    file_path = os.path.join('Services', service['filename'])
    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(content)
    print(f"Created {file_path}")

