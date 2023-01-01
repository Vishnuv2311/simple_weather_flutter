import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_weather/home/repository/weather_repository.dart';
import 'package:simple_weather/http/api_provider.dart';
import 'package:simple_weather/http/api_response.dart';


final weatherViewModelProvider = Provider((ref) => WeatherViewModel(ref));

class WeatherViewModel extends WeatherRepository{

  final Ref _ref;

  late final ApiProvider _api = _ref.read(apiProvider);

  WeatherViewModel(this._ref);

  @override
  Future<APIResponse> getWeather(String location,String apiKey) async {

      final param = {
        'q':location,
        'appid':apiKey,
        "units":"metric"
      };

      final weatherResponse = await _api.get('data/2.5/weather',query: param);

      return weatherResponse;

  }

}