import 'package:flutter/material.dart';

import 'component_decoration.dart';

class DatePickers extends StatefulWidget {
  const DatePickers({super.key});

  @override
  State<DatePickers> createState() => _DatePickersState();
}

class _DatePickersState extends State<DatePickers> {
  DateTime? selectedDate;
  final DateTime _firstDate = DateTime(DateTime.now().year - 2);
  final DateTime _lastDate = DateTime(DateTime.now().year + 1);

  @override
  Widget build(BuildContext context) {
    return ComponentDecoration(
      label: 'Date picker',
      tooltipMessage: 'Use showDatePicker',
      child: TextButton(
        onPressed: () async {
          DateTime? date = await showDatePicker(
            context: context,
            initialDate: selectedDate ?? DateTime.now(),
            firstDate: _firstDate,
            lastDate: _lastDate,
          );
          setState(() {
            selectedDate = date;
            if (selectedDate != null) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                    'Selected Date: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'),
              ));
            }
          });
        },
        child: const Text(
          'Show date picker',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
