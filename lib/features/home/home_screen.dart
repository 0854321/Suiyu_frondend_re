import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:suiyu_frontend/core/constants/app_iamge_assets.dart';
import 'package:suiyu_frontend/providers/language_provider.dart';
import 'package:suiyu_frontend/providers/left_menu_provider.dart';
import 'package:suiyu_frontend/providers/theme/theme_provider.dart';

//左侧菜单导航栏的状态
final todoListProvider = NotifierProvider<LeftMenuList, List<LeftMenu>>(LeftMenuList.new);
final isEmployeeAdd = useState(false);

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //全球化
    final String locale = ref.watch(languageProvider).languageCode;
    //主题
    final bool themeDark = ref.watch(themeNotifier);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: themeDark ? Colors.black : Colors.white,
              image: const DecorationImage(
                image: AssetImage(AppImageAssets.homeBg),
                fit: BoxFit.cover, // 填充整个屏幕
              ),
            ),
          ),
        ],
      ),
    );
  }

}
