import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignupPage(),
    );
  }
}

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _city = '';
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.contains(RegExp(r'[0-9]'))) {
                      return 'Name cannot contain numbers';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (!value!.contains(RegExp(r'[A-Z]{3}')) ||
                        !value.contains(RegExp(r'[a-z]{3}')) ||
                        !value.contains(RegExp(r'[!@#$%^&*()_+=-{};:<>,./?]{2}'))) {
                      return 'Email must contain 3 uppercase letters, 3 lowercase letters, and 2 special characters';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value!.length < 8) {
                      return 'Password must be at least 8 characters long';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      value: 'Warburton',
                      groupValue: _city,
                      onChanged: (value) {
                        setState(() {
                          _city = value as String;
                        });
                      },
                    ),
                    const Text('Warburton'),
                    const SizedBox(width: 16),
                    Radio(
                      value: 'Nankana',
                      groupValue: _city,
                      onChanged: (value) {
                        setState(() {
                          _city = value as String;
                        });
                      },
                    ),
                    const Text('Nankana'),
                    const SizedBox(width: 16),
                    Radio(
                      value: 'SKP',
                      groupValue: _city,
                      onChanged: (value) {
                        setState(() {
                          _city = value as String;
                        });
                      },
                    ),
                    const Text('SKP'),
                  ],
                ),
              ),
              Expanded(child: Container()),
              Container(
                margin: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      if (_city.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select a city'),
                          ),
                        );
                      } else {
                        final prefs = await SharedPreferences.getInstance();
                        prefs.setString('name', _nameController.text);
                        prefs.setString('email', _emailController.text);
                        prefs.setString('password', _passwordController.text);
                        prefs.setString('city', _city);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('You are successfully registered'),
                          ),
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage()),
                        );
                      }
                    }
                  },
                  child: const Text('Save'),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (!value!.contains(RegExp(r'[A-Z]{3}')) ||
                        !value.contains(RegExp(r'[a-z]{3}')) ||
                        !value.contains(
                            RegExp(r'[!@#$%^&*()_+=-{};:<>,./?]{2}'))) {
                      return 'Email must contain 3 uppercase letters, 3 lowercase letters, and 2 special characters';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value!.length < 8) {
                      return 'Password must be at least 8 characters long';
                    }
                    return null;
                  },
                ),
              ),
              Expanded(child: Container()),
              Container(
                margin: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final prefs = await SharedPreferences.getInstance();
                      String? email = prefs.getString('email');
                      String? password = prefs.getString('password');
                      if (_emailController.text == email &&
                          _passwordController.text == password) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePage()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('You are not registered successfully. Please go to signup page'),
                          ),
                        );
                      }
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignupPage()),
                    );
                  },
                  child: const Text('Go to Signup'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _name;
  String? _email;
  String? _password;
  String? _city;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('name');
      _email = prefs.getString('email');
      _password = prefs.getString('password');
      _city = prefs.getString('city');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to My Homepage',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Text('Name: $_name'),
            Text('Email: $_email'),
            Text('Password: $_password'),
            Text('City: $_city'),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('CREATE ANOTHER ACCOUNT'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignupPage()),
                );
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text('BACK TO LOGIN'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
