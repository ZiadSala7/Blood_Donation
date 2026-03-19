import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_routes.dart';
import '../../../../generated/l10n.dart';
import '../cubit/my_requests_cubit.dart';
import '../cubit/my_requests_states.dart';
import '../../data/models/personal_request_response.dart';
import 'show_share_dialog.dart';

class MyRequestsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyRequestsAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(S.of(context).myRequestsTitle),
      leading: IconButton(
        icon: Icon(Icons.chevron_left, color: Colors.grey[700]),
        onPressed: () {
          if (context.canPop()) {
            context.pop();
          } else {
            context.go(AppRoutes.btmNavBar);
          }
        },
      ),
      actions: [
        BlocBuilder<MyRequestsCubit, MyRequestsState>(
          builder: (context, state) {
            final item = _selectedItem(state);
            final requestId = item?.request.id;
            return IconButton(
              icon: const Icon(Icons.share),
              onPressed: requestId == null
                  ? null
                  : () => showShareDialog(context, requestId),
              tooltip: 'Share',
            );
          },
        ),
        const SizedBox(width: 12),
      ],
    );
  }

  PersonalRequestItem? _selectedItem(MyRequestsState state) {
    if (state is! MyRequestsSuccess) return null;
    final itemIndex = state.selectedIndex - 1;
    if (itemIndex < 0 || itemIndex >= state.items.length) return null;
    return state.items[itemIndex];
  }
}
