import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(fontSize: 50)),
          onPressed: turnOn,
          child: const Text("On"),
        ),
        const SizedBox(
          width: 50,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(fontSize: 50)),
          onPressed: turnOff,
          child: const Text("Off"),
        ),
      ],
    );
  }
}

Future<http.Response> turnOff() {
  return http.put(
      Uri.parse(
          'http://10.1.40.102/api/Oa0simWOEFOVYH0BwQyxxrTWBIcAWoZS-JSVag0K/lights/6/state'),
      headers: {"Content-Type": "application/json"},
      body: convert.jsonEncode(off));
}

Future<http.Response> turnOn() {
  return http.put(
      Uri.parse(
          'http://10.1.40.102/api/Oa0simWOEFOVYH0BwQyxxrTWBIcAWoZS-JSVag0K/lights/6/state'),
      headers: {"Content-Type": "application/json"},
      body: convert.jsonEncode(on));
}

Map off = {'on': false};
Map on = {'on': true};
