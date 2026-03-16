import 'package:flutter/material.dart';

import 'create_donation_request_divider.dart';

class SliverAppBarWithDivider extends StatelessWidget {
  const SliverAppBarWithDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      pinned: true,
      floating: false,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      toolbarHeight: 50,
      title: CreateDonationRequestDivider(),
    );
  }
}
