// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather1/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather1/main.dart';
import 'package:weather1/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required WeatherModel weatherModel});

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: (LinearGradient(colors: [
          getThemeColor(weatherModel.weatherCondition),
          getThemeColor(weatherModel.weatherCondition)[300]!,
          getThemeColor(weatherModel.weatherCondition)[50]!,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter))
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                weatherModel.cityName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
              Text(
                "updated at ${weatherModel.date.hour}:${weatherModel.date.minute}",
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network("https:${weatherModel.image}"),
                  Text(weatherModel.temp.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 32)),
                  Column(
                    children: [
                      Text(
                        "Maxtemp: ${weatherModel.maxTemp.round()}",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "Mintemp: ${weatherModel.minTemp.round()}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )
                ],
              ),
              Text(weatherModel.weatherCondition,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32))
            ],
          ),
        ),
      
    );
  }
}
