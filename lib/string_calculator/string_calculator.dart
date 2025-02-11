import 'package:string_calculator/string_calculator/calculator_exceptions.dart';

class StringCalculator {
  int add(String numbers) {
    if (numbers.trim().isEmpty) {
      return 0;
    }

    if (!numbers.contains(RegExp("[0-9]"))) {
      throw CalculatorExceptions.kInvalidString;
    }

    return _calculate(numbers);
  }

  int _calculate(String numbers) {
    String delimiter = ",";

    if (numbers.startsWith("//")) {
      int delimiterEndIndex = numbers.indexOf("\n");
      delimiter = _getDelimiter(numbers, delimiterEndIndex);
      numbers = numbers.substring(delimiterEndIndex + 1);
    }

    List<int> numbersList = numbers
        .replaceAll("\n", delimiter)
        .split(delimiter)
        .map((e) => int.tryParse(e) ?? 0)
        .toList();

    final String negativeNumbers =
        numbersList.where((e) => e.isNegative).join(delimiter);

    if (negativeNumbers.trim().isNotEmpty) {
      throw "${CalculatorExceptions.kNegativeNumNotAllowed} $negativeNumbers";
    }

    return numbersList.reduce((value, element) => value + element);
  }

  String _getDelimiter(String numbers, int delimiterEndIndex) {
    final String inputDelimiter = numbers.substring(2, delimiterEndIndex);
    return inputDelimiter;
  }
}
