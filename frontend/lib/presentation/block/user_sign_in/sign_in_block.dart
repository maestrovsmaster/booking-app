import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/domain/repositories/sign_in_repository.dart';
import 'package:frontend/presentation/block/token_cubit/token_cubit.dart';
import 'package:frontend/presentation/block/user_register/register_event.dart';
import 'package:frontend/presentation/block/user_register/register_state.dart';
import 'package:frontend/presentation/block/user_sign_in/sign_in_event.dart';
import 'package:frontend/presentation/block/user_sign_in/sign_in_state.dart';


class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInRepository repository;
  final TokenCubit tokenCubit;


  SignInBloc({required this.repository, required this.tokenCubit}) : super(SignInInitial()) {
    on<FetchSignIn>((event, emit) async {
      emit(SignInLoading());

      try {
        final result = await repository.signIn( event.email, event.password);

        if (result.isSuccess) {
          final token = result.data;
          print("token = $token");
          if (token != null) {
            tokenCubit.setToken(token);
            emit(SignInSuccess());
          }else{
            emit(SignInFailure(message: "Token is null"));
          }

        } else {
          emit(SignInFailure(message: result.error ?? "Unknown error"));
        }
      } catch (e) {
        emit(SignInFailure(message: "Unexpected error occurred"));
      }
    });



  }
}