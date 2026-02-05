import 'package:flutter/material.dart';

import 'request_body_text_fields.dart';
import 'sliver_appbar_with_divider.dart';
import 'sliver_appbar_with_leading.dart';

class AddRequestViewBody extends StatelessWidget {
  const AddRequestViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        /// Divider
        SliverAppBarWithLeading(),
        SliverAppBarWithDivider(),
        SliverToBoxAdapter(child: SizedBox(height: 10)),

        /// Request Body TextFields
        RequestBodyTextFields(),
      ],
    );
  }
}
