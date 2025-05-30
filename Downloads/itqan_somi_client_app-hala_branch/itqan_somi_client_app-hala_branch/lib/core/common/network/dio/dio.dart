import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../../local_storage/hive_services.dart';
import '../api_services.dart';

class DioClient extends ApiServices {
  final Dio _dio;

  DioClient(this._dio) {
    // Allow self-signed certificates (not recommended for production)
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };
  }

  @override
  Future<Response> get(
      {required String url, dynamic data, dynamic params}) async {
    Map<String, dynamic> headers = {
      'Authorization': 'Bearer ${await getToken()}', // Use Bearer token
    };

    var response = await _dio.get(
      url,
      data: data,
      queryParameters: params,
      options: Options(
        headers: headers,
        followRedirects: false,
      ), // Include headers in the request
    );
    return response;
  }

  @override
  Future<Response> post(
      {required String url,
      dynamic data,
      dynamic params,
      dynamic option}) async {
    var response = await _dio.request(
      url,
      data: data,
      queryParameters: params,
      options: Options(
        method: 'POST',
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${await getToken()}', // Use Bearer token
        },
      ),
    );
    return response;
  }

  Future<Response> postData({
    required String url,
    required var data,
  }) {
    return _dio.request(url,
        data: data,
        options: Options(
          headers: {'Accept': 'application/json'},
          contentType: Headers.formUrlEncodedContentType,
          method: 'POST',
          followRedirects: false,
        ));
  }

  Future<Response> postPaymentAuth({
    required String url,
    required var data,
    required var headers,
  }) {
    return _dio.request(url,
        data: data,
        options: Options(
          headers: headers,
          method: 'POST',
          followRedirects: false,
        ));
  }

  @override
  Future<Response> delete(
      {required String url,
      dynamic data,
      dynamic params,
      dynamic option}) async {
    var response = await _dio.request(
      url,
      data: data,
      queryParameters: params,
      options: Options(
        method: 'DELETE',
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${await getToken()}', // Use Bearer token
        },
      ),
    );
    return response;
  }

  @override
  Future<Response> put({required String url, data, params}) {
    return _dio.request(url,
        data: data,
        options: Options(
          headers: {'Accept': 'application/json'},
          contentType: Headers.formUrlEncodedContentType,
          method: 'PUT',
          followRedirects: false,
        ));
  }


}
