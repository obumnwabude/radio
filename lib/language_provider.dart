import 'package:flutter/material.dart';
import 'package:radio/language_model.dart';

class LanguageProvider with ChangeNotifier {
  LanguageModel _selected = LanguageModel.all.first;

  LanguageModel get selected => _selected;

  set selected(LanguageModel value) {
    _selected = value;
    notifyListeners();
  }
}
