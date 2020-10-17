class DivisionByZeroError implements Exception {
  @override
  String toString() {
    return 'Cannot perform a division by zero';
  }
}