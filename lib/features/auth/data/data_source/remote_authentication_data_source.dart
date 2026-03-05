import 'package:ecommerce_app/features/auth/data/data_source/authentication_data_source.dart';
import 'package:ecommerce_app/features/auth/domain/entities/sign_in_request_data.dart';
import 'package:ecommerce_app/features/auth/domain/entities/sign_up_request_data.dart';

class RemoteAuthenticationDataSource implements AuthenticationInterfaceDataSource {

  /// WebService || API || HTTP || Dio
  /// Fetch || Get || Post || Put || Delete from Network
  /// Dio

  @override
  Future<void> signInWithCredentials({required SignInRequestData data}) {
    // TODO: implement signInWithCredentials
    throw UnimplementedError();
  }

  @override
  Future<void> signUpWithCredentials({required SignUpRequestData data}) {
    // TODO: implement signUpWithCredentials
    throw UnimplementedError();
  }

  @override
  Future<void> forgetPassword({required String email}) {
    // TODO: implement forgetPassword
    throw UnimplementedError();
  }
}