class StateOverview {
  StateOverview({
    required this.amount,
    required this.code,
    required this.fips,
    required this.name,
    required this.type,
  });

  String name;
  String code;
  String fips;
  double amount;
  Type type;
}

enum Type {
  state(name: 'State'),
  territory(name: 'Territory'),
  district(name: 'District');

  const Type({required this.name});
  final String name;
}
