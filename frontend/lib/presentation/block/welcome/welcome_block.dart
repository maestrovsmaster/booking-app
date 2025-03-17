
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/data/net/global_interceptor.dart';
import 'package:frontend/domain/repositories/sign_in_repository.dart';
import 'package:frontend/presentation/block/user_cubit/user_cubit.dart';


import 'welcome_event.dart';
import 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  final SignInRepository repository;
  final AuthInterceptor authInterceptor;

  WelcomeBloc({required this.repository, required this.authInterceptor}) : super(WelcomeInitial()) {
    on<CheckAuthStatus>((event, emit) async {
      print("on<CheckAuthStatus>");
      emit(WelcomeUnauthenticated());

      //TODO Some logic to check if user is authenticated
    });
  }
}
