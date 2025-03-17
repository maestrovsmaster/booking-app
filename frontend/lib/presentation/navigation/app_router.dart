
import 'package:frontend/data/models/app_user.dart';
import 'package:frontend/presentation/screens/main_screen/main_screen.dart';
import 'package:frontend/presentation/screens/register_user_screen/register_screen.dart';
import 'package:frontend/presentation/screens/sign_in/sign_in_screen.dart';
import 'package:frontend/presentation/screens/welcome_screen/welcome_screen.dart';
import 'package:go_router/go_router.dart';


import 'custom_transitions.dart';

class AppRoutes {
  static const String welcome = '/welcome';
  static const String signIn = '/signIn';
  static const String register = '/register';
  static const String main = '/main';
  static const String details = '/details';

}

class AppRouter {
  final GoRouter _router = GoRouter(
    initialLocation: AppRoutes.main,
    routes: [
      GoRoute(
        path: AppRoutes.welcome,
        builder: (context, state) => const WelcomeScreen(),
      ),

      GoRoute(
        path: AppRoutes.register,
        builder: (context, state) {

          return RegisterScreen();
        },
      ),

      GoRoute(
        path: AppRoutes.signIn,
        builder: (context, state) {

          return SignInScreen();
        },
      ),

      GoRoute(
          path: AppRoutes.main,
          pageBuilder: (context, state) {
            return const CustomTransitionPage(
              child: MainScreen(),
              transitionsBuilder: slideTransition,
            );
          }),

    ],
  );

  GoRouter get router => _router;
}
