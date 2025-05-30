import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///this class is contain every things that we needed to localization
/// 1 read the file of json 2 storage the map
/// local is instance to know the local of lang for the device
/// the method 'of' is to make instance for this class for all the app
/// this is the Dependency injection
/// and this line >> localization.of(context,name of this class)
/// for tell that the Applocalizations is localization bec we do not make implement
/// so we make injecction for all the children
class AppLocalizations {
  final Locale? locale;

  AppLocalizations({this.locale});

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static LocalizationsDelegate<AppLocalizations> delegates =
  _MyLocalizationsDelegates();

  ///for the two file of json when i read it ,the type is string bout what is the file i will load it
  ///ar or en ?? it is dependency for the local lang  by "local.languageCode"
  ///then we make decode for the file of json to map bur like we know the map
  ///here is <String , dynamic > so we convert to <String,String>
  late Map<String, String> _localizedStrings;

  Future loadJsonLanguage() async {
    String jsonString =
    await rootBundle.loadString('assets/lang/${locale?.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
  }

  String translate(String key) =>
      _localizedStrings[key] ?? "the key not exit !!";
}

class _MyLocalizationsDelegates
    extends LocalizationsDelegate<AppLocalizations> {
  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode) == true ? true : false;
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations appLocalizations = AppLocalizations(locale: locale);
    await appLocalizations.loadJsonLanguage();
    return appLocalizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      false;
}

extension TranslateX on String {
  String tr(BuildContext context) {
    return AppLocalizations.of(context)!.translate(
      this,
    );
  }
}
