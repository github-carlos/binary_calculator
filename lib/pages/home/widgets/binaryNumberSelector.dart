import 'package:binary_calculator/pages/home/widgets/arrowButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BinaryNumberSelector extends StatefulWidget {
  final String initBinaryNumber;
  final Function onNumberChange;
  BinaryNumberSelector(
      {@required this.initBinaryNumber, @required this.onNumberChange}) {

    _validateInitialNumber();
  }

  _validateInitialNumber() {
    _validateLength();
  }

  _validateLength() {
    if (initBinaryNumber.length < 8) {
      throw ('Binary Number needs to have length 8');
    }
  }

  @override
  _BinaryNumberSelectorState createState() => _BinaryNumberSelectorState();
}

class _BinaryNumberSelectorState extends State<BinaryNumberSelector> {
  List<String> splitedStringNumber;
  @override
  void initState() {
    super.initState();
    splitedStringNumber = widget.initBinaryNumber.split('');
  }

  List<Widget> buildNumbersWidgets() {
   List<Widget> numbersWidgets = [];

   splitedStringNumber.asMap().forEach((int index, String number) {
     numbersWidgets.add(Padding(
       padding: const EdgeInsets.only(right: 2.0),
       child: Number(
         number: number,
         onNumberChange: (newNumber) {
           splitedStringNumber[index] = newNumber;
           final newBinaryNumber = splitedStringNumber.join('');
           widget.onNumberChange(newBinaryNumber);
         },
       ),
     ));
   });

   return numbersWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: buildNumbersWidgets(),
    );
  }
}

class Number extends StatefulWidget {
  String number;
  final Function onNumberChange;

  Number({@required this.number, @required this.onNumberChange});

  @override
  _NumberState createState() => _NumberState();
}

class _NumberState extends State<Number> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ArrowButton(onPressed: () {
          setState(() {
            widget.number = '1';
            widget.onNumberChange('1');
          });
        }, direction: ArrowButtonDirection.up, active: widget.number == '0',),
        Text(
          widget.number,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        ArrowButton(onPressed: () {
          setState(() {
            widget.number = '0';
            widget.onNumberChange('0');
          });
        }, direction: ArrowButtonDirection.down, active: widget.number == '1',)
      ],
    );
  }
}


