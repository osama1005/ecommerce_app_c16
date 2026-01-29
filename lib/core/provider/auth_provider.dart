import 'dart:async';

import 'package:ecommerce_app/domain/model/user_entity.dart';
import 'package:ecommerce_app/domain/repos/auth_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthProvider extends ChangeNotifier{

  final AuthRepository _repository ;

  AuthProvider(this._repository){
    _loadCachedUser();

  }
  final Completer<void> _isInitializedCompleter = Completer<void>();
  bool _isInitialized = false ;

  UserEntity? _currentUser ;
  String? _token ;

  UserEntity? get currentUser => _currentUser ;
  String? get token => _token ;

  bool get isLoggedIn =>(_token != null && _currentUser != null);


  Future<void> waitisInitialized()async{
    if(_isInitialized)return;
    await _isInitializedCompleter.future;

  }

  Future<void> _loadCachedUser()async{
    try{
      _token = await _repository.getToken();
      _currentUser = await _repository.getCachedUser();
    }catch(e){
      _token = null ;
      _currentUser = null ;

    }finally{
      _isInitialized = true ;
      _isInitializedCompleter.complete();
      notifyListeners();
    }
  }
}