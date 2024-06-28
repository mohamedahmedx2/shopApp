import 'package:dio/dio.dart';

class DioHelper {
  static  Dio  dio = Dio();

  DioHelper dio1 = DioHelper();

  void init({
    String lang = 'en',
    String? token,
}) {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

 static  Future<Response?> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio.options .headers={
      'Content-Type': 'application/json',
      'lang':lang,
      'Authorization': token??'',
    };
    return  await dio.get(
      url,
      queryParameters: query,
    );
  }



  static Future<Response?> postData({
    required String url,
    Map<String, dynamic>? query,
    required data,
    String lang = 'ar',
    String? token,
  }) async {
    dio.options.headers ={
      'Content-Type': 'application/json',
      'lang':lang,
      'Authorization': token??'',
    };
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }


   Future<Response?> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };
    return await dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}