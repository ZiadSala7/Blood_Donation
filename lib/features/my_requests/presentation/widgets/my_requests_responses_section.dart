import 'package:flutter/material.dart';

import '../../data/models/personal_request_response.dart';
import 'request_responses_list.dart';

class MyRequestsResponsesSection extends StatelessWidget {
  final PersonalRequestItem item;

  const MyRequestsResponsesSection({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return RequestResponsesList(item: item);
  }
}
