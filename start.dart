
import 'package:flutter/material.dart';
import 'package:flutter_application_2/end.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyNamePage(), // Changed this line
    ),
  );
}

class MyNamePage extends StatelessWidget {
  const MyNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Marosha', style: TextStyle(fontSize: 30)),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Click Me'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()), // Assuming hhdh is a widget
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
