import 'package:fluent_ui/fluent_ui.dart';

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
        if (widget.onAccept != null)
          Button(
            onPressed: widget.onAccept,
            child: Text('موافق'),
          ),
        if (widget.onEdit != null)
          Button(
            onPressed: widget.onEdit,
            child: Text('تعديل'),
          ),
        if (widget.onDelete != null)
          Button(
            onPressed: widget.onDelete,
            child: Text('حذف'),
          ),
      ],
    );
  }
}
