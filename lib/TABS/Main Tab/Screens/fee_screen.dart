import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class FeePaymentScreen extends StatefulWidget {
  @override
  _FeePaymentScreenState createState() => _FeePaymentScreenState();
}

class _FeePaymentScreenState extends State<FeePaymentScreen> {
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    _razorpay.clear(); // Clear all listeners on dispose
    super.dispose();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_SHSnUK0k6K1qCK', // Replace with your Razorpay API key
      'amount': 50000, // The amount is in the smallest currency unit (50000 = INR 500)
      'name': 'Maharaja Surajmal Institute of Technology',
      'description': 'Fee Payment',
      'prefill': {
        'contact': '1234567890', // Pre-filled contact number
        'email': 'student@example.com', // Pre-filled email address
      },
      'external': {
        'wallets': ['paytm'] // Allows payment via Paytm wallet
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Handle successful payment
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Payment successful: ${response.paymentId}"),
    ));
    // Navigate to success page or perform additional actions
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Handle payment error
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Payment failed: ${response.message}"),
    ));
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Handle external wallet selection
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("External wallet selected: ${response.walletName}"),
    ));
  }
  bool hasFees = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Fee Payment',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
      ),
      // body: Center(
      //   child: ElevatedButton(
      //     onPressed: openCheckout,
      //     child: Text('Pay Fees'),
      //   ),
      // ),
      body: hasFees
          ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Fees Details:',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          // Add details here as needed, e.g., amount, due date
          Text(
            'Amount Due: ₹5000', // Replace with actual data
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: openCheckout,
            child: Text('Pay Fees'),
          ),
        ],
      )
          : Center(
        child: Text(
          'No Fees to Pay',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
