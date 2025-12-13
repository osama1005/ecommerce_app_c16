import 'package:ecommerce_app/domain/api_result.dart';
import 'package:ecommerce_app/domain/model/auth_result.dart';

abstract class AuthRepository {
  Future<Result<AuthResult>> login(String email, String password);
}