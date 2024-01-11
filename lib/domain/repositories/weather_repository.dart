import 'package:simple_weather/data/remote_data_sources/weather_remote_data_source.dart';
import 'package:simple_weather/domain/models/weather_model.dart';

class WeatherRepository {
  WeatherRepository(this._weatherRemoteDataSource);
  final WeatherRemoteDataSource _weatherRemoteDataSource;

  Future<WeatherModel?> getWeatherModel({
    required String city,
    required String country,
  }) async {
    final json = await _weatherRemoteDataSource.getWeatherData(
        city: city, country: country);
    if (json == null) {
      return null;
    }

    return WeatherModel.fromJson(json);
  }
}
