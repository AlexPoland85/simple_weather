class WeatherModel {
  const WeatherModel({
    required this.temperature,
    required this.city,
    required this.country,
  });

  final double temperature;
  final String city;
  final String country;

  WeatherModel.fromJson(Map<String, dynamic> json)
      : temperature = json['current']['temp_c'] + 0.0,
        city = json['location']['name'],
        country = json['location']['country'];
}
