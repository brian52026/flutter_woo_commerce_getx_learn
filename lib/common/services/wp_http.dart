import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;

import '../index.dart';

class WPHttpService extends GetxService {
  static WPHttpService get to => Get.find();

  late final Dio _dio;
  // final CancelToken _cancelToken = CancelToken();

  @override
  void onInit() {
    super.onInit();

    //初始 dio
    var options = BaseOptions(
      baseUrl: Constants.wpApiBaseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 5),
      headers: {},
      contentType: 'application/json; charset=utf-8',
      responseType: ResponseType.json,
    );
    _dio = Dio(options);

    //攔截器
    _dio.interceptors.add(RequestInterceptors());
    /* _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        print('onRequest');
        handler.next(options);
      },
      onResponse: (response, handler) async {
        print('onResponse');
        handler.next(response);
      },
      onError: (error, handler) async {
        print('onError');
        handler.next(error);
      },
    )); */
  }

  Future<Response> post(
    String url, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    var requestOptions = options ?? Options();
    Response response = await _dio.post(
      url,
      data: data,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response;
  }

  Future<Response> put(
    String url, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    var requestOptions = options ?? Options();
    Response response = await _dio.put(
      url,
      data: data,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response;
  }

  Future<Response> delete(
    String url, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    var requestOptions = options ?? Options();
    Response response = await _dio.delete(
      url,
      data: data,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response;
  }
}

class RequestInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    /* if (UserService.to.hasToken) {
      options.headers['Authorization'] = 'Bearer ${UserService.to.hasToken}';
    } */
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode! ~/ 100 != 2) {
      handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        ),
        true,
      );
    } else {
      super.onResponse(response, handler);
    }
  }

  /// 退出并重新登录
  /* Future<void> _errorNoAuthLogout() async{
    await UserService.to.logout();
    Get.toNamed(RouteNames.systemLogin)
  } */

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final exception = HttpException(err.message ?? '');
    switch (err.type) {
      case DioExceptionType.badResponse:
        /* final response = err.response;
        final errorMessage = ErrorMessageModel.fromJson(response?.data);
        switch (errorMessage.ststusCode) {
          case 401:
            _errorNoAuthLogout();
            break;
          case 404:
            break;
          default:
            break;
        }
        Loading.error(errorMessage.message); */
        break;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.connectionTimeout:
        break;
      case DioExceptionType.unknown:
        break;
      default:
    }

    super.onError(err, handler);
  }
}
