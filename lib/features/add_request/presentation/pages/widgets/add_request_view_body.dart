import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/managers/location_cubit/cubit/location_cubit.dart';
import 'request_body_text_fields.dart';
import 'sliver_appbar_with_divider.dart';
import 'sliver_appbar_with_leading.dart';

class AddRequestViewBody extends StatefulWidget {
  const AddRequestViewBody({super.key});

  @override
  State<AddRequestViewBody> createState() => _AddRequestViewBodyState();
}

class _AddRequestViewBodyState extends State<AddRequestViewBody> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LocationCubit>().getCities();
    });
  }

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

