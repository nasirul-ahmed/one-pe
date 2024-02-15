import '/models/common_form_model.dart';

class GSTModel extends CommonFormModel {
  final String formType;
  final Map documents;
  GSTModel({
    required this.formType,
    required this.documents,
    required super.customerName,
    required super.phone,
    required super.desc,
    required super.price,
  });
}
