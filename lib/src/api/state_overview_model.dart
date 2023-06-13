///StateOverview class
class StateOverview {
  ///StateOverview Constructor
  StateOverview({
    required this.amount,
    required this.code,
    required this.fips,
    required this.name,
    required this.type,
  });

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
