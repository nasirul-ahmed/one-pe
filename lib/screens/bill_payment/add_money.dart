import 'package:flutter/material.dart';
import 'package:onepe/_helpers/size_utils.dart';
import 'package:onepe/_helpers/utils.dart';
import '../../widgets/custom_container.dart';
import '../../services/razorpay_services.dart';

class AddMoney extends StatefulWidget {
  const AddMoney({super.key});

  @override
  State<AddMoney> createState() => _AddMoneyState();
}

class _AddMoneyState extends State<AddMoney> {
  final formKey = GlobalKey<FormState>();
  late RazorpayService _razorpayService;
  late TextEditingController textController;

  addMoney() {
    int amount = int.parse(textController.text);

    if (amount > 0) {
      _razorpayService.startPayment(
        key: "rzp_test_brerfh5w18K9na",
        amount: amount * 100,
        name: "Add Money To Wallet",
        description: "description",
        prefillContact: "prefillContact",
        prefillEmail: "prefillEmail@gmail.com",
        externalWallets: ["externalWallets"],
      );
    }
  }

  onChanged(String v) {
    final RegExp regexp = RegExp(r'^0+(?=.)');
    if (formKey.currentState!.validate()) {
      if (v.isEmpty || int.parse(v) == 0) {
        setState(() {
          textController.text = "0";
        });
      } else {
        if (textController.text.startsWith("0")) {
          setState(() {
            textController.text = v.replaceAll(regexp, "");
          });
        }
      }
    }
  }

  @override
  void initState() {
    textController = TextEditingController(text: "0");
    _razorpayService = RazorpayService();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: formKey,
        child: Container(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                space(0, 40),
                SizedBox(
                  width: 100,
                  child: TextFormField(
                    controller: textController,
                    keyboardType:
                        const TextInputType.numberWithOptions(signed: true),
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 36),
                    decoration: InputDecoration(
                      contentPadding: getPadding(bottom: 5),
                      prefixIcon: const Icon(
                        Icons.currency_rupee,
                        size: 30,
                      ),
                      border: InputBorder.none,
                    ),
                    onChanged: onChanged,
                    validator: (String? value) {
                      if (value == '0' || value == "") {
                        return "Please enter a valid amount";
                      }
                      return null;
                    },
                  ),
                ),
                space(0, 100),
                CustomContainer(
                  height: 50,
                  width: size.width / 2,
                  color: Colors.green[400],
                  borderRadius: BorderRadius.circular(8),
                  child: MaterialButton(
                    onPressed: addMoney,
                    child: Center(
                      child: Text(
                        "Add Money",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: setWidth(16),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
