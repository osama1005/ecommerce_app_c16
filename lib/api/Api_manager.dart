import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
class ApiManager{

  final _dio = Dio();

  ApiManager._(){
    _dio.options.baseUrl="https://ecommerce.routemisr.com";
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90
    ));
  }

  static ApiManager? _apiManager ;

  static ApiManager getInstance(){
    if(ApiManager==null){
      _apiManager = ApiManager._();
    }
    return _apiManager!;
    }

    getCategories()async{
     var response = await _dio.get("v1/categories");
    }

  }
