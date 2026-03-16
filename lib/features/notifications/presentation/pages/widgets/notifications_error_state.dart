import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';


class NotificationsErrorState extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const NotificationsErrorState({
    super.key,
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            TextButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: Text(S.of(context).retryLabel),
            ),
          ],
        ),
      ),
    );
  }
}
