import 'dart:ui';
import 'themes/my_colors.dart';

enum Role {
  customer,
  b2b,
}

enum SCREENS {
  taxServices,
  error,
  billPaymentHome,
  addMoney,
  profile,
  setting,
  payment,
  emailForm,
  mobNoForm,
  otpForm,
  forgetPwd,
  checkMail,
  newPassword,
  logIn
}

enum MyButtonColors {
  red(MyColors.red),
  blue(MyColors.blue),
  green(MyColors.green),
  transparent(MyColors.transparant),
  white(MyColors.white);

  final Color color;
  const MyButtonColors(this.color);
}

enum TransactionType { debit, credit }

enum ScreenSelected {
  homepage(0),
  prifile(1),
  setting(2);

  const ScreenSelected(this.value);
  final int value;
}
