import '../models/profile_model.dart';
import 'base_provider.dart';

class ProfileProvider extends BaseProvider {
  Future<ProfileModel> detailProfile(String username) async {
    var response = await get('accounts/$username');

    print(response.body.toString());

    if (!response.body['status']) {
      return Future.error(response.body["message"]);
    } else {
      return profileModelFromJson(response.bodyString.toString());
    }
  }
}
