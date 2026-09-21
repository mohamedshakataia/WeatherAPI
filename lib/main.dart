import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/weathercubit/getweathercubit.dart';
import 'package:weather/cubit/weathercubit/getweatherstate.dart';

import 'package:weather/views/home_view.dart';
import 'package:weather/views/Search.dart';
import 'package:weather/views/weather.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Getweathercubit(),
      child: Builder(
        builder: (context) => BlocBuilder<Getweathercubit, WeatherState>(
          builder: (context, state) {
            final weathertheme = getWeatherColor(
              BlocProvider.of<Getweathercubit>(context).weather?.condation,
            );
            return MaterialApp(
              theme: ThemeData(
                scaffoldBackgroundColor: weathertheme,
                colorScheme: ColorScheme.fromSeed(seedColor: weathertheme),
                appBarTheme: AppBarTheme(
                  backgroundColor: weathertheme,
                  foregroundColor: Colors.white,
                ),
              ),
              debugShowCheckedModeBanner: false,

              routes: {
                HomeView.id: (context) => HomeView(),
                Weather.id: (context) => Weather(),
                Search.id: (context) => Search(),
              },
              initialRoute: HomeView.id,
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getWeatherColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
      return Colors.amber;

    case 'Clear':
      return Colors.indigo;

    case 'Partly cloudy':
    case 'Cloudy':
    case 'Overcast':
      return Colors.blueGrey;

    case 'Mist':
    case 'Fog':
    case 'Freezing fog':
      return Colors.grey;

    case 'Patchy rain possible':
    case 'Patchy light drizzle':
    case 'Light drizzle':
    case 'Patchy light rain':
    case 'Light rain':
    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Heavy rain at times':
    case 'Heavy rain':
      return Colors.blue;

    case 'Thundery outbreaks possible':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
      return Colors.deepPurple;

    default:
      return Colors.blue;
  }
}
