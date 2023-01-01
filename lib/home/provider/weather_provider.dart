import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_weather/home/repository/weather_repository.dart';
import 'package:simple_weather/http/api_response.dart';

import '../viewmodel/weather_vewmodel.dart';

final weatherProvider =
    StateNotifierProvider<WeatherProvider, APIResponse>((ref) {
  return WeatherProvider(ref);
});

class WeatherProvider extends StateNotifier<APIResponse> {
  WeatherProvider(this._ref) : super(const APIResponse.initial()) {}

  final Ref _ref;
  late final WeatherRepository _weatherRepository =
      _ref.read(weatherViewModelProvider);

  Future<void> getWeather(String location,String apiKey) async {
    state = APIResponse.loading()
    state = APIResponse.success(["dfsf","dfsdfs","sdfsdfsd"])
  }
}
