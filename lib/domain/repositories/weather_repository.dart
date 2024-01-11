import 'package:simple_weather/data/remote_data_sources/weather_remote_data_source.dart';
import 'package:simple_weather/domain/models/weather_model.dart';

class WeatherRepository {
  WeatherRepository(this._weatherRemoteDataSource);
  final WeatherRemoteDataSource _weatherRemoteDataSource;

  Future<WeatherModel?> getWeatherModel({
    required String city,
    required String country,
  }) async {
    final responseData = await _weatherRemoteDataSource.getWeatherData(
        city: city, country: country);
    if (responseData == null) {
      return null;
    }

    final name = responseData['location']['name'] as String;
    final name1 = responseData['location']['country'] as String;
    final temperature = (responseData['current']['temp_c'] + 0.0) as double;

    return WeatherModel(city: name, country: name1, temperature: temperature);
  }
}
