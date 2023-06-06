import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radio/language_provider.dart';

import 'choose_language.dart';

class RadioScreen extends StatelessWidget {
  const RadioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Languages')),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(delegate: _Delegate(), pinned: true),
          const ChooseLanguage()
        ],
      ),
    );
  }
}

class _Delegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [BoxShadow(offset: Offset(0, 0.1), blurRadius: 2)],
        color: Theme.of(context).colorScheme.background,
      ),
      padding: const EdgeInsets.all(24),
      child: Text(
        'Selected: '
        '${Provider.of<LanguageProvider>(context).selected.name}',
        style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  double get maxExtent => 92;

  @override
  double get minExtent => 92;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate _) => false;
}
