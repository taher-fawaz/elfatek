import 'package:card_settings/card_settings.dart';
import 'package:elfatek/constants.dart';
import 'package:elfatek/model/customer_registration.dart';
import 'package:elfatek/screens/customer_registration/components/customer_product.dart';
import 'package:elfatek/screens/customer_registration/components/customer_contacts.dart';
import 'package:elfatek/screens/customer_registration/components/customer_details.dart';
import 'package:elfatek/screens/customer_registration/components/customer_status.dart';

import 'package:flutter/material.dart';

class CustomerRegistrationScreen extends StatefulWidget {
  static String routeName = "/customer_registration";
  CustomerRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<CustomerRegistrationScreen> createState() =>
      _CustomerRegistrationScreenState();
}

class _CustomerRegistrationScreenState extends State<CustomerRegistrationScreen>
    with TickerProviderStateMixin {
  int pageIndex = 0;
  CustomerRegistration customerRegistration = CustomerRegistration();

  @override
  Widget build(BuildContext context) {
    TabController controller =
        TabController(length: 4, vsync: this, initialIndex: pageIndex);

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 50),
          child: AppBar(
            elevation: 0,
            bottom: TabBar(
              enableFeedback: true,
              labelColor: Colors.white,
              indicatorColor: kPrimaryLightColorLight,
              labelStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
              onTap: (value) {
                setState(() {
                  pageIndex = value;
                });
                print(value);
              },
              controller: controller,
              tabs: const [
                // Icon(Icons.ac_unit_outlined),
                Tab(
                  text: "Details",
                ),
                Tab(
                  text: 'Contacts',
                ),
                Tab(
                  text: 'Status',
                ),
                Tab(
                  text: 'Product',
                ),
              ],
            ),
            // title: Text('Tabs Demo'),
          ),
        ),
        body: //  TabBarView(  <--- replace with **VerticalTabBarView**
            Column(
          children: [
            Visibility(
                visible: pageIndex == 0 ? true : false,
                child: CustomerDetailsSection(customerRegistration)),
            Visibility(
                visible: pageIndex == 1 ? true : false,
                child: CustomerContactsSection(customerRegistration)),
            Visibility(
                visible: pageIndex == 2 ? true : false,
                child: CustomerStatus()),
            Visibility(
                visible: pageIndex == 3 ? true : false,
                child: CustomerProductSection(customerRegistration)),
          ],
        ),
      ),
    );
    // Column(
    //   children: const [

    //   ],
    // );
  }
}
