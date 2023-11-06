import 'package:flutter/material.dart';
// ignore_for_file: unreachable_switch_case, dead_code

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather1/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather1/cubit/get_weather_cubit/get_weather_states.dart';
import 'package:weather1/views/home_view.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                  primarySwatch: getThemeColor(
                      BlocProvider.of<GetWeatherCubit>(context)
                          .weatherModel?.weatherCondition)),
              debugShowCheckedModeBanner: false,
              home: HomeView(),
            );
          },
        );
      }),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
    case 'Clear':
    case 'Partly cloudy':
      return Colors.orange;
    case 'Cloudy':
    case 'Overcast':
      return Colors.grey;
    case 'Mist':
    case 'Patchy rain possible':
    case 'Patchy snow possible':
    case 'Patchy sleet possible':
    case 'Patchy freezing drizzle possible':
    case 'Blowing snow':
    case 'Blizzard':
    case 'Fog':
    case 'Freezing fog':
    case 'Patchy light drizzle':
    case 'Light drizzle':
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
    case 'Patchy light rain':
    case 'Light rain':
    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Heavy rain at times':
    case 'Heavy rain':
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
    case 'Ice pellets':
    case 'Light rain shower':
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
    case 'Light sleet showers':
    case 'Moderate or heavy sleet showers':
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
    case 'Light sleet':
    case 'Moderate or heavy sleet':
    case 'Light snow':
    case 'Patchy light snow':
    case 'Light snow showers':
    case 'Moderate or heavy sleet showers':
    case 'Light sleet showers':
    case 'Patchy light snow with thunder':
    case 'Light showers of ice pellets':
      return Colors.blue;
    case 'Patchy moderate snow':
    case 'Moderate snow':
    case 'Patchy heavy snow':
    case 'Heavy snow':
    case 'Light snow showers':
    case 'Moderate or heavy snow showers':
    case 'Moderate or heavy snow with thunder':
      return Colors.cyan;
    case 'Thundery outbreaks possible':
    case 'Patchy light snow with thunder':
      return Colors.deepPurple;
    default:
      return Colors.blue;
  }
}
