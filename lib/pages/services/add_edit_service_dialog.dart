import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masela/core/inputs_validator.dart';
import 'package:masela/data/model/service.dart';
import 'package:masela/logic/cubit/services_cubit.dart';
import 'package:masela/widgets/main_dialog.dart' show MainDialog;

class AddEditServiceDialog extends StatefulWidget {
  final Service? service;

  const AddEditServiceDialog({
    super.key,
    this.service,
  });

  @override
  State<AddEditServiceDialog> createState() => _AddEditServiceDialogState();
}

class _AddEditServiceDialogState extends State<AddEditServiceDialog> {
  final GlobalKey<FormState> key = GlobalKey();
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.service != null) {
      controller.text = widget.service!.name;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MainDialog(
      title: widget.service != null ? "تعديل خدمة" : "إضافة خدمة",
      constraints: BoxConstraints(maxWidth: 650, maxHeight: 400),
      content: Form(
        key: key,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormBox(
              controller: controller,
              placeholder: "اسم خدمة",
              validator: RequiredValidator(errorText: 'الحقل مطلوب').call,
            ),
          ],
        ),
      ),
      onAccept: () {
        if (key.currentState!.validate()) {
          if (widget.service != null) {
            Service service = Service(
              name: controller.text,
              id: widget.service!.id,
              unitCount: 0,
            );
            context.read<ServicesCubit>().edit(service);
          } else {
            Service service = Service(
              name: controller.text,
              unitCount: 0,
            );
            context.read<ServicesCubit>().add(service);
          }
          Navigator.pop(context);
        }
      },
    );
  }
}
