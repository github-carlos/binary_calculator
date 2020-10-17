import 'dart:math';

import 'package:binary_calculator/services/exceptions.dart';
enum BinaryCalculatorOperation {
  divide,
  sum,
  minus,
  multiply,
  module
}

// print('binario em decimal ${int.parse(initBinaryNumber, radix=2)}')
class BinaryCalculator {
  static String calculate(BinaryCalculatorOperation operator, String firstBinaryNumber, String secondBinaryNumber) {

    final firstNumberInDecimal = convertBinaryToDecimal(firstBinaryNumber);
    final secondNumberInDecimal = convertBinaryToDecimal(secondBinaryNumber);
    int result;
    switch(operator) {
      case BinaryCalculatorOperation.sum:
        result = BinaryCalculator._sum(firstNumberInDecimal, secondNumberInDecimal);
        break;
      case BinaryCalculatorOperation.minus:
        result = BinaryCalculator._minus(firstNumberInDecimal, secondNumberInDecimal);
        break;
      case BinaryCalculatorOperation.divide:
        result = BinaryCalculator._divide(firstNumberInDecimal, secondNumberInDecimal);
        break;
      case BinaryCalculatorOperation.multiply:
        result = BinaryCalculator._multiply(firstNumberInDecimal, secondNumberInDecimal);
        break;
      case BinaryCalculatorOperation.module:
        result = BinaryCalculator._module(firstNumberInDecimal, secondNumberInDecimal);
        break;
      default:
        return '';
    }
    final resultInBinary = BinaryCalculator.convertDecimalToBinary(result);

    return fillResponseWithZeros(resultInBinary);
  }
  static int convertBinaryToDecimal(String binaryNumber) {
    final splitedNumber = binaryNumber.split('');
    int index = splitedNumber.length - 1;
    int expo = 1;
    int decimalValue = 0;
    while(index >= 0) {
      final int value = int.parse(splitedNumber[index--]);
      if (value != 0) {
        decimalValue += expo;
      }
      expo *=2;
    }
    return decimalValue;
  }
  static String convertDecimalToBinary(int decimal) {
    int binaryValue = 0;
    int i = 1;
   while(decimal > 0) {
      binaryValue = binaryValue + (decimal % 2)*i;
      decimal = (decimal/2).floor();
      i = i * 10;
    }
    return binaryValue.toString();
  }

  static String fillResponseWithZeros(String binaryNumber) {
    if (binaryNumber.length == 8) {
      return binaryNumber;
    }
    final missingZeros = 8 - binaryNumber.length;
    return ('0' * missingZeros) + binaryNumber;
  }

  static int _divide(int firstNumber, int secondNumber) {
    if (secondNumber == 0) {
      throw DivisionByZeroError();
    }
    return firstNumber ~/ secondNumber;
  }

  static int _sum(int firstNumber, int secondNumber) {
    return firstNumber + secondNumber;
  }

  static int _minus(int firstNumber, int secondNumber) {
    return firstNumber - secondNumber;
  }

  static int _module(int firstNumber, int secondNumber) {
    return firstNumber % secondNumber;
  }

  static int _multiply(int firstNumber, int secondNumber) {
    return firstNumber * secondNumber;
  }
}