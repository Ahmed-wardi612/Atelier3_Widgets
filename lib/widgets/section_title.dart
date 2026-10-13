import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String titre;
  final String? action;

  const SectionTitle({super.key, required this.titre, this.action});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            titre,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        if (action != null) TextButton(onPressed: () {}, child: Text(action!)),
      ],
    );
  }
}