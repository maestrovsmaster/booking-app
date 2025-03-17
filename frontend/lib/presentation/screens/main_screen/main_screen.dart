import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/di/di_container.dart';
import 'package:frontend/presentation/block/main_screen/main_screen_block.dart';
import 'package:frontend/presentation/block/main_screen/main_screen_event.dart';
import 'package:frontend/presentation/block/main_screen/main_screen_state.dart';
import 'package:frontend/presentation/navigation/app_router.dart';
import 'package:frontend/presentation/screens/placeholder_screen/placeholder_screen.dart';
import 'package:frontend/presentation/screens/services_list_screen/services_list_screen.dart';
import 'package:go_router/go_router.dart';

//eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2N2Q4MmQwYWRiZTI3YTZmMDViNGY5ZmIiLCJpYXQiOjE3NDIyMjkxMDUsImV4cCI6MTc0MjIzMjcwNX0.8b5U5qmQd_9EmB5LWej6yAiUBJ5Bq-E5WjA7KH1eb9Q

import 'main_screen_bottom_navigation.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => sl<MainScreenBloc>(),
        child: BlocListener<MainScreenBloc, MainScreenState>(
          listener: (context, state) {
            if (state is LogoutSuccess) {
              context.go(AppRoutes.welcome);
            }
          },
          child: BlocBuilder<MainScreenBloc, MainScreenState>(
            builder: (context, state) {
              final bloc = BlocProvider.of<MainScreenBloc>(context);

              if (state is MainScreenInitial) {
                return Scaffold(
                    appBar: PreferredSize(
                        preferredSize: const Size.fromHeight(72),
                        child: AppBar(
                          title: Text(
                            _getTitle(state.selectedIndex),
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          actions: [
                            Stack(
                              children: [
                                /*NotificationsWidget(
                                  hasNotifications: state.notificationCount > 0,
                                  onClick: () {
                                    _showLogoutDialog(context,() =>
                                      context.read<MainScreenBloc>().add(LogoutRequested())
                                    );
                                  },
                                )*/
                              ],
                            ),
                          ],
                        )),
                    body: _getSelectedScreen(state.selectedIndex),
                    bottomNavigationBar: MainScreenBottomNavigationBar(
                      currentIndex: state.selectedIndex,
                      onTap: (index) {
                        bloc.add(SelectScreen(index));
                      },
                    ));
              } else {
                return  Container();
              }
            },
          ),
        ));
  }

  String _getTitle(int index) {
    switch (index) {
      case 0:
        return 'Services';
      case 1:
        return 'Bookings';

      default:
        return '';
    }
  }

  Widget _getSelectedScreen(int index) {
    switch (index) {
      case 0:
        return  ServicesListScreen();
      case 1:
        return  PlaceholderScreen(title: 'Bookings');

      default:
        return Container();
    }
  }



}
