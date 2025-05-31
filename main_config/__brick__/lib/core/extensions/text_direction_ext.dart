import 'package:flutter/widgets.dart';

extension LocaleTextDirectionExtension on BuildContext {
  TextDirection get textDirection {
    const rtlLanguages = ['ar', 'fa'];
    final langCode = Localizations.localeOf(this).languageCode;
    return rtlLanguages.contains(langCode)
        ? TextDirection.rtl
        : TextDirection.ltr;
  }
}