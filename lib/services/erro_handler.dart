import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:binary_calculator/services/exceptions.dart';

class ErrorHandler {
  static handle(Exception error, context) {
    if (error is DivisionByZeroError) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.WARNING,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Division Error',
        desc: 'You are trying to make a Division by zero! This is not possible :c',
        btnCancelOnPress: () {},
        btnOkOnPress: () {},
      )..show();
    }
  }
}