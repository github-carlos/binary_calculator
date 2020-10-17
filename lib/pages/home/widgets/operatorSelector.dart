import 'package:binary_calculator/pages/home/widgets/arrowButton.dart';
import 'package:flutter/material.dart';
import 'package:binary_calculator/services/binary_calculator.dart';

class OperatorSelector extends StatefulWidget {
  BinaryCalculatorOperation operator;
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
        ArrowButton(onPressed: () {
          changeToPreviousOperator();
        }, direction: ArrowButtonDirection.up,),
        Text(
          operatorsLabel[widget.operator],
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
        ),
        ArrowButton(onPressed: () {
          changeToNextOperator();
        }, direction: ArrowButtonDirection.down,),
      ],
    );
  }

  get listOfOperators {
   return  operatorsLabel.keys.toList();
  }

  changeToPreviousOperator() {
    final indexOfCurrentOperator = listOfOperators.indexOf(widget.operator);
    if (indexOfCurrentOperator != 0)  {
      setState(() {
        widget.operator = listOfOperators[indexOfCurrentOperator - 1];
        widget.onOperationChange(widget.operator);
      });
    }
  }
  changeToNextOperator() {
    final indexOfCurrentOperator = listOfOperators.indexOf(widget.operator);
    if (indexOfCurrentOperator < listOfOperators.length - 1) {
      setState(() {
        widget.operator = listOfOperators[indexOfCurrentOperator + 1];
        widget.onOperationChange(widget.operator);
      });
    }
  }
}
