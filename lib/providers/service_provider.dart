import '../models/service_model.dart';

import '../_helpers/config/config.dart';

class ServiceProvider {
  late final List<ServiceModel> services;
  ServiceProvider(services) {
    this.services =
        serviceAvailabe.map((e) => ServiceModel.fromMap(e)).toList();
  }

  get getServices => services;
}
