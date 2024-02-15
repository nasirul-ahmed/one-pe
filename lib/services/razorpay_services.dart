import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorpayService {
  late Razorpay _razorpay;

  RazorpayService() {
    _razorpay = Razorpay();

    _init();
  }

  void _init() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // _onPaymentSuccess(response);
    print(response);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // _onPaymentError(response);
    print(response);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // _onExternalWallet(response);
    print(response);
  }

  void startPayment({
    required String key,
    required int amount,
    required String name,
    required String description,
    required String prefillContact,
    required String prefillEmail,
    required List<String> externalWallets,
  }) {
    var options = {
      'key': key,
      'amount': amount,
      'name': name,
      'description': description,
      'prefill': {'contact': prefillContact, 'email': prefillEmail},
      'external': {'wallets': externalWallets},
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  void dispose() {
    _razorpay.clear();
  }
}
