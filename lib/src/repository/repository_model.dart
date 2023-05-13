import 'package:dio/dio.dart';

class ModelRepository {
  final dio = Dio();

  Options _getOptions() {
    return Options(headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
  }

  Future<Response?> get(String uri) async {
    Response response;

    response = await dio.get(uri, options: _getOptions());

    return response;
  }
}
