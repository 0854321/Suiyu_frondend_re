import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:suiyu_frontend/notifier/login_notifier.dart';

final loginProvider = NotifierProvider<LoginNotifier, Map<String, dynamic>>(LoginNotifier.new);

