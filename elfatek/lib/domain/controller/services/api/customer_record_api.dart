import 'base_api.dart';
import '../../../model/customer_interview.dart';
import '../../../model/customer_registration.dart';
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

  Future deleteCustomerRecord({required int id}) async {
    final response = await http.delete(
        Uri.parse("${super.customersRecord}/$id"),
        headers: {},
        body: {});
  }

  Future updateCustomerRecord(
      {required CustomerRegistration data, required int id}) async {
    final response = await http.put(
        Uri.parse("http://192.168.1.9/elfatek/public/api/customer_record/$id"),
        headers: {
          "Content-Type": "application/json",
          'Connection': 'keep-alive',
          'Accept-Encoding': 'gzip, deflate, br',
          'Accept': 'application/json',
        },
        body: customerRegistrationToJson(data));

    print(response.statusCode);
    print(response.request);
  }

  Future createCustomerInterview(CustomerInterview data) async {
    final response = await http.post(Uri.parse(super.customersInterview),
        headers: headers, body: customerInterviewToJson(data));
    print(response.statusCode);
  }
}
