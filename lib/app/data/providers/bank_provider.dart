import 'package:yuk_kuy_mobile/app/data/models/bank_model.dart';

import 'base_provider.dart';

class BankProvider extends BaseProvider {
  Future<BankModel> listBank(int id) async {
    var response = await get('accounts/banks/$id');

    print(response.body.toString());

    if (!response.body['status']) {
      return Future.error(response.body["message"]);
    } else {
      return bankModelFromJson(response.bodyString.toString());
    }
  }
}
