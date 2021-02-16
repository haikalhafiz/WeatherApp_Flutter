class Weather {
  //defined properties..
  final String iconUrl;
  final String weather;
  final double temperature;
  final int humidity;
  final int dt;
  final int sunset;
  final int sunrise;

  Weather({this.iconUrl, this.weather, this.temperature, this.humidity, this.dt, this.sunset, this.sunrise,});

//Define the constructor

///TODO CREATE THE CONVERTER JSON => CLASS FROM JSONMETHOD

   factory Weather.fromJson(Map<String, dynamic>json){
    return Weather(
      iconUrl: "https://api.openweathermap.org/img/w/${json["weather"][0]["icon"]}.png",
      weather:json["weather"][0]["main"],
      temperature:json["main"]["temp"] ,
      humidity: json["main"]["humidity"],
      dt:json["dt"] ,
      sunset: json["sys"]["sunset"],
      sunrise:json["sys"]["sunrise"],

    );
   }
}

