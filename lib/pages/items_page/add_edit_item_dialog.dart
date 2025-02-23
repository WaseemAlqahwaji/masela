import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masela/core/inputs_validator.dart';
import 'package:masela/core/sizer.dart';
import 'package:masela/data/model/item.dart';
import 'package:masela/logic/cubit/items_cubit.dart';
import 'package:masela/widgets/image_widget.dart';
import 'package:masela/widgets/main_dialog.dart' show MainDialog;

class AddEditItemDialog extends StatefulWidget {
  final Item? item;

  const AddEditItemDialog({
    super.key,
    this.item,
  });

  @override
  State<AddEditItemDialog> createState() => _AddEditItemDialogState();
}

class _AddEditItemDialogState extends State<AddEditItemDialog> {
  final GlobalKey<FormState> key = GlobalKey();
  TextEditingController controller = TextEditingController();

  String? imagePath;

  @override
  void initState() {
    super.initState();
    imagePath = widget.item?.imagePath;
    if (widget.item != null) {
      controller.text = widget.item!.name;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MainDialog(
      title: widget.item != null ? "تعديل صنف" : "إضافة صنف",
      constraints: BoxConstraints(maxWidth: 650, maxHeight: 600),
      content: Form(
        key: key,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ImageWidget(
              file: imagePath == null ? null : File(imagePath!),
              onImagePicked: (f) {
                setState(() {
                  imagePath = f.path;
                });
              },
              width: MediaQuery.of(context).size.width,
              height: 200,
            ),
            16.height(),
            TextFormBox(
              controller: controller,
              placeholder: "اسم الصنف",
              validator: RequiredValidator(errorText: 'الحقل مطلوب').call,
            ),
          ],
        ),
      ),
      onDelete: widget.item != null
          ? () {
              context.read<ItemsCubit>().delete(widget.item!.id!);
              Navigator.pop(context);
            }
          : null,
      onAccept: () {
        if (key.currentState!.validate() && imagePath != null) {
          if (widget.item != null) {
            Item service = Item(
              name: controller.text,
              id: widget.item!.id,
              imagePath: imagePath!,
            );
            context.read<ItemsCubit>().edit(service);
          } else {
            Item service = Item(
              name: controller.text,
              imagePath: imagePath!,
            );
            context.read<ItemsCubit>().add(service);
          }
          Navigator.pop(context);
        }
      },
    );
  }
}
