import 'package:equatable/equatable.dart';

abstract class MainScreenState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MainScreenInitial extends MainScreenState {
  final int selectedIndex;
  final int notificationCount;

  MainScreenInitial({required this.selectedIndex, this.notificationCount = 0});

  MainScreenInitial copyWith({int? selectedIndex, int? notificationCount}) {
    return MainScreenInitial(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      notificationCount: notificationCount ?? this.notificationCount,
    );
  }

  @override
  List<Object?> get props => [selectedIndex, notificationCount];
}

class MainScreenLoading extends MainScreenState {}

class LogoutSuccess extends MainScreenState {}
