import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masela/data/model/item.dart';
import 'package:masela/data/repo/item_repo.dart';

part 'items_state.dart';

class ItemsCubit extends Cubit<List<Item>> {
  ItemsCubit()
      : super(
          const [],
        );

  void get() async {
    var data = await ItemRepository().getAllItems();
    emit(data);
  }

  void add(Item service) async {
    await ItemRepository().add(service);
    get();
  }

  void edit(Item service) async {
    await ItemRepository().updateItem(service);
    get();
  }

  void delete(int id) async {
    await ItemRepository().deleteItem(id);
    get();
  }
}
