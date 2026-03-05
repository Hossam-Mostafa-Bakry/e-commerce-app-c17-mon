import 'package:ecommerce_app/features/auth/domain/entities/sign_in_request_data.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/authentication_repositories.dart';


/// UseCase ||SOILED PRINCIPLE ||
/// 1- Single Responsibility Principle

class SignInUseCase {
  final AuthenticationRepository _authenticationRepository;

  SignInUseCase(this._authenticationRepository);

  Future<void> execute({
    required SignInRequestData data,
  }) async {
    /// Repository
    _authenticationRepository.signInWithCredentials(
      data: data,
    );
  }
}
