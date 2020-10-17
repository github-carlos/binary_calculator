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

  bool upArrowIsActivated = false;
  bool downArrowIsActivated = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ArrowButton(onPressed: () {
          changeToPreviousOperator();
        }, direction: ArrowButtonDirection.up, active: upArrowIsActivated,),
        Text(
          operatorsLabel[widget.operator],
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
        ),
        ArrowButton(onPressed: () {
          changeToNextOperator();
        }, direction: ArrowButtonDirection.down, active: downArrowIsActivated,),
      ],
    );
  }

  get listOfOperators {
   return  operatorsLabel.keys.toList();
  }

  changeToPreviousOperator() {
    final indexOfCurrentOperator = listOfOperators.indexOf(widget.operator);
    final nextIndex = indexOfCurrentOperator - 1;
    if (indexOfCurrentOperator != 0)  {
      setState(() {
        if ((nextIndex - 1) == -1) {
          upArrowIsActivated = false;
        }
        downArrowIsActivated = true;
        widget.operator = listOfOperators[nextIndex];
        widget.onOperationChange(widget.operator);
      });
    }
  }
  changeToNextOperator() {
    final indexOfCurrentOperator = listOfOperators.indexOf(widget.operator);
    final nextIndex = indexOfCurrentOperator + 1;
    if (nextIndex < listOfOperators.length) {
      setState(() {
        if ((nextIndex + 1) == listOfOperators.length) {
          downArrowIsActivated = false;
        }
        upArrowIsActivated = true;
        widget.operator = listOfOperators[nextIndex];
        widget.onOperationChange(widget.operator);
      });
    }
  }
}
