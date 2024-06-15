import 'package:dio/dio.dart';
import 'package:gsm_inside_flutter/models/api_model.dart';

class FetchApi {
  static Future<List<ApiModel>> getFetchApi() async {
    final dio = Dio();
    try {
      var response = await dio.get("http://127.0.0.1:5000/posts");
      List<dynamic> fetchedDatas = response.data;
      List<ApiModel> data =
          fetchedDatas.map((e) => ApiModel.fromJson(e)).toList();
      print(response.statusCode);
      return data;
    } catch (e) {
      print('문제 : $e');
      return [];
    }
  }

  static postFetchApi(Map<String, dynamic> data) async {
    final dio = Dio();

    try {
      var response = await dio.post(
        "http://127.0.0.1:5000/posts",
        data: data,
      );
      print(response.statusCode);
    } catch (e) {
      print(e);
    }
  }

  static putFetchApi(Map<String, dynamic> data, String id) async {
    final dio = Dio();
    try {
      var response = await dio.put(
        "http://127.0.0.1:5000/posts/$id",
        data: data,
      );
      print(response.statusCode);
    } catch (e) {
      print(e);
    }
  }

  static deleteFetchApi(String id) async {
    final dio = Dio();
    try {
      var response = await dio.delete('http://127.0.0.1:5000/posts/$id');
      print(response.statusCode);
    } catch (e) {
      print(e);
    }
  }
}
