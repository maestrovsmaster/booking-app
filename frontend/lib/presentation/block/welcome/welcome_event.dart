import 'package:equatable/equatable.dart';

abstract class WelcomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckAuthStatus extends WelcomeEvent {}
