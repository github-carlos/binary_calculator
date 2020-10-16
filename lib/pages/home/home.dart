import 'package:binary_calculator/pages/home/widgets/binaryNumberSelector.dart';
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
            BinaryNumberSelector(initBinaryNumber: '00000000', onNumberChange: (String binaryNumber) {
              print('first binary number $binaryNumber');
            },),
          ],
        ),
      ),
    );
  }
}
