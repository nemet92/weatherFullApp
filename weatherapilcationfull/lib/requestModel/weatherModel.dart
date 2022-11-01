class Weather {
  var cityName;
  var country;
  var icon;
  var condition;
  var temp;
  var wind;
  var humidity;
  var wind_dir;
  var gust;
  var uv;
  var pressure;
  var pricipe;
  var last_update;

  Weather({
    required this.cityName,
    required this.country,
    required this.icon,
    required this.condition,
    required this.temp,
    required this.wind,
    required this.humidity,
    required this.wind_dir,
    required this.gust,
    required this.uv,
    required this.last_update,
    required this.pressure,
    required this.pricipe,
  });

  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json['location']["name"];
    country = json['location']["country"];

    icon = json["current"]['condition']['icon'];
    condition = json["current"]["condition"]["text"];
    temp = json["current"]["temp_c"];
    wind = json["current"]["wind_kph"];
    humidity = json["current"]["humidity"];
    wind_dir = json["current"]["wind_dir"];
    pressure = json["current"]["pressure_mb"];
    pricipe = json["current"]["precip_mm"];
    last_update = json["current"]["last_updated"];
    gust = json["current"]["gust_kph"];
    uv = json["current"]["uv"];
  }
}
