import 'package:ecommerce_app/core/handler/auth_handler/auth_handler_shared_pref.dart';
import 'package:ecommerce_app/core/network_handler/api_interface.dart';
import 'package:ecommerce_app/core/network_handler/dio_api_client.dart';
import 'package:ecommerce_app/features/auth/di/authentication_di.dart';
import 'package:ecommerce_app/features/main_layout/home/di/home_di.dart';
import 'package:get_it/get_it.dart';

var getIt = GetIt.instance;

abstract class AppDiCore {
  static Future<void> setup() async {
    configSetup().then(
      (value) {
        AuthenticationDi.setup();
        HomeDi.setup();
      },
    );
  }

  static Future<void> configSetup() async {
    getIt.registerLazySingleton(
      () => AuthHandlerSharedPref(),
    );

    getIt.registerLazySingleton<ApiInterface>(
      () => DioApiClient(),
    );
  }
}
