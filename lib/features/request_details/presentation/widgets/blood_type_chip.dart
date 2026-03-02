import 'package:flutter/material.dart';

class BloodTypeChip extends StatelessWidget {
  final String? type;

  const BloodTypeChip({super.key, this.type});

  @override
  Widget build(BuildContext context) {
    if (type == null || type!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.red),
      ),
      child: Text(
        type!,
        style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
      ),
    );
  }
}
