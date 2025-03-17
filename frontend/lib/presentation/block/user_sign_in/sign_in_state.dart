import 'package:equatable/equatable.dart';

abstract class SignInState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignInInitial extends SignInState {


  @override
  List<Object?> get props => [];
}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {}

class SignInFailure extends SignInState {
  final String message;

  SignInFailure({required this.message});

  @override
  List<Object?> get props => [message];
}

