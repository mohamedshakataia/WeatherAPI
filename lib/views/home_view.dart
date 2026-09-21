import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/weathercubit/getweathercubit.dart';
import 'package:weather/cubit/weathercubit/getweatherstate.dart';
import 'package:weather/views/Search.dart';
import 'package:weather/views/weather.dart';
import 'package:weather/widget/noweather.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = 'HomeView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Weather',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Search.id);
              },
              icon: Icon(
                Icons.search,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),

      body: BlocBuilder<Getweathercubit, WeatherState>(
        builder: (context, state) {
          if (state is NoWeatherstate) {
            return NoWeather();
          } else if (state is WeatherSuccesState) {
            return Weather();
          } else {
            return Text('opps an error');
          }
        },
      ),
    );
  }
}
