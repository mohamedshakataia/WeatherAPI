class Servicemodel {
  final String cityName;
  final DateTime update;
  final String image;
  final dynamic temp;
  final double maxTemp;
  final double minTemp;
  final String condation;

  Servicemodel({
    required this.cityName,
    required this.update,
    required this.image,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.condation,
  });

  factory Servicemodel.fromjson(Datajson) {
    return Servicemodel(
      cityName: Datajson['location']['name'],
      update: DateTime.parse(Datajson['current']['last_updated']),
      image: Datajson['forecast']['forecastday'][0]['day']['condition']['icon'],
      temp: Datajson['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: Datajson['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: Datajson['forecast']['forecastday'][0]['day']['mintemp_c'],
      condation:
          Datajson['forecast']['forecastday'][0]['day']['condition']['text'],
    );
  }
}
