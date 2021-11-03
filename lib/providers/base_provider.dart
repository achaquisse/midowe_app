import 'package:http/http.dart' as http;

class BaseProvider {
  static final String cmsBaseUrl =
      "https://001g2h0pa1.execute-api.af-south-1.amazonaws.com/prd";
  static final String accountingBaseUrl =
      "https://053qw3mji7.execute-api.af-south-1.amazonaws.com";

  Future<http.Response> post(String path, String body) async {
    return await http.post(Uri.parse("$cmsBaseUrl$path"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body);
  }

  Future<http.Response> cmsGet(String path) async {
    return await http
        .get(Uri.parse("$cmsBaseUrl$path"), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
  }

  Future<http.Response> accountingGet(String path) async {
    return await http
        .get(Uri.parse("$accountingBaseUrl$path"), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
  }
}
