import 'package:flutter/material.dart';

class Gallery extends StatelessWidget {
  const Gallery({Key? key}) : super(key: key);

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
                "Gallery",
                style: textTheme.headlineSmall,
              ),
            ),
          )
        ],
      ),
    );
  }
}
