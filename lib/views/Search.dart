import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/weathercubit/getweathercubit.dart';

class Search extends StatelessWidget {
  const Search({super.key});
  static String id = 'Scearh';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
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
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            onSubmitted: (value) {
              var getweathercubit = BlocProvider.of<Getweathercubit>(context);
              getweathercubit.getweather(value: value);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              label: Text('Search'),
              hint: Text('Enter City Name'),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.red),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.red),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.red),
              ),
              suffixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }
}
