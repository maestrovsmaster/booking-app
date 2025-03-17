import 'package:equatable/equatable.dart';

abstract class MainScreenEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SelectScreen extends MainScreenEvent {
  final int index;

  SelectScreen(this.index);

  @override
  List<Object?> get props => [index];
}

class UpdateNotifications extends MainScreenEvent {
  final int count;

  UpdateNotifications(this.count);

  @override
  List<Object?> get props => [count];
}

class LogoutRequested extends MainScreenEvent {}
