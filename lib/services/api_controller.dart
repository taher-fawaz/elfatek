// import 'package:elfatek/database/services/posts_services.dart';
// import 'package:elfatek/model/customer_registration.dart';
// import 'package:http/http.dart' as http;

// class ApiController implements BasicServices {
//   final requestHeaders = {
//     'Content-type': 'application/json',
//     'Accept': 'application/json',
//     'Connection': 'keep-alive'
//     // "Authorization": "Bearer $_token",
//   };
//   static final url =
//       Uri.parse('http://192.168.1.7/elfatek/public/api/customer_record');
//   @override
//   Future getRequest() async {
//     var response = await http.get(url, headers: requestHeaders);
//     final customerRegistration = customerRegistrationFromJson(response.body);
//     print('Response status: ${response.statusCode}');

//     return customerRegistration;
//   }

//   @override
//   createRecord(CustomerRegistration data) async {
//     final response = await http
//         .post(url,
//             headers: requestHeaders, body: customerRegistrationToJson(data))
//         .then((response) => print(response.body));
//   }
// }
