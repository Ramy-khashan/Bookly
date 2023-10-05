import 'core/utils/service_locator.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'core/utils/shared_prefrance_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await PreferenceUtils.init();
  await serviceLocator();
  runApp(const MyApp());
}
