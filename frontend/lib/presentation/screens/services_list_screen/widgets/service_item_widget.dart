import 'package:flutter/material.dart';
import 'package:frontend/data/models/service.dart';

class ServiceItemWidget extends StatelessWidget {
  final Service service;

  const ServiceItemWidget({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(service.name),
      subtitle: Text("\$${service.price}"),
      trailing: service.available
          ? const Icon(Icons.check_circle, color: Colors.green)
          : const Icon(Icons.cancel, color: Colors.red),
    );
  }
}
