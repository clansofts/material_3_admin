import 'package:flutter/material.dart';
import 'package:material_3_admin/constants.dart';

class ButtonsWithIcon extends StatelessWidget {
  const ButtonsWithIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: IntrinsicWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('Icon'),
            ),
            colDivider,
            FilledButton.icon(
              onPressed: () {},
              label: const Text('Icon'),
              icon: const Icon(Icons.add),
            ),
            colDivider,
            FilledButton.tonalIcon(
              onPressed: () {},
              label: const Text('Icon'),
              icon: const Icon(Icons.add),
            ),
            colDivider,
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('Icon'),
            ),
            colDivider,
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('Icon'),
            )
          ],
        ),
      ),
    );
  }
}
