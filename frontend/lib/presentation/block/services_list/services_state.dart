
import 'package:equatable/equatable.dart';
import 'package:frontend/data/models/service.dart';

abstract class ServicesListState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ServicesInitial extends ServicesListState {}

class ServicesLoading extends ServicesListState {}

class ServicesLoaded extends ServicesListState {
  final List<Service> items;

  ServicesLoaded({required this.items});

  ServicesLoaded copyWith({List<Service>? items, bool? hasReachedMax}) {
    return ServicesLoaded(
      items: items ?? this.items,
    );
  }

  @override
  List<Object?> get props => [items];
}

class CollectionError extends ServicesListState {
  final String errorMessage;

  CollectionError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
