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

  List<Number> buildNumbersWidgets() {
   List<Number> numbersWidgets = [];

   splitedStringNumber.asMap().forEach((int index, String number) {
     numbersWidgets.add(Number(
       number: number,
       onNumberChange: (newNumber) {
         splitedStringNumber[index] = newNumber;
         final newBinaryNumber = splitedStringNumber.join('');
         widget.onNumberChange(newBinaryNumber);
       },
     ));
   });

   return numbersWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
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
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              widget.number = '1';
              widget.onNumberChange('1');
            });
          },
          icon: Transform.rotate(
              angle: 3.14,
              child: SvgPicture.asset(
                'assets/icons/arrow.svg',
                width: 25,
              )),
        ),
        Text(
          widget.number,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              widget.number = '0';
              widget.onNumberChange('0');
            });
          },
          icon: SvgPicture.asset('assets/icons/arrow.svg', width: 25),
        ),
      ],
    );
  }
}
