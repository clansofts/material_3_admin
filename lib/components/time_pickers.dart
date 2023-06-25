import 'package:flutter/material.dart';

import 'component_decoration.dart';

class TimePickers extends StatefulWidget {
  const TimePickers({super.key});

  @override
  State<TimePickers> createState() => _TimePickersState();
}

class _TimePickersState extends State<TimePickers> {
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return ComponentDecoration(
      label: 'Time picker',
      tooltipMessage: 'Use showTimePicker',
      child: TextButton(
        onPressed: () async {
          final TimeOfDay? time = await showTimePicker(
            context: context,
            initialTime: selectedTime ?? TimeOfDay.now(),
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  alwaysUse24HourFormat: true,
                ),
                child: child!,
              );
            },
          );
          setState(() {
            selectedTime = time;
            if (selectedTime != null) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content:
                    Text('Selected time: ${selectedTime!.format(context)}'),
              ));
            }
          });
        },
        child: const Text(
          'Show time picker',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
