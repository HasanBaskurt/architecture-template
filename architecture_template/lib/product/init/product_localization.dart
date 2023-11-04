import 'package:architecture_template/product/utility/conctants/enums/locales.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

@immutable
// Product localization manager
final class ProductLocalization extends EasyLocalization {
  //product need to  [child] for a wrap locale item
  ProductLocalization({required super.child, super.key})
      : super(
            supportedLocales: _supportedItems,
            path: _translationsPath,
            useOnlyLangCode: true);

  // Porject supported locales
  static final List<Locale> _supportedItems = [
    Locales.tr.locale,
    Locales.en.locale,
  ];

  static const String _translationsPath = 'asset/translations';

//Change project language by using [Locales]
  static Future<void> updateLanguage(
          {required BuildContext context, required Locales value}) =>
      context.setLocale(value.locale);
}
