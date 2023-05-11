import 'base_provider.dart';

class RegisterProvider extends BaseProvider {
  Future<String> provider(String email, String password) async {
    Map<String, String> jsonBody = {
      'key': email,
      'password': password,
    };

    var response = await post(
      'accounts/mobile/register',
      jsonBody,
      contentType: "application/x-www-form-urlencoded",
    );

    if (!response.body['status']) {
      return Future.error(response.body["message"]);
    } else {
      return response.body;
    }
  }
}
