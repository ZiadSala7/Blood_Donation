import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../generated/l10n.dart';
import '../../data/models/donation_history_item.dart';
import '../../data/models/donation_history_response.dart';
import 'donation_history_summary_card.dart';
import 'donation_history_card.dart';

class DonationHistoryContent extends StatelessWidget {
  final DonationHistoryResponse response;

  const DonationHistoryContent({super.key, required this.response});

  @override
  Widget build(BuildContext context) {
    final items = List<DonationHistoryItem>.from(response.items)
      ..sort((a, b) => b.donationDate.compareTo(a.donationDate));
    final latestDate = items.isNotEmpty
        ? _formatDate(context, items.first.donationDate)
        : null;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: DonationHistorySummaryCard(
            total: response.totalSize,
            latestDate: latestDate,
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              S.of(context).donationHistoryPreviousTitle,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: items.isEmpty
              ? Center(
                  child: Text(
                    S.of(context).donationHistoryEmpty,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                )
              : ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  itemCount: items.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return DonationHistoryCard(
                      item: item,
                      dateText: _formatDate(context, item.donationDate),
                    );
                  },
                ),
        ),
      ],
    );
  }

  String _formatDate(BuildContext context, DateTime date) {
    final locale = Localizations.localeOf(context).languageCode;
    return DateFormat('dd MMM yyyy', locale).format(date);
  }
}
