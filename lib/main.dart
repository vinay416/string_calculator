import 'dart:developer' as dev;

import 'package:string_calculator/string_calculator/string_calculator.dart';

void main(List<String> args) {
  try {
    final result = StringCalculator().add("1,2,3");
    dev.log("result: $result");
  } catch (e) {
    dev.log("Error: $e");
  }
}
