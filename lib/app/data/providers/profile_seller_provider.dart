import '../models/profile_selller.dart';
import 'base_provider.dart';

class ProfileSellerProvider extends BaseProvider {
  Future<ProfileSellerModel> detailProfile(String username) async {
    var response = await get('accounts/seller/$username');

    print(response.body.toString());

    if (!response.body['status']) {
      return Future.error(response.body["message"]);
    } else {
      return profileSellerModelFromJson(response.bodyString.toString());
    }
  }
}
