import 'package:get/get.dart';

import '../middlewares/auth_middleware.dart';
import '../modules/base/bindings/base_binding.dart';
import '../modules/base/views/base_view.dart';
import '../modules/detail_product/bindings/detail_product_binding.dart';
import '../modules/detail_product/views/detail_product_view.dart';
import '../modules/detail_transaction/binding/detail_transaction_binding.dart';
import '../modules/detail_transaction/views/verification_success_view.dart';
import '../modules/favorite/bindings/favorite_binding.dart';
import '../modules/favorite/views/favorite_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login_register/bindings/login_register_binding.dart';
import '../modules/login_register/views/login_view.dart';
import '../modules/payment/bindings/payment_binding.dart';
import '../modules/payment/views/payment_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/seller_profile/bindings/seller_profile_binding.dart';
import '../modules/seller_profile/views/seller_profile_view.dart';
import '../modules/transaction/bindings/transaction_binding.dart';
import '../modules/transaction/views/transaction_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initialB = Routes.base;
  static const initial = Routes.home;
  static const initialLR = Routes.loginRegister;
  static const initialDP = Routes.detailProduct;
  static const initialP = Routes.payment;
  static const initialSP = Routes.sellerProfile;
  static const initialDT = Routes.detailTransaction;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.detailProduct,
      page: () => const DetailProductView(),
      binding: DetailProductBinding(),
    ),
    GetPage(
      name: _Paths.loginRegister,
      page: () => LoginView(),
      binding: LoginRegisterBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: _Paths.profile,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.transaction,
      page: () => TransactionView(),
      binding: TransactionBinding(),
    ),
    GetPage(
      name: _Paths.base,
      page: () => const BaseView(),
      binding: BaseBinding(),
    ),
    GetPage(
      name: _Paths.favorite,
      page: () => const FavoriteView(),
      binding: FavoriteBinding(),
    ),
    GetPage(
      name: _Paths.payment,
      page: () => PaymentView(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: _Paths.sellerProfile,
      page: () => const SellerProfileView(),
      binding: SellerProfileBinding(),
    ),
    GetPage(
      name: _Paths.detailTransaction,
      page: () => const VerificationSuccessView(),
      binding: DetailTransactionBinding(),
    ),
  ];
}
