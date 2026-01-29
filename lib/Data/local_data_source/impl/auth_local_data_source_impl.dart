import 'dart:convert';

import 'package:ecommerce_app/Data/local_data_source/contract/auth_local_data_soursce.dart';
import 'package:ecommerce_app/api/model/response/login_response.dart';
import 'package:ecommerce_app/domain/model/auth_result.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  static const String _keyToken = 'user_token';
  static const String _keyUser = 'user_data';

  final FlutterSecureStorage _secureStorage;
  AuthLocalDataSourceImpl(this._secureStorage);


  @override
  Future<void> clearAuthData() async {
    return _secureStorage.delete(key: _keyToken);
  }

  @override
  Future<String?> getToken() async {
    return await _secureStorage.read(key: _keyToken);
  }

  @override
  Future<User> getUserData() async {
    final userData = await _secureStorage.read(key: _keyUser);
    if (userData != null) {
      final map = jsonDecode(userData);
      return User(
        name: map['name'],
        email: map['email'],
        role: map['role'],
      );
    }
    return User(name: '', email: '', role: '');
  }

  @override
  Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null;
  }

  @override
  Future<void> saveAuthData(AuthResult authResult) async {
    await _secureStorage.write(key: _keyToken, value: authResult.token);
    final userData = jsonEncode({
      'name': authResult.user.name,
      'email': authResult.user.email,
      'role': authResult.user.role,
    });


    await _secureStorage.write(key: _keyUser, value: userData);
  }
}
