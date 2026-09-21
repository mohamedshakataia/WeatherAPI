import 'package:dio/dio.dart';
import 'package:weather/models/servicemodel.dart';

class Apiservice {
  final Dio dio;

  Apiservice({required this.dio});

  Future<Servicemodel> apiGetWeather({required String cityname}) async {
    try {
      Response response = await dio.get(
        'https://api.weatherapi.com/v1/forecast.json?key=3fc8596a43a041099a8154655260108&q=$cityname&days=1&aqi=no&alerts=no',
      );

      Servicemodel servicemodel = Servicemodel.fromjson(response.data);

      print(servicemodel);
      return servicemodel;
    } on DioException catch (e) {
      final String messageERROR =
          e.response?.data['error']?['message'] ?? ['Opps An Error'];
      throw Exception(messageERROR);
    } catch (e) {
      throw Exception('OOPS ERROR ,TRY LATER');
    }
  }
}
