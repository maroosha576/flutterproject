import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome Page'),
        backgroundColor: Colors.blueGrey,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Welcome'),
            ),
            ListTile(
              title: const Text('home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
            ListTile(
              title: const Text('Data-Entry'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DataEntryPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Calculator'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const calculatorPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Welcome to our app!',
              style: TextStyle(fontSize: 34,color: Color.fromARGB(245, 10, 10, 10)),
            ),
            SizedBox(height: 20),
            Text(
              'This is my world.',
              style: TextStyle(fontSize: 24,color: Color.fromARGB(255, 13, 12, 12)),
            ),
          ],
        ),
      ),
    );
  }
}



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          leading: Image.asset('assets/logo.jpg', width: 30),
          title: const Center(
            child: Text(
              'Baba GuruNanak University',
              style: TextStyle(color: Colors.black, fontSize: 28),
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 22, 227, 238),
        ),
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Text(
                  'About',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text('BGNU is international university'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Image.asset('assets/logo.jpg', scale: 0.9),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 8, 174, 234),
        child: Container(
          height: 40,
          child: const Center(
            child: Text(
              '2022-2026 bgnu',
              style: TextStyle(fontSize: 24, color: Color.fromARGB(255, 8, 0, 0)),
            ),
          ),
        ),
      ),
    );
  }
}



class DataEntryPage extends StatefulWidget {
  const DataEntryPage({super.key});

  @override
  State<DataEntryPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<DataEntryPage> {
  final _nameController = TextEditingController();
  final _rollNoController = TextEditingController();
  final _departmentController = TextEditingController();
  final _cgpaController = TextEditingController();

  void _saveData() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SecondPage(
          name: _nameController.text,
          rollNo: _rollNoController.text,
          department: _departmentController.text,
          cgpa: _cgpaController.text,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Entry App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _rollNoController,
              decoration: const InputDecoration(
                labelText: 'Roll No',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _departmentController,
              decoration: const InputDecoration(
                labelText: 'Department',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _cgpaController,
              decoration: const InputDecoration(
                labelText: 'CGPA',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveData,
              child: const Text('Save Data'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  final String name;
  final String rollNo;
  final String department;
  final String cgpa;

  const SecondPage({
    super.key,
    required this.name,
    required this.rollNo,
    required this.department,
    required this.cgpa,
  });

  @override
  State<SecondPage> createState() => _SecondPageState();
}




class _SecondPageState extends State<SecondPage> {
  List<Map<String, String>> _savedData = [];

  @override
  void initState() {
    super.initState();
    _savedData.add({
      'name': widget.name,
      'rollNo': widget.rollNo,
      'department': widget.department,
      'cgpa': widget.cgpa,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _savedData.isEmpty
            ? const Center(child: Text('No data saved'))
            : ListView.builder(
                itemCount: _savedData.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(_savedData[index]['name']!),
                      subtitle: Text('Roll No: ${_savedData[index]['rollNo']!}\n'
                          'Department: ${_savedData[index]['department']!}\n'
                          'CGPA: ${_savedData[index]['cgpa']!}'),
                    ),
                  );
                },
              ),
      ),
    );
  }
}






class calculatorPage extends StatefulWidget {
  const calculatorPage({super.key});

  @override
  State<calculatorPage> createState() => MyHomePageState();
}

class MyHomePageState extends State<calculatorPage> {
  final TextEditingController firstController = TextEditingController();
  final TextEditingController secondController = TextEditingController();
  double result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator App'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        color: const Color.fromARGB(255, 52, 114, 112),
        child: Column(
          children: [
            const SizedBox(height: 30),
            TextField(
              controller: firstController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'First digit',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 30),
            TextField(
              controller: secondController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Second digit',
              ),
              keyboardType: TextInputType.number,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    double a = double.parse(firstController.text);
                    double b = double.parse(secondController.text);
                    setState(() {
                      result = a + b;
                    });
                  },
                  child: const Text('Add'),
                ),
                ElevatedButton(
                  onPressed: () {
                    double a = double.parse(firstController.text);
                    double b = double.parse(secondController.text);
                    setState(() {
                      result = a - b;
                    });
                  },
                  child: const Text('Subtract'),
                ),
                ElevatedButton(
                  onPressed: () {
                    double a = double.parse(firstController.text);
                    double b = double.parse(secondController.text);
                    setState(() {
                      result = a * b;
                    });
                  },
                  child: const Text('Multiply'),
                ),
                ElevatedButton(
                  onPressed: () {
                    double a = double.parse(firstController.text);
                    double b = double.parse(secondController.text);
                    setState(() {
                      result = a / b;
                    });
                  },
                  child: const Text('Divide'),
                ),
              ],
            ),
            Text(
              'Result: $result',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}


