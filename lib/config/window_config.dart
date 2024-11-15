// window_config.dart

import 'package:window_manager/window_manager.dart';
import 'package:flutter/widgets.dart';

///视窗的配置信息
class WindowConfig {
  // 设置窗口初始大小
  static const Size initialSize = Size(1280, 720);

  // 设置窗口初始位置
  static const Offset initialPosition = Offset(100, 100);

  // 设置窗口是否可调整大小
  static const bool isResizable = true;
  
  // 设置窗口第一次打开的宽高相对于初始大小的倍率
  static const num ratio = 1;

  static WindowOptions windowOptions = const WindowOptions(
    center: true, //窗口是否居中
    titleBarStyle: TitleBarStyle.hidden //hidden为隐藏标题栏 normal显示窗体标题栏
  );

  


  // 设置窗口大小的比例（例如：50%的屏幕宽度和60%的屏幕高度）
  static Future<void> setWindowSize() async {
    final size = await windowManager.getSize();
    final screenWidth = size.width;
    final screenHeight = size.height;
    print(size);
    // 设置窗口为屏幕宽度的 50% 和高度的 60%
    windowManager.setSize(Size(screenWidth * ratio, screenHeight * ratio));
  }

  // 初始化窗口设置
  static Future<void> initialize() async {
    await windowManager.ensureInitialized();

    // 设置初始大小
    windowManager.setSize(initialSize);

    // 设置窗口初始位置
    windowManager.setPosition(initialPosition);

    // 设置窗口是否可调整大小
    windowManager.setResizable(true);
    
    //等待 ready to show
    windowManager.waitUntilReadyToShow(windowOptions, () async {  
      //显示窗口 
      await windowManager.show(); 
      //聚焦窗口
      await windowManager.focus(); 
      windowManager.setResizable(isResizable);  
      //设置窗口模式：亮色模式和暗色模式  
      //windowManager.setBrightness(Brightness.dark);
    });

  }
}
