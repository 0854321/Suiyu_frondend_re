import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncValueUtils {
  /// 解包 AsyncValue 并返回 Map<String, dynamic> 或抛出错误
  static Map<String, dynamic> unwrapAsyncValue(AsyncValue<Map<String, dynamic>> asyncValue) {
    return asyncValue.when(
      data: (data) => data, // 如果成功，直接返回数据
      loading: () {
        throw Exception("数据尚未加载完成");
      },
      error: (error, stackTrace) {
        throw Exception("加载失败: $error");
      },
    );
  }
}
