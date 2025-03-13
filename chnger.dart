import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(
          child: NameChanger(),
        ),
      ),
    ),
  );
}

class NameChanger extends StatefulWidget {
  const NameChanger({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NameChangerState createState() => _NameChangerState();
}

class _NameChangerState extends State<NameChanger> {
  List<String> names = ['Fatima', 'Marosha', 'Ayesha'];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(names[currentIndex], style: TextStyle(fontSize: 50)),
        SizedBox(height: 20),
        ElevatedButton(
          child: Text('Click'),
          onPressed: () {
            setState(() {
              currentIndex = (currentIndex + 1) % names.length;
            });
          },
        ),
      ],
    );
  }
}