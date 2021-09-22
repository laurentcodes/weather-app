import '../services/location.dart';
import '../services/networking.dart';

const apiKey = '8f73e23d479e43a847d682e8089e601f';
final openWeatherMapURL = Uri.parse(
  'https://api.openweathermap.org/data/2.5/onecall',
);
final openWeatherMapCityURL = Uri.parse(
  'https://api.openweathermap.org/data/2.5/weather',
);

class WeatherModel {
  double lat = 0;
  double long = 0;

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    lat = location.latitude;
    long = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(
      Uri.parse(
          '$openWeatherMapURL?lat=$lat&lon=$long&exclude=minutely&appid=$apiKey&units=metric'),
    );

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(Uri.parse(
      '$openWeatherMapCityURL?q=$cityName&appid=$apiKey&units=metric',
    ));

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 30) {
      return 'A sunny day in your location, consider wearing your UV protection.';
    } else if (temp >= 25) {
      return 'A cloudy day will occur all day long, don\'t worry about the heat of the Sun ☀️';
    } else if (temp < 25) {
      return 'Potential for rain ☔️ today is high, don\'t forget to bring your umbrella.';
    } else {
      return 'Bring a 🧥 just in case.';
    }
  }
}
