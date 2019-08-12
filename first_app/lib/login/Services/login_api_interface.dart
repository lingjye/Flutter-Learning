import 'package:http/http.dart' as http;
import 'package:http/io_client.dart' as inner;
import 'dart:io';

enum HttpMethod {
  get,
  post,
  put, 
  delete
}

abstract class LoginApi {
  Future<dynamic> get(String url);
  Future<dynamic> delete(String url);
  Future<dynamic> post(String url, dynamic data, {String bodyContentType});
  Future<dynamic> put(String url, dynamic data);
  Future<http.StreamedResponse> uploadFile(String url, File file, String name);
  Future<http.Response> getHttpResponse(String url, {dynamic body, Map<String, String> headers, HttpMethod method = HttpMethod.get});
  inner.IOClient getClient();
}

const String apiUrl = 'https://reqres.in/api/users/2';
const bool devMode = false;
const double textScaleFactor = 1.0;

enum AlertAction {
  cancel,
  discard,
  disagree,
  aree
}
