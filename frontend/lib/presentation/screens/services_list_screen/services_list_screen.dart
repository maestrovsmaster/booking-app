import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/di/di_container.dart';
import 'package:frontend/domain/repositories/services_repository.dart';
import 'package:frontend/presentation/block/services_list/services_block.dart';
import 'package:frontend/presentation/block/services_list/services_event.dart';
import 'package:frontend/presentation/block/services_list/services_state.dart';

import 'widgets/service_item_widget.dart';


class ServicesListScreen extends StatelessWidget {
  ServicesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServicesBloc(repository: sl<ServicesRepository>())
        ..add(FetchItemsEvent()), // Викликаємо при ініціалізації
      child: Scaffold(
        appBar: AppBar(title: const Text("Services List")),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<ServicesBloc>().add(FetchItemsEvent());
          },
          child: const Icon(Icons.refresh),
        ),
        body: SafeArea(
          child: BlocBuilder<ServicesBloc, ServicesListState>(
            builder: (context, state) {
              if (state is ServicesLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ServicesLoaded) {
                return ListView.builder(
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    return ServiceItemWidget(service: state.items[index]);
                  },
                );
              } else if (state is CollectionError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(state.errorMessage, style: TextStyle(color: Colors.red)),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () => context.read<ServicesBloc>().add(FetchItemsEvent()),
                        child: const Text("Retry"),
                      ),
                    ],
                  ),
                );
              }
              return const Center(child: Text("No data available"));
            },
          ),
        ),
      ),
    );
  }
}

