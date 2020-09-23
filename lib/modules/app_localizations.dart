/*
	 *************************************************************************************************************************************
	 *                                                                                                                                    *
	 * Copyright (c) 2013-2020 Minebrat Private Limited
	 * =================================================                                                                                  *
	 *                                                                                                                                    *
	 * Licensed under The MIT-Zero License                                                                                                *
	 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software                                      *
	 * and associated documentation files (the "Software"), to deal in the Software without restriction,                                  *
	 * including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,                              *
	 * and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so.                              *
	 *                                                                                                                                    *
	 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED                      *
	 * TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL                      *
	 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,            *
	 * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.           *
	 *                                                                                                                                    *
	 *                                                                                                                                    *
	 * @author Minebrat Private Limited                                                                                                                   *
	 * @license MIT-Zero License                                                                                                          *
	 * @version 2.0.0                                                                                                                     *
	 *                                                                                                                                    *
	 **************************************************************************************************************************************
	 */
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  static final AppLocalizations _singleton = new AppLocalizations._internal();
  AppLocalizations._internal();
  static AppLocalizations get instance => _singleton;

  Map<dynamic, dynamic> _localisedValues;

  Future<AppLocalizations> load(Locale locale) async {
    String jsonContent =
        await rootBundle.loadString("assets/i18n/${locale.languageCode}.json");
    _localisedValues = json.decode(jsonContent);
    return this;
  }

  String text(String key) {
    return _localisedValues[key] ?? "$key not found";
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.instance.load(locale);
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => true;
}
