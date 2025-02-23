import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as m;
import 'package:masela/core/theme/app_theme.dart';

import '../utils/file_pick.dart';

class ImageWidget extends StatefulWidget {
  final File? file;
  final ValueChanged<File>? onImagePicked;
  final double width, height;
  const ImageWidget({
    super.key,
    this.file,
    this.onImagePicked,
    required this.width,
    required this.height,
  });

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (widget.onImagePicked == null) {
          return;
        }
        var resault = await FilePickUtil.getFile(
          ext: ["png", "jpg", "jpeg"],
        );
        if (resault != null) {
          widget.onImagePicked?.call(resault);
        }
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: FluentTheme.of(context).cardColor,
          border: Border.all(
            color:
                FluentTheme.of(context).appColors.shapeColors.cardBorderColor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: SizedBox(
          height: widget.height,
          width: widget.width,
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: widget.file == null
                      ? Icon(Icons.add_a_photo)
                      : Image.file(
                          widget.file!,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              if (widget.onImagePicked != null)
                Positioned(
                  right: 4,
                  bottom: 4,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: FluentTheme.of(context).appColors.primaryColor,
                    ),
                    child: Icon(
                      Icons.add,
                      color: m.Colors.white,
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
