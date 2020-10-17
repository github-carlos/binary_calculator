import 'package:flutter/material.dart';
class OperationResult extends StatelessWidget {
  final String number;
  OperationResult({@required this.number});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: number.split('').map((digit) {
        return Text(digit, style: TextStyle(fontSize: 40, color: Colors.white), textAlign: TextAlign.center,);
      }).toList()
    );
  }
}
