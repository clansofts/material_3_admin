import 'package:flutter/material.dart';

import 'component_decoration.dart';

enum Value { first, second }

class Radios extends StatefulWidget {
  const Radios({super.key});

  @override
  State<Radios> createState() => _RadiosState();
}

enum Options { option1, option2, option3 }

class _RadiosState extends State<Radios> {
  Options? _selectedOption = Options.option1;

  @override
  Widget build(BuildContext context) {
    return ComponentDecoration(
      label: 'Radio buttons',
      tooltipMessage: 'Use RadioListTile<T> or Radio<T>',
      child: Column(
        children: <Widget>[
          RadioListTile<Options>(
            title: const Text('Option 1'),
            value: Options.option1,
            groupValue: _selectedOption,
            onChanged: (value) {
              setState(() {
                _selectedOption = value;
              });
            },
          ),
          RadioListTile<Options>(
            title: const Text('Option 2'),
            value: Options.option2,
            groupValue: _selectedOption,
            onChanged: (value) {
              setState(() {
                _selectedOption = value;
              });
            },
          ),
          RadioListTile<Options>(
            title: const Text('Option 3'),
            value: Options.option3,
            groupValue: _selectedOption,
            onChanged: null,
          ),
        ],
      ),
    );
  }
}
