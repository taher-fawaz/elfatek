import 'package:elfatek/domain/controller/services/api/base_api.dart';
import 'package:elfatek/domain/model/customer_interview.dart';
import 'package:elfatek/domain/model/customer_registration.dart';
import 'package:http/http.dart' as http;

class CustomerRecordsAPI extends BaseAPI {
  Future fetchCustomerRecordsData({required int userId}) async {
    var response = await http
        .get(Uri.parse('${super.customersRecord}/$userId}'), headers: headers);
    final customerRegistration = customerRegistrationFromJson(response.body);
    print('Response status: ${response.statusCode}');

    return customerRegistration;
  }

  Future createCustomerRecord(CustomerRegistration data) async {
    final response = await http.post(Uri.parse(super.customersRecord),
        headers: headers, body: customerRegistrationToJson(data));
  }

  Future createCustomerInterview(CustomerInterview data) async {
    final response = await http.post(Uri.parse(super.customersInterview),
        headers: headers, body: customerInterviewToJson(data));
    print(response.statusCode);
  }
}
