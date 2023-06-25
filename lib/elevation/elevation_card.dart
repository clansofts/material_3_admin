import 'package:flutter/material.dart';
import 'package:material_3_admin/data.dart';

class ElevationCard extends StatefulWidget {
  const ElevationCard(
      {super.key, required this.info, this.shadowColor, this.surfaceTint});

  final ElevationInfo info;
  final Color? shadowColor;
  final Color? surfaceTint;

  @override
  State<ElevationCard> createState() => _ElevationCardState();
}

class _ElevationCardState extends State<ElevationCard> {
  late double _elevation;

  @override
  void initState() {
    super.initState();
    _elevation = widget.info.elevation;
  }

  @override
  Widget build(BuildContext context) {
    const BorderRadius borderRadius = BorderRadius.all(Radius.circular(4.0));
    final Color color = Theme.of(context).colorScheme.surface;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: borderRadius,
        elevation: _elevation,
        color: color,
        shadowColor: widget.shadowColor,
        surfaceTintColor: widget.surfaceTint,
        type: MaterialType.card,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Level ${widget.info.level}',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Text(
                '${widget.info.elevation.toInt()} dp',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              if (widget.surfaceTint != null)
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      '${widget.info.overlayPercent}%',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
