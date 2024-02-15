import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '/screens/reset_password.dart';
import '/screens/auth/signup.dart';
import '../../_helpers/utils.dart';
import '../../providers/theme_manager.dart';
import '../../providers/user_manager.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var items = [
    '+91',
    '+912',
    '+92',
    '+94',
    '+95',
  ];

  String dValue = "+91";
  List<DropdownMenuItem<String>>? x;
  String loginType = "mobile";
  final formKey = GlobalKey<FormState>();

  handleSubmit(UserManager userManager, BuildContext context) async {
    final FormState? form = formKey.currentState;
    // if (form!.validate()) {
    //   context.loaderOverlay.show();

    //   if (loginType != "mobile") {
    //     await Future.delayed(const Duration(milliseconds: 1000));
    //     User user =
    //         await emailLogin(emailController.text, passwordController.text);
    //     context.loaderOverlay.hide();
    //     userManager.updateUser(user);
    //   } else {
    //     await Future.delayed(const Duration(milliseconds: 1000));
    //     User user = await mobileLogin(mobileController.text);
    //     context.loaderOverlay.hide();
    //     userManager.updateUser(user);
    //   }
    //   // ignore: use_build_context_synchronously
    //   showSnankbar(context, "Login In");
    // }
  }

  generateList() {
    List<DropdownMenuItem<String>>? y = items.map((String? e) {
      return DropdownMenuItem(value: e, child: Text(e.toString()));
    }).toList();
    setState(() {
      x = y;
    });
  }

  handleChange(String? item) {
    if (item == "mobile" || item == "email") {
      setState(() {
        loginType = item.toString();
      });
    } else {
      setState(() {
        dValue = item.toString();
      });
    }
  }

  validateEmail(String? value) {
    if (value == null || value.isEmpty || value.length < 10) {
      return "Invalid email";
    }
    if (!value.contains("@")) {
      return "Not a valid mail";
    }
    return null;
  }

  validatePassword(String? value) {
    if (value == null || value.isEmpty || value.length < 6) {
      return "Password should be 6 or more characters";
    }
    return null;
  }

  validateMobile(String? value) {
    if (value == null || value.isEmpty || value.length < 10) {
      return "Mobile number should be of 10 digits";
    }
    return null;
  }

  @override
  void initState() {
    generateList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var themeManager = Provider.of<ThemeProvider>(context);
    var userManager = Provider.of<UserManager>(context);
    Widget textField(TextInputType type, TextEditingController controller,
        Function validate) {
      return TextFormField(
        validator: (v) => validate(v),
        keyboardType: type,
        controller: controller,
        style: const TextStyle(),
        autocorrect: false,
        autovalidateMode: AutovalidateMode.onUserInteraction,
      );
    }

    Widget Login(double currentWith) {
      Size screen = MediaQuery.of(context).size;
      return Center(
        child: Container(
          width: 600,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo(),
                space(0, 44),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Sign In",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                space(0, 0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text("Don’t have an account?",
                          style: Theme.of(context).textTheme.bodyMedium),
                      const SizedBox(
                        width: 4,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => SignUp(),
                            ),
                          );
                        },
                        child: Text(
                          "Sign Up!",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              ?.copyWith(color: const Color(0xff009FD4)),
                        ),
                      ),
                    ],
                  ),
                ),
                space(0, 32),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => handleChange("mobile"),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            Text("Mobile",
                                style: Theme.of(context).textTheme.subtitle2),
                            const SizedBox(
                              height: 2,
                            ),
                            loginType == "mobile"
                                ? Container(
                                    width: 56,
                                    height: 3,
                                    color: const Color(0xff009FD4),
                                  )
                                : const SizedBox(
                                    width: 56,
                                    height: 3,
                                  ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 35,
                    ),
                    InkWell(
                      onTap: () => handleChange("email"),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Email",
                                style: Theme.of(context).textTheme.labelMedium),
                            const SizedBox(
                              height: 2,
                            ),
                            loginType == "email"
                                ? Container(
                                    width: 56,
                                    height: 3,
                                    color: const Color(0xff009FD4),
                                  )
                                : const SizedBox(
                                    width: 56,
                                    height: 3,
                                  )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                space(0, 20),
                loginType == "mobile"
                    ? Center(
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Container(
                                    height: 48,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 18,
                                      vertical: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xff7B60EE),
                                    ),
                                    child: DropdownButton(
                                      iconEnabledColor: Colors.white,
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.white),
                                      dropdownColor: const Color(0xff7b60ee),
                                      focusColor: Colors.black,
                                      underline: const SizedBox(),
                                      alignment: AlignmentDirectional.topStart,
                                      itemHeight: 48,
                                      elevation: 0,
                                      value: dValue,
                                      items: x,
                                      onChanged: handleChange,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    // height: 48,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: textField(
                                      TextInputType.number,
                                      mobileController,
                                      validateMobile,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            // space(0, 85)
                          ],
                        ),
                      )
                    : Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: textField(TextInputType.emailAddress,
                                    emailController, validateEmail),
                              ),
                              space(0, 12),
                              const Text("Password"),
                              space(0, 8),
                              Container(
                                child: Column(
                                  children: [
                                    textField(TextInputType.visiblePassword,
                                        passwordController, validatePassword),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                space(0, 12),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ForgetPassword(),
                          ),
                        );
                      },
                      child: Text(
                        "Forgot your Password?",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            ?.copyWith(color: const Color(0xff009FD4)),
                      ),
                    ),
                  ),
                ),
                space(0, 100),
                Container(
                  height: 48,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () => handleSubmit(userManager, context),
                    child: const Text("Sign In"),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Switch(
                activeColor: Colors.white,
                value: themeManager.themeMode == ThemeMode.dark,
                onChanged: (v) {
                  themeManager.toggleTheme(v);
                }),
          ),
          space(0, 10),
          GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: Login(600),
          ),
        ],
      ),
    );
  }
}
