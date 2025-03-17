import 'package:equatable/equatable.dart';

abstract class SignInEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchSignIn extends SignInEvent {
  final String email;
  final String password;

  FetchSignIn({ required this.email, required this.password});

  @override
  List<Object?> get props => [ email, password];
}

