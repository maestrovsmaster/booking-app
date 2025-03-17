import 'package:equatable/equatable.dart';

abstract class ServicesListEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchItemsEvent extends ServicesListEvent {}