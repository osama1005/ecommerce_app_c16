import 'package:ecommerce_app/Data/data_source/auth_data_sourse.dart';
import 'package:ecommerce_app/Data/local_data_source/contract/auth_local_data_soursce.dart';
import 'package:ecommerce_app/domain/api_result.dart';
import 'package:ecommerce_app/domain/model/user_entity.dart';
import 'package:ecommerce_app/domain/repos/auth_repository.dart';
import 'package:ecommerce_app/domain/model/auth_result.dart';
import 'package:injectable/injectable.dart';


@Injectable(as:AuthRepository )
class AuthRepoImpl implements AuthRepository{

  final AuthRemoteDataSource _remoteDataSource ;
  final AuthLocalDataSource _localDataSource ;

  AuthRepoImpl(this._remoteDataSource,this._localDataSource);
  @override
  Future<Result<AuthResult>> login(String email, String password)async {
    final result =  await _remoteDataSource.login(email, password);
    if(result is Success<AuthResult>){
      await _localDataSource.saveAuthData(result.data);
    }
     return result ;
  }

  @override
  Future<UserEntity> getCachedUser() async{
    final userData= await _localDataSource.getUserData();

    var user = UserEntity(name: userData?.name ??'', email: userData?.email ??'', role: userData?.role ??'');
    return user ;

  }

  @override
  Future<String?> getToken()async {
    return await _localDataSource.getToken();

  }

  @override
  Future<bool> isLoggedIn() async{
    return await _localDataSource.isLoggedIn();
  }

  @override
  Future<void> logout() async {
    await _localDataSource.clearAuthData();

  }

}