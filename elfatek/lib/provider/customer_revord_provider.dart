import 'package:elfatek/model/customer_registration.dart';
import 'package:flutter/material.dart';

class CutomerRecords with ChangeNotifier {
  List<CustomerRegistration> _customerRegistration = [];
  // var _showFavoritesOnly = false;

  List<CustomerRegistration> get items {
    return [..._customerRegistration];
  }

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }
}
