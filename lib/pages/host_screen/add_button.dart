import 'package:fluent_ui/fluent_ui.dart';
import 'package:masela/core/sizer.dart';
import 'package:masela/core/theme/app_theme.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: FluentTheme.of(context).appColors.shapeColors.cardBorderColor
        )
      ),
      width: 160.0,
      height: 183.0,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(IconData(0xe70d)),
            8.height(),
            Text(
              "اضافة",
              style: FluentTheme.of(context).typography.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
