import 'package:flutter/material.dart';

class ClockScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clock In/Out'),
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildClockOption(
              context,
              'Clock In',
              Icons.login,
              Colors.green,
            ),
          ),
          Divider(height: 2, color: Colors.white),
          Expanded(
            child: _buildClockOption(
              context,
              'Clock Out',
              Icons.logout,
              Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClockOption(
      BuildContext context,
      String label,
      IconData icon,
      Color color,
      ) {
    return InkWell(
      onTap: () => _handleClockAction(context, label),
      child: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 80,
                color: color,
              ),
              SizedBox(height: 20),
              Text(
                label,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleClockAction(BuildContext context, String action) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('Successfully $action'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.of(context).pop(); // Navigate back to PIN screen
              },
            ),
          ],
        );
      },
    );
  }
}