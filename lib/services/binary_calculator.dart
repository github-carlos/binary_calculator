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
    print('Doing binary calculations');
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

  static String _divide(String firstBinaryNumber, String secondBinaryNumber) {
    print('calculando divisão');
  }

  static String _sum(String firstBinaryNumber, String secondBinaryNumber) {
    print('calculando soma');
  }

  static String _minus(String firstBinaryNumber, String secondBinaryNumber) {
    print('calculando subtração');
  }

  static String _module(String firstBinaryNumber, String secondBinaryNumber) {
    print('calculando modulo');
  }

  static String _multiply(String firstBinaryNumber, String secondBinaryNumber) {
    print('calculando multiplicação');
  }
}