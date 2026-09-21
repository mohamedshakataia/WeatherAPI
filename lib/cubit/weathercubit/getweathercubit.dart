import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/weathercubit/getweatherstate.dart';
import 'package:weather/models/servicemodel.dart';
import 'package:weather/service/apiservice.dart';

class Getweathercubit extends Cubit<WeatherState> {
  Getweathercubit() : super(NoWeatherstate());
  Servicemodel? weather;
  getweather({required String value}) async {
    try {
      weather = await Apiservice(dio: Dio()).apiGetWeather(cityname: value);
      print(weather);
      emit(WeatherSuccesState());
    } catch (e) {
      return Text('opps error');
    }
  }
}
