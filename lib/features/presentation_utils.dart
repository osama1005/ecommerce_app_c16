import 'package:ecommerce_app/domain/exceptions/exception.dart';
import 'package:flutter/material.dart';

extension ContextErrorMessageExtractor on BuildContext {
  String getErrorMessage(Exception e) {
    if (e is ServerError) {
      return e.message ?? "something went wrong";
    } else if (e is NoInternetException) {
      return "no internet connection";
    }
    return "something went wrong";
  }
}
