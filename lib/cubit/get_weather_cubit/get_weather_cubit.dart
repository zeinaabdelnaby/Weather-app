import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather1/cubit/get_weather_cubit/get_weather_states.dart';
import 'package:weather1/models/weather_model.dart';
import 'package:weather1/services/weather_services.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());

   WeatherModel? weatherModel;

  getWeather(cityName) async {
    try {
      weatherModel =
          await WeatherServices(Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel!));
    } on Exception catch (e) {
      emit(WeatherFailureState(e.toString()));
    }
  }
}
