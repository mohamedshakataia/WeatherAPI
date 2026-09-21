import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/weathercubit/getweathercubit.dart';
import 'package:weather/main.dart';
import 'package:weather/models/servicemodel.dart';

class Weather extends StatelessWidget {
  const Weather({super.key});
  static String id = 'Weather';
  @override
  Widget build(BuildContext context) {
    Servicemodel weather = BlocProvider.of<Getweathercubit>(context).weather!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getWeatherColor(weather.condation),
            getWeatherColor(weather.condation)[300]!,
            getWeatherColor(weather.condation)[50]!,
          ],
          begin: AlignmentGeometry.topCenter,
          end: AlignmentGeometry.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weather.cityName,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
            Text(
              'Update to: ${weather.update.hour}:${weather.update.minute}',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 80,
                  width: 110,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https:${weather.image}'),
                    ),
                  ),
                ),
                Text(
                  '${weather.temp.round()}',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                ),
                Column(
                  children: [
                    Text(
                      'maxtemp:${weather.maxTemp.round()}',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'mintemp:${weather.minTemp.round()}',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15),
            Text(
              weather.condation,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
