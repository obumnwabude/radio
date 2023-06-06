import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'language_model.dart';
import 'language_provider.dart';

class ChooseLanguage extends StatelessWidget {
  const ChooseLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: LanguageModel.all.length,
      itemBuilder: (context, i) {
        return RadioListTile(
          title: Text(LanguageModel.all[i].name),
          value: LanguageModel.all[i],
          groupValue: Provider.of<LanguageProvider>(context).selected,
          activeColor: Colors.red,
          toggleable: true,
          onChanged: (value) {
            if (value is LanguageModel) {
              Provider.of<LanguageProvider>(context, listen: false).selected =
                  value;
            }
          },
        );
      },
    );
  }
}
