import 'package:flutter/material.dart';
import 'package:weatherapilcationfull/network/weatherData.dart';
import 'package:weatherapilcationfull/getLocation.dart';
import 'package:weatherapilcationfull/widget/customExpanded.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:weatherapilcationfull/widget/customExpanded2.dart';

var dayInfo = DateTime.now();
var dateFormat = DateFormat("EEEE,d MMM,yyyy").format(dayInfo);

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  var client = WeatherData();
  var data;
  info() async {
    var position = await determinePosition();
    data = await client.getData(position.latitude, position.longitude);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: FutureBuilder(
            future: info(),
            builder: ((context, snapshot) {
              return Column(
                children: [
                  Container(
                    height: size.height * 0.75,
                    width: size.width,
                    padding: const EdgeInsets.only(top: 30),
                    margin: const EdgeInsets.only(right: 8, left: 8),
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [
                              Color(0xff955cd1),
                              Color(0xff3fa2fa),
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            stops: [0.2, 0.85]),
                        borderRadius: BorderRadius.circular(40)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                "${data?.cityName}",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 32),
                              ),
                              const Text(
                                ",",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 32),
                              ),
                              Text(
                                "${data?.country}",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 32),
                              ),
                            ],
                          ),
                        ),
                        customSizedbox(),
                        Text(
                          dateFormat,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 15),
                        ),
                        Image.network(
                          "http:${data?.icon}",
                          width: size.width * 0.36,
                          fit: BoxFit.fill,
                        ),
                        Text(
                          "${data?.condition}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 45,
                              fontWeight: FontWeight.bold),
                        ),
                        customSizedbox(),
                        Text(
                          "${data?.temp}°",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 75,
                              fontWeight: FontWeight.w800),
                        ),
                        Row(
                          children: [
                            CustomExpanded(
                              size: size,
                              image: "assets/windy.png",
                              tempuratureText: '${data?.wind}km/h',
                              text: 'Wind',
                            ),
                            CustomExpanded(
                              size: size,
                              image: "assets/images.png",
                              tempuratureText: '${data?.humidity}',
                              text: 'Humidty',
                            ),
                            CustomExpanded(
                              size: size,
                              image: "assets/wind-direction.png",
                              tempuratureText: '${data?.wind_dir}',
                              text: 'Wind Direction',
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        CustomExpanded2(
                          text1: 'Gust',
                          text2: "${data?.gust}/kp/h",
                          text3: " Pressure",
                          text4: "${data?.pressure} hpa",
                        ),
                        CustomExpanded2(
                          text1: 'UV',
                          text2: "${data?.uv}",
                          text3: "Preciptation",
                          text4: "${data?.pricipe} mm",
                        ),
                        CustomExpanded2(
                          text1: 'Wind',
                          text2: "${data?.wind}/kp/h",
                          text3: " Last update",
                          text4: "${data?.last_update}",
                        )
                      ],
                    ),
                  )
                ],
              );
            })));
  }

  SizedBox customSizedbox() {
    return const SizedBox(
      height: 10,
    );
  }
}
