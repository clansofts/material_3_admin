import 'package:flutter/material.dart';
import 'package:material_3_admin/constants.dart';
import 'package:material_3_admin/data.dart';

import 'elevation_card.dart';

class ElevationGrid extends StatelessWidget {
  const ElevationGrid({super.key, this.shadowColor, this.surfaceTintColor});

  final Color? shadowColor;
  final Color? surfaceTintColor;

  List<ElevationCard> elevationCards(
      Color? shadowColor, Color? surfaceTintColor) {
    return elevations
        .map(
          (elevationInfo) => ElevationCard(
            info: elevationInfo,
            shadowColor: shadowColor,
            surfaceTint: surfaceTintColor,
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(8),
      sliver: SliverLayoutBuilder(builder: (context, constraints) {
        if (constraints.crossAxisExtent < narrowScreenWidthThreshold) {
          return SliverGrid.count(
            crossAxisCount: 3,
            children: elevationCards(shadowColor, surfaceTintColor),
          );
        } else {
          return SliverGrid.count(
            crossAxisCount: 6,
            children: elevationCards(shadowColor, surfaceTintColor),
          );
        }
      }),
    );
  }
}
