import 'package:dio/dio.dart';

class BaseClient {
  BaseClient._();
  static BaseClient get instance => BaseClient._();
  Dio dio = Dio(BaseOptions(
    baseUrl: "https://api.nstack.in/",
    connectTimeout: Duration(seconds: 30),
    receiveTimeout: Duration(seconds: 30),
  ));

  Future getData(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
      return response.data;
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      rethrow;
    }
  }
}
