import 'package:flutter/material.dart';
import 'package:flutter_application_1/sensor_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigasi ke halaman SensorPage
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SensorPage()),
            );
          },
          child: const Text('Sensor Akselerometer'),
        ),
      ),
    );
  }
}
