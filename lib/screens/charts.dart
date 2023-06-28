import 'package:flutter/material.dart';

class Charts extends StatelessWidget {
  const Charts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);
    return Expanded(
      child: ListView(
        children: [
          const SizedBox(height: 7),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Charts",
                style: textTheme.headlineSmall,
              ),
            ),
          )
        ],
      ),
    );
  }
}
