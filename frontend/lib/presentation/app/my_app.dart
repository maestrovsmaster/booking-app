
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/theme/app_theme.dart';
import 'package:frontend/presentation/block/user_register/register_block.dart';
import 'package:frontend/presentation/block/user_sign_in/sign_in_block.dart';
import 'package:frontend/presentation/block/welcome/welcome_block.dart';
import 'package:frontend/presentation/navigation/app_router.dart';
import 'package:frontend/core/di/di_container.dart' as di;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => di.sl<WelcomeBloc>()
        ),
        BlocProvider(
            create: (context) => di.sl<RegisterBloc>()
        ),
        BlocProvider(
            create: (context) => di.sl<SignInBloc>()
        ),

      ],
      child: MaterialApp.router(
        title: 'Flutter Task',
        theme: AppTheme.theme,
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter().router,
      ),
    );
  }
}
