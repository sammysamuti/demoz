import 'package:flutter/material.dart';
import 'package:demoz/core/constants.dart';

class LoginPage extends StatefulWidget {
  static String route = 'login-page';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword = true;
  final _formKey = GlobalKey<FormState>();
  bool _emailTouched = false;
  bool _passwordTouched = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String? _emailError;
  String? _passwordError;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {
        _emailTouched = true;
        _validateEmail();
      });
    });
    _passwordController.addListener(() {
      setState(() {
        _passwordTouched = true;
        _validatePassword();
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _validateEmail() {
    final email = _emailController.text;
    if (_emailTouched) {
      if (email.isEmpty) {
        setState(() {
          _emailError = 'Please enter your email';
        });
      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
        setState(() {
          _emailError = 'Please enter a valid email address';
        });
      } else {
        setState(() {
          _emailError = null;
        });
      }
    }
  }

  void _validatePassword() {
    final password = _passwordController.text;
    if (_passwordTouched) {
      if (password.isEmpty) {
        setState(() {
          _passwordError = 'Please enter your password';
        });
      } else if (password.length < 6) {
        setState(() {
          _passwordError = 'Password must be at least 6 characters long';
        });
      } else {
        setState(() {
          _passwordError = null;
        });
      }
    }
  }

  bool get _isFormValid {
    return _emailError == null &&
        _passwordError == null &&
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    height: 100,
                                    child: Image.asset(
                                      'assets/images/logo.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    Text(
                                      'Welcome',
                                      style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(width: 8),
                                    Container(
                                      width: 30,
                                      height: 30,
                                      child: Image.asset(
                                        'assets/images/hi.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'to',
                                      style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      ' Demoz Payroll',
                                      style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w500,
                                        color: AppConstants.darkblue,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Hello there, Sign up to continue',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                ),
                                SizedBox(height: 30),
                                Stack(
                                  children: [
                                    TextFormField(
                                      controller: _emailController,
                                      decoration: InputDecoration(
                                        labelText: null,
                                        hintStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 25, horizontal: 10),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 227, 227, 227),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.blue,
                                            width: 2.0,
                                          ),
                                        ),
                                        errorText: _emailError,
                                      ),
                                      onChanged: (value) {
                                        _validateEmail();
                                      },
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    Positioned(
                                      left: 10,
                                      top: 8,
                                      child: Text(
                                        'Email Address',
                                        style: TextStyle(
                                          color: _emailController.text.isEmpty
                                              ? Colors.black
                                              : Colors.blue,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Stack(
                                  children: [
                                    TextFormField(
                                      controller: _passwordController,
                                      obscureText: _obscurePassword,
                                      decoration: InputDecoration(
                                        labelText: null,
                                        errorText: _passwordError,
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 25, horizontal: 10),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 227, 227, 227),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.blue,
                                            width: 2.0,
                                          ),
                                        ),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            _obscurePassword
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _obscurePassword =
                                                  !_obscurePassword;
                                            });
                                          },
                                        ),
                                      ),
                                      onChanged: (value) {
                                        _validatePassword();
                                      },
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    Positioned(
                                      left: 10,
                                      top: 8,
                                      child: Text(
                                        'Password',
                                        style: TextStyle(
                                          color:
                                              _passwordController.text.isEmpty
                                                  ? Colors.black
                                                  : Colors.blue,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 30),
                                ElevatedButton(
                                  onPressed: _isFormValid
                                      ? () {
                                          Navigator.pushReplacementNamed(
                                              context, 'next-page');
                                        }
                                      : null,
                                  child: Center(
                                    child: Text(
                                      'Sign up',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    minimumSize: Size(335, 56),
                                    backgroundColor: _isFormValid
                                        ? AppConstants.darkblue
                                        : Colors.grey.shade300,
                                    foregroundColor: _isFormValid
                                        ? Colors.white
                                        : Colors.grey.shade600,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Center(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: 1,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          'Or continue with social account',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          height: 1,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                OutlinedButton.icon(
                                  onPressed: () {},
                                  icon: Container(
                                    width: 24,
                                    height: 24,
                                    child: Image.asset(
                                        'assets/images/google.png',
                                        fit: BoxFit.contain),
                                  ),
                                  label: Text(
                                    'Google',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    side: BorderSide(
                                        color: const Color.fromARGB(
                                            255, 227, 227, 227),
                                        width: 1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    minimumSize: Size(double.infinity, 55),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16),
                                  ),
                                ),
                                SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {},
                            child: Text.rich(
                              TextSpan(
                                text: 'Did you already have an account? ',
                                children: [
                                  TextSpan(
                                    text: 'Login',
                                    style:
                                        TextStyle(color: AppConstants.darkblue),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
