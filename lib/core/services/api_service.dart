import 'dart:async';
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/constants.dart';
import 'package:simple_ecommerce_flutter_task/core/error/failures.dart';
import 'package:simple_ecommerce_flutter_task/core/log/logger.dart';
import 'package:simple_ecommerce_flutter_task/core/network/local/cache_helper.dart';

enum RequestType { GET, POST, DELETE, PUT }

class ApiService {
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;
  ApiService._internal();
  http.Client client = http.Client();
  BaseRequest? request;
  Map<String, String>? _headers;

  Future<Response> requestApi({
    required RequestType requestType,
    required String endPoint,
    required BuildContext context,
    bool isMultiPartForm = false,
    Map<String, String>? fields,
    Map<String, String>? headers,
    dynamic parameter,
    String baseUrl = RemoteConstants.BASE_URL,
    bool changeFullUrl = false,
  }) async {
    try {
      await _initHeaders();
      Uri url = Uri.parse(changeFullUrl ? endPoint : "$baseUrl/$endPoint");
      switch (requestType) {
        case RequestType.GET:
          {
            final response = await http.get(url, headers: headers ?? _headers);
            Logger.log("check : $url");
            return response;
          }
        case RequestType.POST:
          {
            final response = await http.post(
              url,
              headers: headers ?? _headers,
              body: json.encode(parameter),
            );
            Logger.log("End Point : $endPoint");
            Logger.log("Response Body : ${response.body}");
            Logger.log("Parameters : ${json.encode(parameter)}");
            return response;
          }
        case RequestType.DELETE:
          {
            final response =
                await http.delete(url, headers: headers ?? _headers);
            return response;
          }
        case RequestType.PUT:
          {
            final response = await http.put(url,
                headers: headers ?? _headers, body: json.encode(parameter));
            return response;
          }
      }
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  Future<void> _initHeaders() async {
    Logger.log("Token: ${await CacheHelper.instance.read(key: "token")}");
    _headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Headers": "X-Requested-With",
      "Access-Control-Allow-Methods": "POST, OPTIONS, GET",
      if (await CacheHelper.instance.read(key: "token") != null)
        "Authorization":
            "Bearer ${await CacheHelper.instance.read(key: "token") ?? ""}",
    };
  }
}
