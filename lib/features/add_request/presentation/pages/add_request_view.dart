import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../../core/widgets/custom_button.dart';
import 'widgets/add_request_view_body.dart';

class AddRequestView extends StatelessWidget {
  const AddRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   scrolledUnderElevation: 0,
      //   backgroundColor: Colors.transparent,
      // ),
      body: const SafeArea(child: AddRequestViewBody()),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: CustomButton(onPressed: () {}, label: S.of(context).addRqustBtn),
      ),
    );
  }
}
