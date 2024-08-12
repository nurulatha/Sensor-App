import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class SensorPage extends StatefulWidget {
  @override
  _SensorPageState createState() => _SensorPageState();
}

class _SensorPageState extends State<SensorPage> {
  double _x = 0.0;
  double _y = 0.0;
  double _z = 0.0;

  @override
  void initState() {
    super.initState();
    accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        _x = event.x;
        _y = event.y;
        _z = event.z;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sensor Akselerometer'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Data Akselerometer',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            _buildSensorDataCard('X', _x,
                'Menunjukkan kemiringan perangkat dari kiri ke kanan.'),
            SizedBox(height: 10),
            _buildSensorDataCard('Y', _y,
                'Menunjukkan kemiringan perangkat dari depan ke belakang.'),
            SizedBox(height: 10),
            _buildSensorDataCard('Z', _z,
                'Menunjukkan percepatan vertikal perangkat, termasuk efek gravitasi.'),
            SizedBox(height: 30),
            Center(
              child: Icon(
                Icons.phone_iphone,
                size: 100,
                color: _x.abs() > 1 || _y.abs() > 1 ? Colors.red : Colors.green,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.teal, // Ganti primary dengan backgroundColor
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              child: Text(
                'Keluar',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSensorDataCard(String label, double value, String description) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '$label: ${value.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
