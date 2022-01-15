class BaseAPI {
  static String base = "http://192.168.1.7/elfatek/public";
  static var api = base + "/api";
  var customersRecord = api + "/customer_record";
  var register = api + "/register";
  var loginPath = api + "/login";
  var logoutPath = api + "/logout";

  // more routes
  Map<String, String> headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Connection': 'keep-alive'
    // "Authorization": "Bearer $_token",
  };
}
