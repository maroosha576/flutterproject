import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RegistrationForm(),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  String _name = '', _email = '', _password = '';
  String _status = 'active';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? 'Enter name' : null,
                onSaved: (value) => _name = value!,
              ),
              const SizedBox(height: 16), // Add space between text boxes
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? 'Enter email' : null,
                onSaved: (value) => _email = value!,
              ),
              const SizedBox(height: 16), // Add space between text boxes
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? 'Enter password' : null,
                onSaved: (value) => _password= value!,
              ),
              const SizedBox(height: 16), // Add space between radio buttons and text boxes
              Row(
                children: [
                  Radio(
                    value: 'active',
                    groupValue: _status,
                    onChanged: (value) => setState(() => _status = value as String),
                  ),
                  const Text('Active'),
                  Radio(
                    value: 'inactive',
                    groupValue: _status,
                    onChanged: (value) => setState(() => _status = value as String),
                  ),
                  const Text('Inactive'),
                ],
              ),
              const SizedBox(height: 16), // Add space between radio buttons and button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StudentList(
                        name: _name,
                        email: _email,
                        password: _password,
                        status: _status,
                      )),
                    );
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: const Text('Data is saved'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StudentList extends StatelessWidget {
  final String name, email, password, status;


  const StudentList({super.key, required this.name, required this.email, required this.status, required this. password,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: $name'),
                  Text('Email: $email'),
                  Text('password: $password'),
                  Text('Status: $status'),
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: status == 'active' ? Colors.lightGreen : Colors.red,
                ),
                child: Icon(
                  status == 'active' ? Icons.check : Icons.close,
                  size: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}