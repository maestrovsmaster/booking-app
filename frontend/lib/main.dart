import 'package:flutter/material.dart';
import 'core/di/di_container.dart' as di;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'presentation/app/my_app.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();





  // Initialize dependencies
  await di.init();



  // Run the app
  runApp(const MyApp());
}
