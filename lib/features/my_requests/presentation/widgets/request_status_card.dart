import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/request_status_utils.dart';
import '../../../../core/widgets/show_awesome_dialog.dart';
import '../../../../generated/l10n.dart';
import '../models/confirm_request_result.dart';
import 'request_status_actions.dart';
import 'request_status_avatar.dart';
import 'request_status_info.dart';

class RequestStatusCard extends StatefulWidget {
  final String name;
  final RequestStatusType statusType;
  final String time;
  final String avatarText;
  final Color avatarColor;
  final String? donorId;
  final bool forceCompleted;
  final Future<ConfirmRequestResult> Function()? onAccept;
  final Future<ConfirmRequestResult> Function()? onReject;

  const RequestStatusCard({
    super.key,
    required this.name,
    required this.statusType,
    required this.time,
    required this.avatarText,
    required this.avatarColor,
    this.donorId,
    this.forceCompleted = false,
    this.onAccept,
    this.onReject,
  });

  @override
  State<RequestStatusCard> createState() => _RequestStatusCardState();
}

class _RequestStatusCardState extends State<RequestStatusCard> {
  bool _isLoading = false;
  late bool _isConfirmed;
  bool _isHidden = false;

  @override
  void initState() {
    super.initState();
    _isConfirmed =
        widget.forceCompleted || widget.statusType == RequestStatusType.completed;
  }

  @override
  void didUpdateWidget(covariant RequestStatusCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if ((widget.forceCompleted ||
            widget.statusType == RequestStatusType.completed) &&
        !_isConfirmed) {
      _isConfirmed = true;
    }
  }

  Future<void> _handleAccept() async {
    if (widget.onAccept == null || _isLoading || _isConfirmed) return;
    setState(() => _isLoading = true);
    final result = await widget.onAccept!.call();
    if (!mounted) return;
    setState(() {
      _isLoading = false;
      if (result.success) _isConfirmed = true;
    });
    showAwesomeDialog(
      context,
      result.success ? S.of(context).successTitle : S.of(context).errorTitle,
      result.message,
      result.success,
      () {},
    );
  }

  Future<void> _handleReject() async {
    if (widget.onReject == null || _isLoading || _isConfirmed) return;
    setState(() => _isLoading = true);
    final result = await widget.onReject!.call();
    if (!mounted) return;
    setState(() {
      _isLoading = false;
      if (result.success) _isHidden = true;
    });
    showAwesomeDialog(
      context,
      result.success ? S.of(context).successTitle : S.of(context).errorTitle,
      result.message,
      result.success,
      () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isHidden) {
      return const SizedBox.shrink();
    }
    final trailing = _buildTrailing(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            color: Color(0x14000000),
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        spacing: 10,
        children: [
          RequestStatusAvatar(
            text: widget.avatarText,
            color: widget.avatarColor,
            statusColor: statusColor(widget.statusType),
          ),
          RequestStatusInfo(
            name: widget.name,
            statusType: _isConfirmed
                ? RequestStatusType.completed
                : widget.statusType,
            time: widget.time,
            donorId: widget.donorId,
            isConfirmed: _isConfirmed,
          ),
          const Spacer(),
          trailing,
        ],
      ),
    );
  }

  Widget _buildTrailing(BuildContext context) {
    if (_isLoading) {
      return const SizedBox(
        width: 24,
        height: 24,
        child: CircularProgressIndicator(strokeWidth: 2),
      );
    }
    if (_isConfirmed) {
      return Text(
        S.of(context).statusCompleted,
        style: const TextStyle(fontWeight: FontWeight.bold),
      );
    }
    return RequestStatusActions(
      onAccept: _handleAccept,
      onReject: _handleReject,
    );
  }
}
