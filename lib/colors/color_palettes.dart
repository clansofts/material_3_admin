// Copyright 2021 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';
import 'color_scheme.dart';

class ColorPalettesScreen extends StatelessWidget {
  const ColorPalettesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color selectedColor = Theme.of(context).primaryColor;
    ThemeData lightTheme = ThemeData(
      colorSchemeSeed: selectedColor,
      brightness: Brightness.light,
    );
    ThemeData darkTheme = ThemeData(
      colorSchemeSeed: selectedColor,
      brightness: Brightness.dark,
    );

    Widget schemeLabel(String brightness) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Text(
          brightness,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      );
    }

    Widget schemeView(ThemeData theme) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ColorSchemeView(
          colorScheme: theme.colorScheme,
        ),
      );
    }

    Widget dynamicColorNotice() => RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: Theme.of(context).textTheme.bodySmall,
            children: [
              const TextSpan(
                  text: 'To create color schemes based on a '
                      'platform\'s implementation of dynamic color, '
                      'use the '),
              TextSpan(
                text: 'dynamic_color',
                style: const TextStyle(decoration: TextDecoration.underline),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    final url = Uri.parse(
                      'https://pub.dev/packages/dynamic_color',
                    );
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }
                  },
              ),
              const TextSpan(text: ' package.'),
            ],
          ),
        );

    return Expanded(
      child: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < narrowScreenWidthThreshold) {
          return SingleChildScrollView(
            child: Column(
              children: [
                dynamicColorNotice(),
                divider,
                schemeLabel('Light ColorScheme'),
                schemeView(lightTheme),
                divider,
                divider,
                schemeLabel('Dark ColorScheme'),
                schemeView(darkTheme),
              ],
            ),
          );
        } else {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Column(
                children: [
                  dynamicColorNotice(),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            schemeLabel('Light ColorScheme'),
                            schemeView(lightTheme),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            schemeLabel('Dark ColorScheme'),
                            schemeView(darkTheme),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
