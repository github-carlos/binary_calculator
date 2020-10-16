import 'package:binary_calculator/pages/home/widgets/arrowButton.dart';
import 'package:flutter/material.dart';
import 'package:binary_calculator/services/binary_calculator.dart';

class OperatorSelector extends StatefulWidget {
  final BinaryCalculatorOperation operator;
  final Function onOperationChange;
  OperatorSelector({@required this.operator, @required this.onOperationChange});
  @override
  _OperatorSelectorState createState() => _OperatorSelectorState();
}

class _OperatorSelectorState extends State<OperatorSelector> {
  Map<BinaryCalculatorOperation, String> operatorsLabel = {
    BinaryCalculatorOperation.sum: '+',
    BinaryCalculatorOperation.minus: '-',
    BinaryCalculatorOperation.multiply: '*',
    BinaryCalculatorOperation.divide: '/',
    BinaryCalculatorOperation.module: '%'
  };
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ArrowButton(onPressed: () {}, direction: ArrowButtonDirection.up,),
        Text(
          operatorsLabel[widget.operator],
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
        ),
        ArrowButton(onPressed: () {}, direction: ArrowButtonDirection.down,),
      ],
    );
  }
}
