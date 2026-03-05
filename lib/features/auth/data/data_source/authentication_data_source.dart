import 'package:ecommerce_app/features/auth/domain/entities/sign_in_request_data.dart';
import 'package:ecommerce_app/features/auth/domain/entities/sign_up_request_data.dart';

abstract class AuthenticationInterfaceDataSource {
  Future<void> signInWithCredentials({required SignInRequestData data});

  Future<void> signUpWithCredentials({required SignUpRequestData data});

  Future<void> forgetPassword({required String email});
}

