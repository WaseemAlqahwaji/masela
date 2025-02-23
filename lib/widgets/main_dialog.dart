import 'package:fluent_ui/fluent_ui.dart';
import 'package:masela/core/theme/app_theme.dart';

class MainDialog extends StatefulWidget {
  final VoidCallback? onAccept, onDelete, onEdit;
  final String title;
  final Widget content;
  final BoxConstraints? constraints;

  const MainDialog({
    super.key,
    this.onDelete,
    this.onEdit,
    this.onAccept,
    required this.title,
    required this.content,
    this.constraints,
  });

  @override
  State<MainDialog> createState() => _MainDialogState();
}

class _MainDialogState extends State<MainDialog> {
  @override
  Widget build(BuildContext context) {
    return ContentDialog(
      title: Text(widget.title),
      content: widget.content,
      constraints: widget.constraints ?? kDefaultContentDialogConstraints,
      actions: [
        if (widget.onDelete != null)
          Button(
            onPressed: widget.onDelete,
            style: ButtonStyle(
              foregroundColor: WidgetStatePropertyAll(Colors.white),
                backgroundColor: WidgetStatePropertyAll(
              FluentTheme.of(context).appColors.statusColors.red,
            )),
            child: Text('حذف'),
          ),
        if (widget.onEdit != null)
          Button(
            onPressed: widget.onEdit,
            child: Text('تعديل'),
          ),
        if (widget.onAccept != null)
          Button(
            onPressed: widget.onAccept,
            child: Text('موافق'),
          ),
      ],
    );
  }
}
