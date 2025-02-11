import 'package:flutter_test/flutter_test.dart';
import 'package:string_calculator/string_calculator/calculator_exceptions.dart';
import 'package:string_calculator/string_calculator/string_calculator.dart';

void main() {
  group("String calculator", () {
    StringCalculator stringCalculator = StringCalculator();
    test("if String is empty", () {
      try {
        stringCalculator.add(" ");
      } catch (e) {
        expect(e, CalculatorExceptions.kEmptyString);
      }
    });

    test("if String is invalid ", () {
      try {
        stringCalculator.add("a,b");
      } catch (e) {
        expect(e, CalculatorExceptions.kInvalidString);
      }
    });

    test('if String is 1,2,3', () {
      final int result = stringCalculator.add("1,2,3");
      expect(result, 6);
    });

    test('if String contain newline \n1\n2,3', () {
      final int result = stringCalculator.add("\n1\n2,3");
      expect(result, 6);
    });

    test('if String contain negative no -1\n2,3', () {
      try {
        stringCalculator.add("-1\n2,3");
      } catch (e) {
        expect(e, "${CalculatorExceptions.kNegativeNumNotAllowed} -1");
      }
    });

    test('if String contain delimiter //;\n1\n2;3', () {
      final int result = stringCalculator.add("//;\n1\n2;3");
      expect(result, 6);
    });

    test('if String contain delimiter and negative no //;\n1\n-2;3', () {
      try {
        stringCalculator.add("//;\n1\n-2;-3");
      } catch (e) {
        expect(e, "${CalculatorExceptions.kNegativeNumNotAllowed} -2;-3");
      }
    });
  });
}
