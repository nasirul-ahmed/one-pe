import '/_helpers/size_utils.dart';
import '../../models/service_model.dart';
import '/models/gst_model.dart';
import '/providers/service_provider.dart';
import '/widgets/custom_header.dart';
import '/widgets/custom_text_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class ServicePage extends StatefulWidget {
  final String? serviceId;
  const ServicePage({super.key, this.serviceId});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  late final Razorpay _razorpay;
  late final formData;

  makePayment() {
    Map<String, dynamic> options = {
      "key": "rzp_test_brerfh5w18K9na",
      "amount": 100 * 100,
      "name": "Nasir",
      "description": "first payment",
      "prefillContact": "prefillContact",
      "prefillEmail": "nasirul369@gmail.com",
      "externalWallets": []
    };
    _razorpay.open(options);
  }

  @override
  void initState() {
    _razorpay = Razorpay();
    // _razorpay.
    // razorpayService = RazorpayService(
    //   onPaymentSuccess: (PaymentSuccessResponse succesResponse) {
    //     print(succesResponse);
    //   },
    //   onPaymentError: (PaymentFailureResponse failedResponse) {
    //     print(failedResponse);
    //   },
    //   onExternalWallet: (ExternalWalletResponse walletResponse) {
    //     print(walletResponse);
    //   },
    // );
    _razorpay.on(
      Razorpay.EVENT_PAYMENT_SUCCESS,
      (PaymentSuccessResponse succesResponse) {
        print(succesResponse);
      },
    );
    _razorpay.on(
      Razorpay.EVENT_PAYMENT_ERROR,
      (PaymentFailureResponse failedResponse) {
        print(failedResponse);
      },
    );
    _razorpay.on(
      Razorpay.EVENT_EXTERNAL_WALLET,
      (ExternalWalletResponse walletResponse) {
        print(walletResponse);
      },
    );

    switch (widget.serviceId) {
      case "gst":
        formData = GSTModel(
          formType: "",
          documents: {},
          customerName: "",
          phone: '',
          desc: '',
          price: '',
        );
        break;
      default:
        break;
    }
    super.initState();
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  buildForm() {
    switch (widget.serviceId) {
      case "gst":
        return buildGSTForms();
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    ServiceProvider serviceProvider = Provider.of<ServiceProvider>(context);
    print(serviceProvider.services[0]);
    ServiceModel service = serviceProvider.services
        .firstWhere((ServiceModel e) => e.id == widget.serviceId);
    // .where((ServiceModel e) => e.id == widget.serviceId);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          title: Text(
        service.name,
      )),
      body: Container(
        padding: getPadding(all: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(),
            // Build service form/layout based on service.
            // CustomTextInput(
            //   hintText: "Name",
            // ),
            MaterialButton(
              onPressed: () => makePayment(),
              child: const Center(
                child: Text("PayNow"),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildGSTForms() {
    return const Column(
      children: [
        CustomHeader(title: "Please FiLL the GST form below"),
        CustomTextInput(
          hintText: "Customer Name",
          inputType: TextInputType.text,
        ),
        CustomTextInput(
          hintText: "Customer Phone",
          inputType: TextInputType.phone,
        ),
      ],
    );
  }
}
