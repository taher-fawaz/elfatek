import 'package:http/http.dart' as http;
import 'dart:convert';

class CustomerRegistrationServices {
  // var client = http.Client();
  get() async {
    var url = Uri.parse('http://localhost/elfatek/public/api/customer_data');

    try {
      var response = await http.post(
          Uri.https('http://localhost/elfatek/public/', 'api/customer_data'),
          body: {
            'id': 2,
            'customer_name': 'taher',
            'customer_title': 'title',
            'customer_representative': 'blue',
            'adress': 'cairo'
          });
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    } finally {
      // client.close();
    }
  }
}
