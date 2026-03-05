import 'package:flutter_bloc/flutter_bloc.dart';

import 'donation_states.dart';

class DonationCubit extends Cubit<DonationStates> {
  DonationCubit() : super(InitialDonation());
}
