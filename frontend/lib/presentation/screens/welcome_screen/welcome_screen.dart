
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/di/di_container.dart';
import 'package:frontend/core/theme/app_colors.dart';
import 'package:frontend/presentation/block/welcome/welcome_event.dart';
import 'package:frontend/presentation/block/welcome/welcome_state.dart';
import 'package:frontend/presentation/navigation/app_router.dart';
import 'package:frontend/presentation/widgets/welcome_box.dart';

import 'package:go_router/go_router.dart';

import '../../block/welcome/welcome_block.dart';
import 'custom_green_icon_button.dart';

/**
 * Created by Vasyl Horodetskyi on March 2025
 */
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  WelcomeScreenState createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<WelcomeBloc>()..add(CheckAuthStatus()),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.accent,
                  AppColors.background,
                ],
              )),
              child: Center(
                child: Transform.translate(
                  offset: Offset(0, -40),


              )),
            ),
            BlocListener<WelcomeBloc, WelcomeState>(
              listener: (context, state) {
                /*if (state is WelcomeUnauthenticated) {
                  print("WelcomeAuthenticated");
                  context.pushReplacement(AppRoutes.register,extra: state.user);
                }
                if (state is WelcomeAuthenticated) {
                  print("WelcomeAuthenticated");
                  context.pushReplacement(AppRoutes.main);
                }*/
              },
              child: BlocBuilder<WelcomeBloc, WelcomeState>(
                builder: (context, state) {
                  if (state is WelcomeChecking) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      WelcomeBox(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 24),
                          decoration: const BoxDecoration(
                            color: AppColors.background,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(8),
                                bottom: Radius.circular(8)),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Welcome',
                                  style:
                                      Theme.of(context).textTheme.titleLarge),
                              const SizedBox(height: 8),
                              Text(
                                'This is Client-Server Test Flutter App',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(height: 24),
                              SizedBox(
                                width: double.infinity,
                                child: CustomGreenIconButton(
                                  text: 'Sign In',
                                  height: 56,
                                  onPressed: () {
                                    context.push(AppRoutes.signIn);
                                  },
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Don\'t have an account?',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          color: AppColors.secondaryText,
                                        ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      context.push(AppRoutes.register);
                                    },
                                    child: Text(
                                      'Sign Up first',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium
                                          ?.copyWith(
                                            color: AppColors.accent,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
