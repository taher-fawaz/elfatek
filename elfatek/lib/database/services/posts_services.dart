import 'dart:io';

import 'package:elfatek/model/customer_registration.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class BasicServices {
  // final Map<String, String> requestHeaders;
  // final String url;
  // BasicServices(
  // [this.requestHeaders = const {
  //   'Content-type': 'application/json',
  //   'Accept': 'application/json',
  //   'Connection': 'keep-alive'
  //   // "Authorization": "Bearer $_token",
  // },
  //     this.url = 'http://192.168.1.7/elfatek/public/api/']);
  getRequest();
  createRecord(CustomerRegistration data);
}
