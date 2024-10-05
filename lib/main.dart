import 'package:flutter/material.dart';
import 'clock_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clock App',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF007AFF), // Apple blue color
        scaffoldBackgroundColor: Colors.black,
      ),
      home: PinScreen(),
    );
  }
}

class PinScreen extends StatefulWidget {
  @override
  _PinScreenState createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  String _pin = '';

  void _addDigit(String digit) {
    setState(() {
      if (_pin.length < 4) {
        _pin += digit;
      }
    });
  }

  void _removeDigit() {
    setState(() {
      if (_pin.isNotEmpty) {
        _pin = _pin.substring(0, _pin.length - 1);
      }
    });
  }

  void _submitPin() {
    if (_pin.length == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ClockScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter PIN'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter 4-digit PIN',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                4,
                (index) => Container(
                  width: 50,
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      index < _pin.length ? '•' : '',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: 300,
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                childAspectRatio: 1.5,
                children: List.generate(12, (index) {
                  if (index == 9) {
                    return Container();
                  } else if (index == 10) {
                    return _buildKeypadButton('0');
                  } else if (index == 11) {
                    return _buildKeypadButton(
                      'Del',
                      onPressed: _removeDigit,
                      color: Colors.red,
                    );
                  } else {
                    return _buildKeypadButton('${index + 1}');
                  }
                }),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitPin,
              child: Text('Enter'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF007AFF),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKeypadButton(String label,
      {VoidCallback? onPressed, Color? color}) {
    return Container(
      margin: EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: onPressed ?? () => _addDigit(label),
        child: Text(
          label,
          style: TextStyle(fontSize: 24),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? Color(0xFF007AFF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
