import 'package:flutter/material.dart';


class PaymentProvider extends ChangeNotifier {
  int _selectedPaymentType = 1; 

  int get selectedPaymentType => _selectedPaymentType;

  void handleRadioSelection(Object? value) {
    _selectedPaymentType = value as int;
    notifyListeners();
  }
}