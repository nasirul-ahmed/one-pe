import 'enums.dart';

extension ScreenExtend on SCREENS {
  String get toPath {
    switch (this) {
      case SCREENS.billPaymentHome:
        return "/";
      case SCREENS.addMoney:
        return "/addMoney";
      case SCREENS.profile:
        return "/profile";
      case SCREENS.taxServices:
        return "/tax-services";
      case SCREENS.setting:
        return "/setting";
      case SCREENS.payment:
        return "payment/:id";
      case SCREENS.emailForm:
        return "/emailForm";
      case SCREENS.mobNoForm:
        return "/mobNoForm";
      case SCREENS.otpForm:
        return "/otpForm";
      case SCREENS.forgetPwd:
        return "/forgetPwd";
      case SCREENS.checkMail:
        return "/checkMail";
      case SCREENS.newPassword:
        return "/newPassword";
      case SCREENS.logIn:
        return "/logIn";

      default:
        return "/";
    }
  }

  String get toName {
    switch (this) {
      case SCREENS.taxServices:
        return "TaxServices";
      case SCREENS.addMoney:
        return "ADDMONEY";
      case SCREENS.profile:
        return "PROFILE";
      case SCREENS.billPaymentHome:
        return "BILLPAYMENTHOME";
      case SCREENS.setting:
        return "SETTING";
      case SCREENS.payment:
        return "PAYMENT";
      case SCREENS.emailForm:
        return "EMAILFORM";
      case SCREENS.mobNoForm:
        return "MOBNOFORM";
      case SCREENS.otpForm:
        return "OTPFORM";
      case SCREENS.forgetPwd:
        return "FORGETPWD";
      case SCREENS.checkMail:
        return "CHECKMAIL";
      case SCREENS.newPassword:
        return "NEWPASSWORD";
      case SCREENS.logIn:
        return "LOGIN";

      default:
        return "HOME";
    }
  }

  String get toTitle {
    switch (this) {
      case SCREENS.taxServices:
        return "Tax Services";
      case SCREENS.profile:
        return "Profile";
      case SCREENS.billPaymentHome:
        return "Bill Payment";
      case SCREENS.addMoney:
        return "Add Money";
      case SCREENS.setting:
        return "Setting";
      case SCREENS.payment:
        return "Payment";
      case SCREENS.emailForm:
        return "EmailForm";
      case SCREENS.mobNoForm:
        return "MobNoForm";
      case SCREENS.otpForm:
        return "OtpForm";
      case SCREENS.forgetPwd:
        return "ForgetPwd";
      case SCREENS.checkMail:
        return "CheckMail";
      case SCREENS.newPassword:
        return "NewPassword";
      case SCREENS.logIn:
        return "LogIn";
      default:
        return "Dashboard";
    }
  }
}
