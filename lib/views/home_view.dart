import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather1/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather1/cubit/get_weather_cubit/get_weather_states.dart';
import 'package:weather1/views/search_view.dart';
import 'package:weather1/widgets/no_weather_body.dart';
import 'package:weather1/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Weather App"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return SearchView();
                  }));
                },
                icon: Icon(Icons.search))
          ],
        ),
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitialState) {
              return NoWeatherBody();
            } else if (state is WeatherLoadedState) {
              return WeatherInfoBody(weatherModel: state.weatherModel,);
            } else {
              return const Text('oops, there is an erroe, try later');
            }
          },
        ));
  }
}
