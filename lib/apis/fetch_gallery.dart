import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gsm_inside_flutter/models/gallery_api_model.dart';

class FetchGalleryApi {
  final _dio = Dio();
  final _url = dotenv.env['PROJECT_API_URL'];
  final Map<String, String> _queryParameers = {'orderby': 'like'};

  Future<List<GalleryGetApiModel>> getApiFetch() async {
    try {
      final response =
          await _dio.get('$_url/gallery', queryParameters: _queryParameers);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((e) => GalleryGetApiModel.fromJson(e)).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
