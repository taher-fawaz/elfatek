import 'base_api.dart';
import '../../../model/customer_interview.dart';
import '../../../../features/customer_registration/domain/models/customer_registration.dart';
import 'package:http/http.dart' as http;

class CustomerRecordsAPI extends BaseAPI {
  Future<List<CustomerRegistrationModel>> fetchCustomerRecordsData(
      {required int userId}) async {
    final http.Response response = await http
        .get(Uri.parse('${super.customersRecord}/$userId}'), headers: headers);
    final customerRegistration =
        customerRegistrationModelFromJson(response.body);

    return customerRegistration;
  }

  Future<void> createCustomerRecord(CustomerRegistrationModel data) async {
    await http.post(Uri.parse(super.customersRecord),
        headers: headers, body: customerRegistrationModelToJson(data));
  }

  Future<void> deleteCustomerRecord({required int id}) async {
    await http.delete(Uri.parse("${super.customersRecord}/$id"),
        headers: {}, body: {});
  }

  Future<void> updateCustomerRecord(
      {required CustomerRegistrationModel data, required int id}) async {
    await http.patch(Uri.parse("${super.customersRecord}/$id"),
        headers: super.headers, body: customerRegistrationModelToJson(data));
  }

  Future<void> createCustomerInterview(CustomerInterview data) async {
    await http.post(Uri.parse(super.customersInterview),
        headers: headers, body: customerInterviewToJson(data));
  }

  Future<List<CustomerInterview>> fetchCustomerInterviewData(
      {required int userId}) async {
    final http.Response response = await http.get(
        Uri.parse('${super.customersInterview}/$userId}'),
        headers: headers);
    final customersInterview = customerInterviewFromJson(response.body);

    return customersInterview;
  }

  Future<void> deleteCustomerInterview({required int id}) async {
    await http.delete(Uri.parse("${super.customersInterview}/$id"),
        headers: {}, body: {});
  }

  Future<void> updateCustomerInterview(
      {required CustomerInterview data, required int id}) async {
    await http.put(Uri.parse("${super.customersInterview}/$id"),
        headers: super.headers, body: customerInterviewToJson(data));
  }
}
