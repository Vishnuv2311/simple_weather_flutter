import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_weather/home/provider/weather_provider.dart';
import 'package:simple_weather/http/app_exception.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  final String apiKey = "4961eff22443714996e665cb0efde3b8";

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    ref.watch(weatherProvider).when(initial: () {

    }, success: (data) {

    }, loading: () {

    }, error: (error) {

    }),

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),

            const SizedBox(
              height: 50,
            ),
            const Spacer(),
            ElevatedButton(
                onPressed: () {
                  ref
                      .read(weatherProvider.notifier)
                      .getWeather("London", apiKey); // Success Api call
                },
                child: const Text("Success Call")),
            ElevatedButton(
                onPressed: () {
                  ref
                      .read(weatherProvider.notifier)
                      .getWeather("London", ""); // Failed Api call
                },
                child: const Text("Error Call")),
          ],
        ),
      ),
    );
  }

  Widget _progress() {
    return const SizedBox(
        height: 100, width: 100, child: CircularProgressIndicator());
  }

  Widget _initial() {
    return const Text(
      "Press Button For Testing",
      textAlign: TextAlign.center,
    );
  }

  Widget _success(String? data) {
    return Text(
      data ?? "Empty response",
      textAlign: TextAlign.center,
    );
  }

  Widget _error(AppException error) {
    return error.when(connectivity: () {
      return const Text(
        'No Internet Available',
        textAlign: TextAlign.center,
      );
    }, unauthorized: () {
      return const Text(
        'You are not authorized',
        textAlign: TextAlign.center,
      );
    }, errorWithMessage: (msg) {
      return Text(
        'An Error Occurred --> $msg',
        textAlign: TextAlign.center,
      );
    }, error: () {
      return const Text(
        'Unknown Error',
        textAlign: TextAlign.center,
      );
    });
  }
}
