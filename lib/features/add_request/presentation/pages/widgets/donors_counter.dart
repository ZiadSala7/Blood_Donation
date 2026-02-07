import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../cubit/add_request_cubit.dart';

class DonorsCounter extends StatefulWidget {
  final AddRequestCubit cubit;
  const DonorsCounter({super.key, required this.cubit});

  @override
  State<DonorsCounter> createState() => _DonorsCounterState();
}

class _DonorsCounterState extends State<DonorsCounter> {
  int count = 2;

  void increment() {
    setState(() => count++);
    widget.cubit.bagsCount = count;
  }

  void decrement() {
    if (count > 1) {
      setState(() => count--);
    }
    widget.cubit.bagsCount = count;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _iconButton(icon: Icons.add, onTap: increment),
          const SizedBox(width: 12),
          Text(
            count.toString(),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 12),
          _iconButton(icon: Icons.remove, onTap: decrement),
          const SizedBox(width: 6),
          Text('عدد المتبرعين المطلوبين', style: AppTextStyles.b18(context)),
        ],
      ),
    );
  }

  Widget _iconButton({required IconData icon, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Icon(icon, color: AppColors.text, size: 18),
      ),
    );
  }
}
