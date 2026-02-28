import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../home/data/models/request_model.dart';

class HospitalAndLocation extends StatelessWidget {
  const HospitalAndLocation({super.key, required this.model});

  final RequestModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Symbols.location_city_rounded, color: Colors.grey),
        const SizedBox(width: 8),
        Text(
          model.hospitalName!,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        const Icon(Icons.location_on, color: Colors.grey),
        const SizedBox(width: 4),
        Text(model.cityAr!),
      ],
    );
  }
}
