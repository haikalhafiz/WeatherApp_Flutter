import 'package:flutter/material.dart';
import 'dart:convert';
import 'weather.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/weather.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WeatherPage(),
    );
  }
}

class  WeatherPage extends StatefulWidget {
  var weather;
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  Weather weather;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text("Weather App"),),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child:
                  TextField(decoration: InputDecoration(hintText: "Enter the city"),)),
                  FlatButton(onPressed: (){
                   fetchWeather().then((tempweather) {
                     setState(() {
                     weather = tempweather;
                   });
                  });

                  }, child: Text("Search"),color:Colors.blue,),
                ],
              ),
             weather != null ?
             Column(children: [
                     Text("${weather.dt}"),
                     Text(weather.weather),
                     Image.network(weather.iconUrl)
                      ],
                    )
               : SizedBox(height: 10,)

             ],
            ),
        ),
        );
       }
      }
      Future<Weather> fetchWeather() async {
        final response = await http.get('https://api.openweathermap.org/data/2.5/weather?q=kuala%20lumpur&appid=d5f70abeed23498929c72bbb3fab1733');

        if (response.statusCode == 200) {
          // If the server did return a 200 OK response,
          // then parse the JSON.
          return Weather.fromJson(jsonDecode(response.body));
        } else {
          // If the server did not return a 200 OK response,
          // then throw an exception.
          throw Exception('Failed to load weather');
        }
      }
