import 'package:dio/dio.dart';
import 'package:our_market_admin/core/constant/sensetive_constant/const.dart';

class ApiServices {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://sultixrmcetqmixvtkbi.supabase.co/rest/v1/",
      headers: {"apiKey": SupabaseKeys.anonKey},
    ),
  );

  Future<Response> getData(String path, String? token) async {
    return await _dio.get(
      path,
      options: Options(headers: {"Authorization": "Bearer $token"}),
    );
  }

  Future<Response> postData(
    String path,
    Map<String, dynamic> data,
    String? token,
  ) async {
    return await _dio.post(
      path,
      data: data,
      options: Options(headers: {"Authorization": "Bearer $token"}),
    );
  }

  Future<Response> patchData(
    String path,
    Map<String, dynamic> data,
    String? token,
  ) async {
    return await _dio.patch(
      path,
      data: data,
      options: Options(headers: {"Authorization": "Bearer $token"}),
    );
  }

  Future<Response> deleteData(String path, String? token) async {
    return await _dio.delete(
      path,
      options: Options(headers: {"Authorization": "Bearer $token"}),
    );
  }

  final Dio _dioAuth = Dio(
    BaseOptions(
      baseUrl: "https://sultixrmcetqmixvtkbi.supabase.co/auth/v1/",
      headers: {"apiKey": SupabaseKeys.anonKey},
    ),
  );
  Future<Response> createAnAccount(
    String endpoint,
    Map<String, dynamic> data,
  ) async {
    return await _dioAuth.post(endpoint, data: data);
  }

  Future<Response> login(String endpoint, Map<String, dynamic> data) async {
    return await _dioAuth.post(
      endpoint,
      data: data,
      queryParameters: {"grant_type": "password"},
    );
  }
}
