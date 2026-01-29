import 'package:ecommerce_app/domain/api_result.dart';
import 'package:ecommerce_app/domain/model/auth_result.dart';
import 'package:ecommerce_app/domain/model/user_entity.dart';

abstract class AuthRepository {
  Future<Result<AuthResult>> login(String email, String password);

  Future<String?> getToken();

  Future<UserEntity> getCachedUser();

  Future<bool> isLoggedIn();

  Future<void> logout();
}