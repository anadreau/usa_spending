import 'package:isar/isar.dart';

///StateOverviewModel class
@collection
class StateOverviewModel {
  ///StateOverviewModel Constructor
  StateOverviewModel({
    required this.amount,
    required this.code,
    required this.fips,
    required this.name,
    required this.type,
  });

  ///FromJson Constructor
  factory StateOverviewModel.fromJson(Map<String, dynamic> json) {
    return StateOverviewModel(
      amount: json['amount'] as double,
      code: json['code'] as String,
      fips: json['fips'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
    );
  }

  ///Initialize Name [String]
  String name;

  ///Initialize code [String]
  @Index(type: IndexType.value)
  String code;

  ///Initialize fips [String]
  String fips;

  ///Initialize amount [double]
  double amount;

  ///Initialize type [Type]
  String type;
}
