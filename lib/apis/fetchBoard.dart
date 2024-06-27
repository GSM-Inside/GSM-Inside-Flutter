import 'package:dio/dio.dart';
import 'package:gsm_inside_flutter/models/board_api_model.dart';

class FetchBoardApi {
  final _dio = Dio();

  Future<List<BoardApi>> getApiFetch() async {
    try {
      var response = await _dio.get('$_url/post');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        print(data);
        return data.map((e) => BoardApi.fromJson(e)).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<BoardApi> postApiFetch() async {
    try {
      var response = await _dio.post('$_url/post');
      if (response.statusCode == 200) {
        return BoardApi.fromJson(response.data);
      } else {
        return BoardApi(id: 0, title: '', gallery: 0, like: 0);
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
