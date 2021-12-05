import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../../../translations/locale_keys.g.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  final bool isCustomerSatisfied = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(width: double.infinity, child: Container()),
    );
  }
}
