import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../core/services/signalr/signalr_service.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../home/data/models/request_model.dart';
import '../widgets/case_details_card.dart';
import '../widgets/header_card.dart';
import '../widgets/progress_card.dart';
import '../widgets/requester_card.dart';
import '../widgets/stats_card.dart';

class RequestDetailsView extends StatefulWidget {
  final RequestModel request;

  const RequestDetailsView({super.key, required this.request});

  @override
  State<RequestDetailsView> createState() => _RequestDetailsViewState();
}

class _RequestDetailsViewState extends State<RequestDetailsView> {
  late SignalRService signalR;
  Timer? _refreshTimer;

  bool _isExpired(DateTime? deadline) {
    if (deadline == null) return false;
    return DateTime.now().isAfter(deadline);
  }

  String _displayStatus(RequestModel request) {
    final total = request.bagsCount ?? 1;
    final collected = request.collectedBags ?? 0;
    final progress = (collected / total).clamp(0.0, 1.0);
    if (_isExpired(request.deadline)) {
      return progress >= 1.0 ? 'مكتمل' : 'مغلق';
    }
    return request.status ?? 'مفتوح';
  }

  @override
  void initState() {
    super.initState();

    signalR = SignalRService();

    signalR.joinRequest(widget.request.id!);

    signalR.listenToRequestUpdates((id, data) {
      if (id == widget.request.id) {
        setState(() {
          // حدث البيانات هنا
        });
      }
    });

    _refreshTimer = Timer.periodic(const Duration(minutes: 1), (_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _refreshTimer?.cancel();
    signalR.leaveRequest(widget.request.id!);
    signalR.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isOpen = _displayStatus(widget.request) == 'مفتوح';

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.white,
        title: const Text('تفاصيل طلب التبرع'),
        centerTitle: true,
        actions: const [Icon(Icons.share), SizedBox(width: 12)],
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          HeaderCard(widget.request),
          const SizedBox(height: 12),
          Card(
            color: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                spacing: 15,
                children: [
                  StatsCard(widget.request),
                  ProgressCard(widget.request),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          CaseDetailsCard(widget.request),
          const SizedBox(height: 12),
          RequesterCard(widget.request),
          const SizedBox(height: 12),
          CustomButton(
            onPressed: isOpen ? () {} : null,
            label: "تبرّع الآن",
          ),
        ],
      ),
    );
  }
}
