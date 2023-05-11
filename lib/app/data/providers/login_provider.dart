import '../models/login_model.dart';
import 'base_provider.dart';

class LoginProvider extends BaseProvider {
  Future<LoginModel> provider(String email, String password) async {
    Map<String, String> jsonBody = {
      'key': email,
      'password': password,
    };

    var response = await post(
      'accounts/mobile/login',
      jsonBody,
      contentType: "application/x-www-form-urlencoded",
    );

    if (!response.body['status']) {
      return Future.error(response.body["message"]);
    } else {
      return loginModelFromJson(response.bodyString.toString());
    }
  }
}
