import 'package:fluent_ui/fluent_ui.dart';
import 'package:masela/core/sizer.dart';

class HorizontalCard extends StatefulWidget {
  final String title;
  final List<Widget> actions;

  const HorizontalCard({
    super.key,
    required this.title,
    required this.actions,
  });

  @override
  State<HorizontalCard> createState() => _HorizontalCardState();
}

class _HorizontalCardState extends State<HorizontalCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: FluentTheme.of(context).cardColor,
        borderRadius: BorderRadius.circular(
          12,
        ),
      ),
      child: Row(
        children: [
          Text(
            widget.title,
            style: FluentTheme.of(context).typography.bodyLarge,
          ),
          const Spacer(),
          for (var e in widget.actions) ...[
            e,
           8.width(),
          ],
        ],
      ),
    );
  }
}
