import 'package:flutter/material.dart';
import 'package:material_3_admin/constants.dart';

import 'component_decoration.dart';
import 'mutiple_choices.dart';
import 'single_choice.dart';

class SegmentedButtons extends StatelessWidget {
  const SegmentedButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComponentDecoration(
      label: 'Segmented buttons',
      tooltipMessage: 'Use SegmentedButton<T>',
      child: Column(
        children: <Widget>[
          SingleChoice(),
          colDivider,
          MultipleChoice(),
        ],
      ),
    );
  }
}
