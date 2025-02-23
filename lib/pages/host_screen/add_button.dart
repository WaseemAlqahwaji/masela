import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' show Icons;
import 'package:masela/core/sizer.dart';
import 'package:masela/core/theme/app_theme.dart';

class AddButton extends StatelessWidget {
  final VoidCallback onTap;
  const AddButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color:
                FluentTheme.of(context).appColors.shapeColors.cardBorderColor,
          ),
        ),
        width: 160.0,
        height: 183.0,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add,
                size: 50.0,
                color: FluentTheme.of(context).appColors.primaryColor,
              ),
              8.height(),
              Text(
                "اضافة",
                style: FluentTheme.of(context).typography.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
