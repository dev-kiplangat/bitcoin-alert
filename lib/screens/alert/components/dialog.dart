import 'package:cool_alert/cool_alert.dart';

dynamic showSuccess(context) {
  return CoolAlert.show(
    context: context,
    type: CoolAlertType.success,
    text: "Your transaction was successful!",
  );
}

dynamic showLoadingSpinner(context) {
  return CoolAlert.show(
    context: context,
    type: CoolAlertType.loading,
  );
}
