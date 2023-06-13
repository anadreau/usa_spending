///StateOverview class
class StateOverviewModel {
  ///StateOverview Constructor
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
      type: json['type'] as Type,
    );
  }

  ///Initialize Name [String]
  String name;

  ///Initialize code [String]
  String code;

  ///Initialize fips [String]
  String fips;

  ///Initialize amount [double]
  double amount;

  ///Initialize type [Type]
  Type type;
}

///Enum for State [Type]
enum Type {
  ///State
  state(name: 'State'),

  ///Territory
  territory(name: 'Territory'),

  ///District
  district(name: 'District');

  const Type({required this.name});

  ///Initialize Name
  final String name;
}
