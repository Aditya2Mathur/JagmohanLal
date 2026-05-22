$(document).ready(function () {
    // Check if modal already exists to prevent duplicates
    if ($('#donationModal').length === 0) {
        // Define the modal HTML
        const modalHtml = `
        <div class="modal fade" id="donationModal" tabindex="-1" role="dialog" aria-labelledby="donationModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                <div class="modal-content border-0 shadow-lg" style="border-radius: 12px; overflow: hidden;">
                    <div class="modal-header text-white" style="background-color: #015099 !important; border-bottom: none; padding: 1.25rem 1.5rem;">
                        <h5 class="modal-title font-weight-bold" id="donationModalLabel">Support Our Mission</h5>
                        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close" style="opacity: 0.9; text-shadow: none; font-size: 1.5rem;">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body p-4 p-md-5">
                        <div class="text-center mb-4 pb-2">
                            <h3 class="font-weight-bold" style="color: #bd2a2a;">Jagmohan Lal Charitable Trust</h3>
                            <p class="text-muted text-size-16">Your generous contribution helps us provide free eye care to the underprivileged. Together, we can restore vision and change lives.</p>
                        </div>
                        <div class="row align-items-center">
                            <!-- Bank Details -->
                            <div class="col-md-7 mb-4 mb-md-0 border-md-right pr-md-4" style="border-right: 1px solid #e9ecef;">
                                <h5 class="font-weight-bold mb-3" style="color: #015099;"><i class="fa-solid fa-building-columns mr-2"></i>Bank Transfer Details</h5>
                                <div class="bg-light p-3 rounded mb-3">
                                    <ul class="list-unstyled text-size-16 mb-0" style="line-height: 1.9;">
                                        <li><strong>Account Name:</strong> <span class="float-right text-right">Jagmohan Lal Charitable Trust</span></li>
                                        <li class="border-top pt-1 mt-1"><strong>Bank Name:</strong> <span class="float-right text-right">State Bank of India (Sample)</span></li>
                                        <li class="border-top pt-1 mt-1"><strong>Account No:</strong> <span class="float-right text-right font-weight-bold">12345678901234</span></li>
                                        <li class="border-top pt-1 mt-1"><strong>IFSC Code:</strong> <span class="float-right text-right font-weight-bold">SBIN0001234</span></li>
                                        <li class="border-top pt-1 mt-1"><strong>Branch:</strong> <span class="float-right text-right">Shahjahanpur Main Branch</span></li>
                                    </ul>
                                </div>
                                <div class="mt-2">
                                    <p class="text-size-14 text-muted mb-0"><i class="fa-solid fa-circle-info mr-1" style="color: #bd2a2a;"></i>All donations are eligible for tax exemption under section 80G.</p>
                                </div>
                            </div>
                            <!-- QR Code -->
                            <div class="col-md-5 text-center pl-md-4">
                                <h5 class="font-weight-bold mb-3" style="color: #bd2a2a;"><i class="fa-solid fa-qrcode mr-2"></i>Scan & Pay (UPI)</h5>
                                <div class="qr-wrapper p-3 bg-light rounded d-inline-block shadow-sm mb-3" style="border: 1px solid #e9ecef;">
                                    <img src="assets/images/barcode.png" alt="UPI QR Code" class="img-fluid" style="max-width: 160px; height: auto;">
                                </div>
                                <div class="upi-id-box p-2 rounded" style="background-color: #f8f9fa; border: 1px dashed #ccc;">
                                    <p class="mb-0 text-size-16"><strong>UPI ID:</strong> <span style="color: #015099;">jagmohanlal@sbi</span></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer bg-light" style="border-top: 1px solid #e9ecef; padding: 1rem 1.5rem;">
                        <button type="button" class="btn text-white px-4 py-2 font-weight-bold" data-dismiss="modal" style="background-color: #bd2a2a; border-radius: 6px; box-shadow: 0 4px 6px rgba(189,42,42,0.2); transition: all 0.3s ease;">Close Window</button>
                    </div>
                </div>
            </div>
        </div>
        `;

        // Append modal to body
        $('body').append(modalHtml);

        // Add custom hover effect for close button
        $('#donationModal .btn').hover(
            function () { $(this).css('background-color', '#a02323'); },
            function () { $(this).css('background-color', '#bd2a2a'); }
        );
    }

    // Bind click event to the donation button
    // Using event delegation to handle dynamically added buttons if any
    $(document).on('click', '.vertical-btn.donation', function (e) {
        e.preventDefault(); // Prevent default anchor behavior
        $('#donationModal').modal('show');
    });
});
