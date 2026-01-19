import 'package:flutter_bloc/flutter_bloc.dart';

import '../../databases/cach_helper.dart';
import '../../di/injection.dart';
import 'language_states.dart';

class LanguageCubit extends Cubit<LanguageStates> {
  LanguageCubit() : super(EnglishLanguage());

  final prefs = getIt.get<CacheHelper>();
  // initialization for the current language
  Future initLanguage() async {
    final currentLanguage = prefs.getString('language') ?? 'en';
    emit(currentLanguage == 'ar' ? ArabicLanguage() : EnglishLanguage());
  }

  // changing the current language
  Future changeLanguage() async {
    String currentLanguage = prefs.getString('language') ?? 'en';
    currentLanguage = currentLanguage == 'ar' ? 'en' : 'ar';
    prefs.setString('language', currentLanguage);
    emit(currentLanguage == 'ar' ? ArabicLanguage() : EnglishLanguage());
  }
}
