import 'package:flutter/material.dart';
import '../../cubit/profile_view_model.dart';

class ProfileStatsCard extends StatelessWidget {
  final ProfileViewModel vm;

  const ProfileStatsCard({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _item('مرات التبرع', vm.donationsCount),
            _item('طلبات المساعدة', vm.requestsCount),
          ],
        ),
      ),
    );
  }

  Widget _item(String title, int value) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(title),
      ],
    );
  }
}
