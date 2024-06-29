import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gsm_inside_flutter/models/board_api_model.dart';

class FetchBoardApi {
  final _dio = Dio();
  final _url = dotenv.env['PROJECT_API_URL'];

  Future<List<BoardGetApi>> getApiFetch() async {
    try {
      var response = await _dio.get('$_url/post');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        print(data);
        return data.map((e) => BoardGetApi.fromJson(e)).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<BoardGetApi>> getApiFetchDetail(int index) async {
    try {
      var response = await _dio.get('$_url/post/$index');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return [];
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<BoardGetApi> postApiFetch() async {
    try {
      var response = await _dio.post('$_url/post');
      if (response.statusCode == 200) {
        return BoardGetApi.fromJson(response.data);
      } else {
        return BoardGetApi(id: 0, title: '', gallery: 0, like: 0);
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
