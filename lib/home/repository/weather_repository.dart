import 'package:simple_weather/http/api_response.dart';

abstract class WeatherRepository{
  Future<APIResponse> getWeather(String location,String apiKey);
}