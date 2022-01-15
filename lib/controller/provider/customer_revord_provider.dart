// import '../../model/customer_registration.dart';
// import 'package:flutter/material.dart';

// class CutomerRecords with ChangeNotifier {
//   final List<CustomerRegistration> _customerRegistrationList = [];

//   List<CustomerRegistration> get customerRegistrationList {
//     return [..._customerRegistrationList];
//   }

//   void addRecord(CustomerRegistration customerRegistration) {
//     final newRecord = CustomerRegistration(
//       customerName: customerRegistration.customerName,
//       customerTitle: customerRegistration.customerTitle,
//       customerAuthorizedName: customerRegistration.customerAuthorizedName,
//       customerSatisfied: customerRegistration.customerSatisfied,
//     );
//     // _customerRegistrationList.add(newRecord);
//     _customerRegistrationList.insert(0, newRecord); // at the start of the list
//     notifyListeners();
//   }
// }
