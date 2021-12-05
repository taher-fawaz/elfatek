import 'package:elfatek/screens/customer_registration/components/customer_adress.dart';
import 'package:elfatek/screens/customer_registration/components/customer_contacts.dart';
import 'package:elfatek/screens/customer_registration/components/customer_details.dart';
import 'package:elfatek/screens/customer_registration/components/customer_status.dart';

import 'package:flutter/material.dart';

class CustomerRegistrationScreen extends StatelessWidget {
  static String routeName = "/customer_registration";

  const CustomerRegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          CustomerDetailsSection(),
          CustomerAdressSection(),
          CustomerContactsSection(),
          CustomerStatus(),
        ],
      ),
    );
  }
}
