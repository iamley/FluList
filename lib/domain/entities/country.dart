class Country {
  final int id;
  final String name;
  final String symbol;
  final String code;
  final String image;

  Country.fromJson(Map jsonMap)
      : id = jsonMap['id'],
        name = valueOrDefaultValue(jsonMap['name']),
        symbol = valueOrDefaultValue(jsonMap['Symbol']),
        code = valueOrDefaultValue(jsonMap['Code']),
        image = valueOrDefaultValue(jsonMap['Urlimage']);
}

String valueOrDefaultValue(String value) {
  return (value == null || value.isEmpty) ? "-" : value;
}
