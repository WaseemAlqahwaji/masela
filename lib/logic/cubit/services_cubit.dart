import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masela/data/model/service.dart';
import 'package:masela/data/repo/service_repo.dart';

class ServicesCubit extends Cubit<List<Service>> {
  ServicesCubit() : super(const []);

  void get() async {
    var data = await ServiceRepository().getAllServices();
    emit(data);
  }

  void add(Service service) async {
    await ServiceRepository().add(service);
    get();
  }

  void edit(Service service) async {
    await ServiceRepository().updateService(service);
    get();
  }

  void delete(int id) async {
    await ServiceRepository().delete(id);
    get();
  }
}
