import 'package:ecommerce_app/domain/api_result.dart';
import 'package:ecommerce_app/domain/model/auth_result.dart';
import 'package:ecommerce_app/domain/useCase/login_use_case.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

enum LoginState { initial, loading, success, error }
@injectable
class LoginViewModel extends ChangeNotifier {
  final LoginUseCase _loginUseCase;
  LoginViewModel(this._loginUseCase);

  // state
  LoginState _state = LoginState.initial;
  Exception? _error;
  AuthResult? _authResult;

  //Getter
  LoginState get state => _state;
  Exception? get error => _error;
  AuthResult? get authResult => _authResult;
  bool get isLoading => _state == LoginState.loading;

  //Method
  Future<void> login(String email, password) async {
    // loading ui
    _state = LoginState.loading;
    _error = null;
    notifyListeners();

    final result = await _loginUseCase.call(email, password);
    switch(result){
      case Success<AuthResult>():{
        _state = LoginState.success;
        _authResult = result.data;
        notifyListeners();
      }
        case Failure<AuthResult>():{
          _state = LoginState.error;
          _error = result.exception;
          notifyListeners();
        }


    }
  }
}

// dataSources -> Repository -> useCase -> Vm ->View