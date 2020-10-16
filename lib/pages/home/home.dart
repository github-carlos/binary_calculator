import 'package:binary_calculator/pages/home/widgets/binaryNumberSelector.dart';
import 'package:binary_calculator/pages/home/widgets/operatorSelector.dart';
import 'package:binary_calculator/services/binary_calculator.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Binary Calculator',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  )
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: OperatorSelector(operator: BinaryCalculatorOperation.sum, onOperationChange: (newOperator) {
                    print('novo operador $newOperator');
                  }),
                ),
                SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: Column(
                    children: [
                      BinaryNumberSelector(initBinaryNumber: '00000000', onNumberChange: (String binaryNumber) {
                        print('first binary number $binaryNumber');
                      },),
                      BinaryNumberSelector(initBinaryNumber: '00000000', onNumberChange: (String binaryNumber) {
                        print('second binary number $binaryNumber');
                      },),
                      Container(
                        margin: EdgeInsets.only(right: 30),
                        height: 2,
                        color: Colors.black,
                      ),
                      Text('Resposta')
                   ]
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
