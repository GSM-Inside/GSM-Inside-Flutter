import 'package:dio/dio.dart';
import 'package:gsm_inside_flutter/models/api_model.dart';

class FetchApi {
  static final dio = Dio();
  static var _token;
  static Future<bool> loginFetchApi(Map<String, dynamic> data) async {
    try {
      var response = await dio.post(
        "http://127.0.0.1:5000/login",
        data: data,
      );
      if (response.statusCode == 200) {
        _token = response.data['token'];
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  static Future<List<ApiModel>> getFetchApi() async {
    try {
      var response = await dio.get(
        "http://127.0.0.1:5000/posts",
        options: Options(
          headers: {'Authorization': _token},
        ),
      );
      List<dynamic> fetchedDatas = response.data;
      List<ApiModel> data =
          fetchedDatas.map((e) => ApiModel.fromJson(e)).toList();
      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  static postFetchApi(Map<String, dynamic> data) async {
    try {
      var response = await dio.post(
        "http://127.0.0.1:5000/posts",
        data: data,
        options: Options(
          headers: {'Authorization': _token},
        ),
      );
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  static putFetchApi(Map<String, dynamic> data, String id) async {
    try {
      var response = await dio.put(
        "http://127.0.0.1:5000/posts/$id",
        data: data,
        options: Options(
          headers: {'Authorization': _token},
        ),
      );
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  static deleteFetchApi(String id) async {
    try {
      var response = await dio.delete(
        'http://127.0.0.1:5000/posts/$id',
        options: Options(
          headers: {'Authorization': _token},
        ),
      );
      return response;
    } catch (e) {
      throw e.toString();
    }
  }
}
