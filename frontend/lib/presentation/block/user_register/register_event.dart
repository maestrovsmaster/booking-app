import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchRegister extends RegisterEvent {
  final String name;
  final String email;
  final String password;

  FetchRegister({required this.name, required this.email, required this.password});

  @override
  List<Object?> get props => [name, email, password];
}

