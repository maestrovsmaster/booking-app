import 'package:flutter/material.dart';
import 'core/di/di_container.dart' as di;


import 'presentation/app/my_app.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  // Initialize dependencies
  await di.init();

  // Run the app
  runApp(const MyApp());
}
