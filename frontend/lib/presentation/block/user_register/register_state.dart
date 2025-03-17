import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterInitial extends RegisterState {
  //final String mockEmail = "test@email.com";
  //final String mockPassword = "password123";

  @override
  List<Object?> get props => [];
}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterFailure extends RegisterState {
  final String message;

  RegisterFailure({required this.message});

  @override
  List<Object?> get props => [message];
}

