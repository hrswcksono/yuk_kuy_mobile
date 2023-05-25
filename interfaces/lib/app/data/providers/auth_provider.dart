import '../models/login_model.dart';
import 'base_provider.dart';

class LoginProvider extends BaseProvider {
  Future<LoginModel> login(String email, String password) async {
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

  Future<String> register(String username, String name, String email,
      String password, String confimPassword) async {
    Map<String, String> jsonBody = {
      'username': username,
      'name': name,
      'email': email,
      'password': password,
      'confirmPassword': confimPassword
    };

    var response = await post(
      'accounts/mobile/register',
      jsonBody,
      contentType: "application/x-www-form-urlencoded",
    );

    if (!response.body['status']) {
      return Future.error(response.body["message"]);
    } else {
      return response.body.toString();
    }
  }
}
