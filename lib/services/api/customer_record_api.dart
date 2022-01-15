import 'package:elfatek/model/customer_registration.dart';
import 'package:elfatek/services/api/base_api.dart';
import 'package:http/http.dart' as http;

class CustomerRecordsAPI extends BaseAPI {
  Future fetchCustomerRecordsData() async {
    var response =
        await http.get(Uri.parse(super.customersRecord), headers: headers);
    final customerRegistration = customerRegistrationFromJson(response.body);
    print('Response status: ${response.statusCode}');

    return customerRegistration;
  }

  createCustomerRecord(CustomerRegistration data) async {
    final response = await http.post(Uri.parse(super.customersRecord),
        headers: headers, body: customerRegistrationToJson(data));
  }
}
