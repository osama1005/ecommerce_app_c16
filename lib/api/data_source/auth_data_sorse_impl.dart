import 'package:ecommerce_app/Data/data_source/auth_data_sourse.dart';
import 'package:ecommerce_app/api/Api_manager.dart';
import 'package:ecommerce_app/api/execute_api.dart';
import 'package:ecommerce_app/domain/api_result.dart';
import 'package:ecommerce_app/domain/model/auth_result.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;
  AuthRemoteDataSourceImpl(this.apiManager);

 @override
  Future<Result<AuthResult>> login(String email, String password) {
    return executeApi(()async{
      var response = await apiManager.login(email, password);
      return response.toEntity() ;
    });
  }
}