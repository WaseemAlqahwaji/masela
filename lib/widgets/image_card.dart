import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:masela/core/sizer.dart';
import 'package:masela/core/theme/app_theme.dart';
import 'package:masela/data/model/item.dart';
import 'package:masela/widgets/image_widget.dart';

class ImageCard extends StatefulWidget {
  final Item item;
  const ImageCard({super.key, required this.item});

  @override
  State<ImageCard> createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  File? file;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        color: FluentTheme.of(context).cardColor,
        border: Border.all(
          color: FluentTheme.of(context).appColors.shapeColors.cardBorderColor,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: ImageWidget(
                  width: double.infinity,
                  height: double.infinity,
                  file: File(widget.item.imagePath),
                ),
              ),
            ),
            8.height(),
            Text(
              widget.item.name,
              style: FluentTheme.of(context).typography.bodyLarge,
            )
          ],
        ),
      ),
    );
  }
}
