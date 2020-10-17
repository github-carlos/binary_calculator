import 'package:binary_calculator/constants.dart';
import 'package:binary_calculator/pages/home/widgets/binaryNumberSelector.dart';
import 'package:binary_calculator/pages/home/widgets/binaryWidgetDivider.dart';
import 'package:binary_calculator/pages/home/widgets/operationResult.dart';
import 'package:binary_calculator/pages/home/widgets/operatorSelector.dart';
import 'package:binary_calculator/services/binary_calculator.dart';
import 'package:binary_calculator/services/erro_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String firstBinaryNumber = '00000000';
  String secondBinaryNumber = '00000000';
  String operationResult = '00000000';
  BinaryCalculatorOperation operation = BinaryCalculatorOperation.sum;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
            ),
            Opacity(
              opacity: 1,
              child: Container(
                color: Colors.black54,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: SvgPicture.asset(
                    'assets/icons/logo.svg',
                    width: 80,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text(
                      'BINARY CALCULATOR',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 33,
                          fontWeight: FontWeight.bold,
                          color: kTitleColor,
                          fontFamily: 'Monospace'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: OperatorSelector(
                          operator: operation,
                          onOperationChange: (newOperator) {
                            setState(() {
                              operation = newOperator;
                              callBinaryCalculatorService();
                            });
                          }),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BinaryNumberSelector(
                              initBinaryNumber: firstBinaryNumber,
                              onNumberChange: (String binaryNumber) {
                                firstBinaryNumber = binaryNumber;
                                setState(() {
                                  callBinaryCalculatorService();
                                });
                              },
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            BinaryNumberSelector(
                              initBinaryNumber: secondBinaryNumber,
                              onNumberChange: (String binaryNumber) {
                                secondBinaryNumber = binaryNumber;
                                setState(() {
                                  callBinaryCalculatorService();
                                });
                              },
                            ),
                            BinaryWidgetDivider(),
                            OperationResult(number: operationResult)
                          ]),
                    ),
                  ],
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 3.0),
                  child: Text('Feito por Carlos Eduardo @caeduob', style: TextStyle(color: Colors.white54, fontSize: 18),),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void callBinaryCalculatorService() {
    try {
      operationResult = BinaryCalculator.calculate(
          operation, firstBinaryNumber, secondBinaryNumber);
    } catch(error) {
      ErrorHandler.handle(error, context);
    }
  }
}
