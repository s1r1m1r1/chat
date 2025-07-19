// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Мое Замечательное Приложение';

  @override
  String get helloWorld => 'Привет, мир!';

  @override
  String welcomeMessage(String userName) {
    return 'Добро пожаловать, $userName!';
  }

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count предмета',
      many: '$count предметов',
      few: '$count предмета',
      one: '1 предмет',
      zero: 'Нет предметов',
    );
    return '$_temp0';
  }
}
