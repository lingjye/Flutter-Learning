import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:first_app/login/Services/login_api_interface.dart';
import 'package:first_app/login/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart' as inner;
import 'dart:async';
import 'package:async/async.dart';
import 'package:path/path.dart';

class LoginApiService implements LoginApi {
  final User auth;
  LoginApiService({this.auth});
  
  @override
  Future get(String url) async {
    // TODO: implement get
    if (auth == null) throw 'Auth Model Required';
    final String _token = auth?.token ?? '';
    final http.Response response = await getHttpResponse(
      url,
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $_token',
      },
      method: HttpMethod.get
    );
    if (response?.body == null) return null;
    return json.decode(response.body);
  }

  @override
  Future delete(String url) async {
    // TODO: implement delete
    final String _token = auth?.token ?? '';
    http.Response response = await getHttpResponse(
      url,
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $_token'
      },
      method: HttpMethod.delete
    );
    if (response?.body == null) return null;
    return json.decode(response.body);
  }

  @override
  Future post(String url, data, {String bodyContentType}) async {
    // TODO: implement post
    if (auth == null) throw 'Auth Model Required';
    final String _token = auth?.token ?? '';
    http.Response response = await getHttpResponse(
      url,
      body: data,
      headers: {
        HttpHeaders.contentTypeHeader: bodyContentType ?? 'application/json',
        HttpHeaders.authorizationHeader:'Bearer $_token'
      },
      method: HttpMethod.post
    );
    if (response.headers.containsValue('json')) {
      return json.decode(response.body);
    }
    return response.body;
  }

  @override
  Future put(String url, data) async {
    // TODO: implement put
    final String _token = auth?.token ?? '';
    http.Response response = await getHttpResponse(
      url,
      body: data,
      headers: {
        'Content-Type': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $_token'
      },
      method: HttpMethod.put
    );
    return json.decode(response.body);
  }

  @override
  Future<http.StreamedResponse> uploadFile(String url, File file, String name) async {
    var stream = http.ByteStream(DelegatingStream.typed(file.openRead()));
    var length = await file.length();
    var uri = Uri.parse(url);
    var request = http.MultipartRequest('POST', uri);
    var multipartFile = http.MultipartFile(name, stream, length, filename: basename(file.path));
    request.files.add(multipartFile);
    var response = await request.send();
    print(response.statusCode);
    return response;
  }

  @override
  Future<http.Response> getHttpResponse(String url, {body, Map<String, String> headers, HttpMethod method = HttpMethod.get}) async {
    // TODO: implement getHttpResponse
    final inner.IOClient _client = getClient();
    http.Response response;
    try {
      switch (method) {
        case HttpMethod.get: {
          response = await _client.get(url, headers: headers);
        }
          break;
        case HttpMethod.post: {
          response = await _client.post(url, headers: headers, body: body);
        }
          break;
        case HttpMethod.delete: {
          response = await _client.delete(url, headers: headers);
        }
          break;
        case HttpMethod.put: {
          response = await _client.put(url, headers: headers, body: body);
        }
          break;
      }

      print('Request URL: $url');
      print('Body: $body');
      print('Response Status: ${response.statusCode.toString()}');
      print('Response Body: ${response.body.toString()}');
      if (response.statusCode >= 400) {
        if (response.statusCode == 401) {
          final String _token = auth?.token ?? '';
          print('Second Token: $_token');
          response = await getHttpResponse(
            url,
            headers: {
              HttpHeaders.authorizationHeader: 'Bearer $_token'
            },
          );
        }
        if (devMode) throw ('发生错误: ${response.body}');
      }
    } catch (e) {
      print('请求错误：url=$url, $e');
    }
    return response;
  }

  @override
  inner.IOClient getClient() {
    // TODO: implement getClient
    bool trustSelfSigned = true;
    HttpClient httpClient = HttpClient()
      ..badCertificateCallback = ((X509Certificate cert, String host, int port) => trustSelfSigned);
    inner.IOClient ioClient = inner.IOClient(httpClient);
    return ioClient;
  }

}