import 'dart:math';
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
    switch(operator) {
      case BinaryCalculatorOperation.sum:
        return BinaryCalculator._sum(firstBinaryNumber, secondBinaryNumber);
      case BinaryCalculatorOperation.minus:
        return BinaryCalculator._minus(firstBinaryNumber, secondBinaryNumber);
      case BinaryCalculatorOperation.divide:
        return BinaryCalculator._divide(firstBinaryNumber, secondBinaryNumber);
      case BinaryCalculatorOperation.multiply:
        return BinaryCalculator._multiply(firstBinaryNumber, secondBinaryNumber);
      case BinaryCalculatorOperation.module:
        return BinaryCalculator._module(firstBinaryNumber, secondBinaryNumber);
      default:
        return '';
    }
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

  static String _divide(String firstBinaryNumber, String secondBinaryNumber) {
    print('calculando divisão');
    return '00000000';
  }

  static String _sum(String firstBinaryNumber, String secondBinaryNumber) {
    print('calculando soma');
    return '00000000';
  }

  static String _minus(String firstBinaryNumber, String secondBinaryNumber) {
    print('calculando subtração');
    return '00000000';
  }

  static String _module(String firstBinaryNumber, String secondBinaryNumber) {
    print('calculando modulo');
    return '00000000';
  }

  static String _multiply(String firstBinaryNumber, String secondBinaryNumber) {
    print('calculando multiplicação');
    return '00000000';
  }
}