import 'package:dio/dio.dart';
import 'package:openim_enterprise_chat/src/common/config.dart';
import 'package:openim_enterprise_chat/src/models/api_resp.dart';
import 'package:openim_enterprise_chat/src/widgets/im_widget.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'dio_logger.dart';

// or new Dio with a BaseOptions instance.
// var options = BaseOptions(
//   baseUrl: Config.BASE_URL,
//   connectTimeout: 5000,
//   receiveTimeout: 3000,
// );
var dio = Dio();

class HttpUtil {
  HttpUtil._();

  static void init() {
    // add interceptors
    dio
      ..interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ))
      // ..interceptors.add(HttpFormatter())
      ..interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
        // Do something before request is sent
        return handler.next(options); //continue
        // 如果你想完成请求并返回一些自定义数据，你可以resolve一个Response对象 `handler.resolve(response)`。
        // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
        //
        // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象,如`handler.reject(error)`，
        // 这样请求将被中止并触发异常，上层catchError会被调用。
      }, onResponse: (response, handler) {
        // Do something with response data
        return handler.next(response); // continue
        // 如果你想终止请求并触发一个错误,你可以 reject 一个`DioError`对象,如`handler.reject(error)`，
        // 这样请求将被中止并触发异常，上层catchError会被调用。
      }, onError: (DioError e, handler) {
        // Do something with response error
        return handler.next(e); //continue
        // 如果你想完成请求并返回一些自定义数据，可以resolve 一个`Response`,如`handler.resolve(response)`。
        // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
      }));

    // 配置dio实例
    dio.options.baseUrl = Config.imApiUrl();
    dio.options.connectTimeout = 30000; //30s
    dio.options.receiveTimeout = 30000;
  }

  ///
  static Future<Map<String, dynamic>> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var result = await dio.post<Map<String, dynamic>>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      var resp = ApiResp.fromJson(result.data!);
      if (resp.errCode == 0) {
        return resp.data;
      } else {
        IMWidget.showToast(resp.errMsg);
        return Future.error(resp.errMsg);
      }
    } catch (error) {
      if (error is DioError) {
        // IMWidget.showToast(error.response.toString());
      } else {
        IMWidget.showToast(error.toString());
      }
      return Future.error(error);
    }
  }

  static Future<String> uploadImage({required String path}) async {
    String fileName = path.substring(path.lastIndexOf("/") + 1);
    String url = "https://echat-1302656840.cos.ap-chengdu.myqcloud.com/";
    String key = '${DateTime.now().millisecond}_$fileName';
    var formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(path),
      "Key": key,
      "success_action_status": 200,
      "Signature": "Signature",
      "x-cos-security-token": "token"
    });
    await dio.post(url, data: formData);
    return '$url$key';
  }

  static Future download(
    String url, {
    required String cachePath,
    CancelToken? cancelToken,
    Function(int count, int total)? onProgress,
  }) {
    return dio.download(
      url,
      cachePath,
      options: Options(receiveTimeout: 60 * 1000),
      cancelToken: cancelToken,
      onReceiveProgress: onProgress,
    );
  }
}
