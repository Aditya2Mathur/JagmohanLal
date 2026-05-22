import sys

with open('d:/CominSoonPage/career.html', 'r', encoding='utf-8') as f:
    content = f.read()

target1 = '''    <div class="container">
        <div class="text-center mb-5" data-aos="fade-down">
            <h2 class="font-weight-bold" style="color: #bd2a2a; border-bottom: 2px solid #bd2a2a; display: inline-block; padding-bottom: 10px;">Training Phases Overview</h2>'''

replacement1 = '''    <div class="container">
        <div class="text-center mb-5" data-aos="fade-down">
            <h2 class="font-weight-bold" style="color: #015099; border-bottom: 2px solid #015099; display: inline-block; padding-bottom: 10px;">Medical Officer Programme</h2>
            <p class="text-muted mt-3 text-size-18">Jagmohan Lal EYE HOSPITAL invites applications for its structured and intensive Medical Officer Programme.</p>
        </div>

        <!-- Eligibility Criteria -->
        <div class="mb-5 p-4 p-md-5 bg-white rounded shadow-sm" data-aos="fade-up" style="border-left: 5px solid #bd2a2a;">
            <h3 class="font-weight-bold mb-4" style="color: #333;"><i class="fa-solid fa-list-check text-danger mr-2"></i>Eligibility Criteria</h3>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <p class="font-weight-bold text-dark mb-1"><i class="fa-solid fa-user-graduate text-primary mr-2"></i>Educational Qualification:</p>
                    <p class="text-muted text-size-15 pl-4">MS/MD in Ophthalmology or an equivalent recognized degree</p>
                </div>
                <div class="col-md-6 mb-3">
                    <p class="font-weight-bold text-dark mb-1"><i class="fa-solid fa-id-card text-success mr-2"></i>Registration:</p>
                    <p class="text-muted text-size-15 pl-4">Must be registered with the Medical Council of India (MCI) / State Medical Council</p>
                </div>
                <div class="col-md-6 mb-3">
                    <p class="font-weight-bold text-dark mb-1"><i class="fa-solid fa-briefcase-medical" style="color: #f2613d; margin-right: 8px;"></i>Experience:</p>
                    <p class="text-muted text-size-15 pl-4">Fresh postgraduates or candidates with minimal prior surgical exposure</p>
                </div>
                <div class="col-md-6 mb-3">
                    <p class="font-weight-bold text-dark mb-1"><i class="fa-solid fa-handshake-angle text-info mr-2"></i>Commitment:</p>
                    <p class="text-muted text-size-15 pl-4">Full 3-year participation mandatory</p>
                </div>
            </div>
        </div>

        <div class="text-center mb-5" data-aos="fade-down">
            <h2 class="font-weight-bold" style="color: #bd2a2a; border-bottom: 2px solid #bd2a2a; display: inline-block; padding-bottom: 10px;">Training Phases Overview</h2>'''

target2 = '''                <div style="flex:1;">
                    <h5 class="mb-2 font-weight-bold text-dark">How to Apply</h5>
                    <p class="mb-1 text-muted text-size-16">Interested candidates may share their CV at:</p>
                    <a href="mailto:jmlhspn@gmail.com" class="text-primary font-weight-bold d-inline-block mt-1" style="font-size: 20px; border-bottom: 2px dashed #015099; text-decoration:none;"><i class="fa-solid fa-paper-plane mr-2"></i>jmlhspn@gmail.com</a>
                </div>'''

replacement2 = '''                <div style="flex:1;">
                    <h5 class="mb-2 font-weight-bold text-dark">How to Apply</h5>
                    <p class="mb-1 text-muted text-size-16">Interested candidates may share their CV at:</p>
                    <a href="mailto:jmlhspn@gmail.com" class="text-primary font-weight-bold d-inline-block mt-1" style="font-size: 20px; border-bottom: 2px dashed #015099; text-decoration:none;"><i class="fa-solid fa-paper-plane mr-2"></i>jmlhspn@gmail.com</a>
                    <p class="mb-1 text-muted text-size-16 mt-3">Or contact us directly:</p>
                    <p class="font-weight-bold text-dark mb-0">
                        <i class="fa-solid fa-phone mr-2 text-success"></i><a href="tel:+919839668855" class="text-dark text-decoration-none">9839668855</a> &nbsp;|&nbsp; 
                        <i class="fa-solid fa-phone mr-2 text-success"></i><a href="tel:+919453012562" class="text-dark text-decoration-none">9453012562</a>
                    </p>
                </div>'''

content = content.replace(target1, replacement1)
content = content.replace(target2, replacement2)

with open('d:/CominSoonPage/career.html', 'w', encoding='utf-8') as f:
    f.write(content)

print("Done")
