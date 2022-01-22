import '../services/api/customer_record_api.dart';

import '../../model/customer_registration.dart';
import 'package:flutter/material.dart';

class CutomerRecords with ChangeNotifier {
  // final List<CustomerRegistration> _customerRegistrationList = [];

  // List<CustomerRegistration> get customerRegistrationList {
  //   return [..._customerRegistrationList];
  // }

  Future<void> updateRecord(
      // CustomerRegistration customerRegistration,
      cells,
      index,
      value,
      userId,
      List<CustomerRegistration> customerRegistrationList) async {
    CustomerRegistration cr = customerRegistrationList
        .firstWhere((CustomerRegistration cr) => cr.id == cells[0]);
    cells[index] = value;
    cr = CustomerRegistration(
      customerName: cells[1],
      customerTitle: cells[2],
      customerAuthorizedName: cells[3],
      customerSatisfied: cells[27],
      userId: userId,
      registrationDate: DateTime.now(),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      id: cells[0],
    );
    await CustomerRecordsAPI().updateCustomerRecord(
      data: cr, id: cells[0],
      //     CustomerRegistration(
      // customerName: cells[1],
      // customerTitle: cells[2],
      // customerAuthorizedName: cells[3],
      // customerSatisfied: cells[27],
      // userId: userProvider.id,
      // registrationDate: DateTime.now(),
      // createdAt: DateTime.now(),
      // updatedAt: DateTime.now(),
      // customerName: 'ct',
      // customerTitle: 'cusTitleController.text',
      // customerAuthorizedName: 'cusRepController.text',
      // id: cells[0],
      //   userId: userProvider.id,
      //   customerSatisfied: 0,
      //   adress: 'adressController.text',
      //   availableProductBrand: 'xt',
      //   businessPhone1: 1,
      //   // int.parse(_businessPhone1Controller.text),
      //   businessPhone2: 2,
      //   // int.parse(_businessPhone2Controller.text),
      //   taxNumber: 1,
      //   // int.parse(_taxNumberController.text),
      //   faxNumber: 1,
      //   // int.parse(_faxNumberController.text),
      //   gsmNumber: 1,
      //   // int.parse(_gsmNumberController.text),
      //   city: 'sa',
      //   country: 'dsds',
      //   currentMainGroup:
      //       PickerModel('Group 1', code: 'M').name,
      //   currentSecondGroup:
      //       PickerModel('Group 1', code: 'M').name,
      //   customerRepresentative: 'sa',
      //   customerStatus: 'xz',
      //   district: 'cx',
      //   email1: 'vc',
      //   email2: 'n',
      //   explanation: 'mu',
      //   showReference: 0,
      //   websiteAddress: 'cx',
      //   taxAdministration: 'nbm',
      //   productQuantity: 2,
      //   isActive: 0,
      //   dealerProbability: 1,
      //   franchisePossibility: 2,
      //   registrationDate: DateTime.now(),
      //   createdAt: DateTime.now(),
      //   updatedAt: DateTime.now(),
      // ),
    );
    notifyListeners();
  }
}
