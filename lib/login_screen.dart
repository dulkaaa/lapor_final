import 'package:flutter/material.dart';
import 'package:lapor_final/main.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}
     
class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            Visibility(
              visible: _errorMessage.isNotEmpty,
              child: Text(
                _errorMessage,
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _isLoading ? null : _login,
              child: _isLoading
                  ? CircularProgressIndicator()
                  : Text('Login'),
            ),
            SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }

  void _login() {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    // Perform basic validation
    if (username.isEmpty || password.isEmpty) {
      setState(() {
        _errorMessage = 'Please enter both username and password.';
      });
      return;
    }

    // Simulate a login request (replace with your actual authentication logic)
    setState(() {
      _isLoading = true;
    });
    Future.delayed(Duration(seconds: 2), () {
      // Replace this with actual authentication logic
      if (username == 'admin' && password == 'admin') {
        // Successful login
        setState(() {
          _isLoading = false;
          _errorMessage = '';
        });
        _navigateToHome();
      } else {
        // Failed login
        setState(() {
          _isLoading = false;
          _errorMessage = 'Invalid username or password. Please try again.';
        });
      }
    });
  }

  void _navigateToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Dashboard()), // Navigate to Dashboard
    );
  }
}
