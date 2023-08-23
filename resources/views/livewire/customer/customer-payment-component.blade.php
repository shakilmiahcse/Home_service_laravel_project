
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3 payment-form">
                <h1 class="text-center">Payment Details</h1>
                <form action="process_payment.php" method="POST">
                    <div class="form-group">
                        <label for="card_number">Card Number:</label>
                        <input type="text" class="form-control" id="card_number" name="card_number" placeholder="Card Number" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="expiry_date">Expiry Date:</label>
                        <input type="text" class="form-control" id="expiry_date" name="expiry_date" placeholder="MM/YY" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="cvv">CVV:</label>
                        <input type="text" class="form-control" id="cvv" name="cvv" placeholder="CVV" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="name">Cardholder Name:</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="Cardholder Name" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="amount">Amount:</label>
                        <input type="text" class="form-control" id="amount" name="amount" placeholder="Amount" required>
                    </div>
                    
                    <button type="submit" class="btn btn-primary btn-block">Submit Payment</button>
                </form>
                <div id="payment-status" class="text-center">
                    <!-- Payment status will be displayed here -->
                </div>
            </div>
        </div>
    </div>
