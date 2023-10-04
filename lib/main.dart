import 'core/utils/service_locator.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
 await serviceLocator();
  runApp(  const MyApp());
}
