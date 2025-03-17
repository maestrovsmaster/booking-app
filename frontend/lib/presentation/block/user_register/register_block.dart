import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/di/di_container.dart';
import 'package:frontend/domain/repositories/sign_in_repository.dart';
import 'package:frontend/presentation/block/token_cubit/token_cubit.dart';
import 'package:frontend/presentation/block/user_register/register_event.dart';
import 'package:frontend/presentation/block/user_register/register_state.dart';


class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final SignInRepository repository;
  final TokenCubit tokenCubit;

  RegisterBloc({required this.repository, required this.tokenCubit}) : super(RegisterInitial()) {
    on<FetchRegister>((event, emit) async {
      emit(RegisterLoading());

      try {
        final result = await repository.registerUser(event.name, event.email, event.password);

        if (result.isSuccess) {

          final token = result.data;
          print("token = $token");
          if (token != null) {
            tokenCubit.setToken(token);
            emit(RegisterSuccess());
          }else{
            emit(RegisterFailure(message: "Token is null"));
          }
        } else {
          emit(RegisterFailure(message: result.error ?? "Unknown error"));
        }
      } catch (e) {
        emit(RegisterFailure(message: "Unexpected error occurred"));
      }
    });



  }
}