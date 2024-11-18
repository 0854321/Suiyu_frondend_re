# suiyu_frontend

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
# Suiyu_frondend_re
项目目录作用
lib/
├── core/                  # 核心配置和常量
│   ├── config/           # 应用配置
│   │   ├── app_colors.dart
│   │   ├── app_theme.dart
│   │   └── language_service.dart
│   └── constants/        # 常量定义
│       ├── app_consts.dart
│       └── app_assets.dart
│
├── features/             # 按功能模块组织
│   ├── auth/            # 认证模块
│   │   ├── models/      # 数据模型
│   │   ├── providers/   # 状态管理
│   │   ├── services/    # 业务逻辑
│   │   └── views/       # UI 组件
│   └── home/            # 首页模块
│       ├── models/
│       ├── providers/
│       └── views/
│
├── shared/              # 共享组件和工具
│   ├── widgets/         # 共享 UI 组件
│   │   └── custom_input_field.dart
│   └── utils/          # 工具类
│       └── storage.dart
│
├── providers/           # 全局状态管理
│   ├── app_providers.dart  # provider 统一导出
│   └── router/         # 路由相关
│       └── go_router_provider.dart
│
└── main.dart           # 应用入口
