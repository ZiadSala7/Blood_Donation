import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../home/data/models/request_model.dart';
import '../../../home/presentation/pages/widgets/blood_type_and_needed.dart';

class HeaderCard extends StatefulWidget {
  final RequestModel request;
  const HeaderCard(this.request, {super.key});

  @override
  State<HeaderCard> createState() => _HeaderCardState();
}

class _HeaderCardState extends State<HeaderCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulseController;
  late final Animation<double> _pulseScale;
  late final Animation<double> _pulseOpacity;

  bool _isExpired(DateTime? deadline) {
    if (deadline == null) return false;
    return DateTime.now().isAfter(deadline);
  }

  String _statusText() {
    final total = widget.request.bagsCount ?? 1;
    final collected = widget.request.collectedBags ?? 0;
    final progress = (collected / total).clamp(0.0, 1.0);
    if (_isExpired(widget.request.deadline)) {
      return progress >= 1.0 ? 'مكتمل' : 'مغلق';
    }
    return widget.request.status ?? 'مفتوح';
  }

  Color _statusColor(String status) {
    switch (status) {
      case 'مكتمل':
        return Colors.green;
      case 'مغلق':
        return Colors.grey;
      default:
        return Colors.green;
    }
  }

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);

    _pulseScale = Tween<double>(begin: 0.8, end: 1.3).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
    _pulseOpacity = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final statusText = _statusText();
    final statusColor = _statusColor(statusText);
    final isOpen = statusText == 'مفتوح';

    return Card(
      color: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              height: 40,
              width: 100,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                // ignore: deprecated_member_use
                color: statusColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: .center,
                spacing: 10,
                children: [
                  if (isOpen)
                    FadeTransition(
                      opacity: _pulseOpacity,
                      child: ScaleTransition(
                        scale: _pulseScale,
                        child: Icon(
                          Icons.circle,
                          color: statusColor,
                          size: 10,
                        ),
                      ),
                    )
                  else
                    Icon(Icons.circle, color: statusColor, size: 10),
                  Text(
                    statusText,
                    style: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Text(
              widget.request.patientName ?? '',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.local_hospital, size: 16),
                const SizedBox(width: 4),
                Text(widget.request.hospitalName ?? ''),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on_rounded,
                  color: AppColors.grey,
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(widget.request.cityAr ?? ''),
              ],
            ),
            const SizedBox(height: 12),
            Column(
              mainAxisAlignment: .center,
              children: [
                BloodTypeAndNeeded(
                  isRequest: true,
                  bldType: widget.request.requiredBloodType!,
                  donationCat: widget.request.donationCategoryAr!,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
