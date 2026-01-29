import 'package:ecommerce_app/api/model/response/login_response.dart';
import 'package:ecommerce_app/domain/model/auth_result.dart';

abstract class AuthLocalDataSource {
  Future<void> saveAuthData(AuthResult authResult);

  Future<String?> getToken();

  Future<User> getUserData();

  Future<bool> isLoggedIn();

  Future<void> clearAuthData();
}
