import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/domain/repositories/services_repository.dart';
import 'package:frontend/presentation/block/services_list/services_event.dart';
import 'package:frontend/presentation/block/services_list/services_state.dart';

class ServicesBloc extends Bloc<ServicesListEvent, ServicesListState> {
  final ServicesRepository repository;

  ServicesBloc(
      {required this.repository,}): super(ServicesInitial())
  {
    on<FetchItemsEvent>((event, emit) async {


      try {

        emit(ServicesLoading());


        final  newItems = await repository.getServices();

        print("newItems = $newItems");
        if (newItems.isSuccess) {
          emit(ServicesLoaded(items: newItems.data ?? []));

        }else{
          emit(CollectionError(errorMessage: newItems.error ?? "Unknown error"));
        }
      } catch (e) {
        emit(CollectionError(errorMessage: e.toString()));
      }
    });
  }
}