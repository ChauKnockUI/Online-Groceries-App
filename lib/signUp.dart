import 'package:flutter/material.dart';
import 'package:training_project/login.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUp> {
  bool showPassword = false;
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  var _emailInvalid = false;
  var _passwordInvalid = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Container(
          constraints: const BoxConstraints.expand(),
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 50),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/images/backgroundImage.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 70),
                child: Center(
                  child: SizedBox(
                    width: 47.84,
                    height: 55.64,
                    child: Image.asset('lib/assets/images/carrot.png'),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 26,height: 1.5,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  'Enter your credentials to continue',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ),
              Padding(
                
                padding: EdgeInsets.only(bottom: 20),
                child: TextField(
          
                  style: TextStyle( height: 1.5,
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w100,
                  ),
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    labelStyle: TextStyle( height: 2,
                      color: Colors.black54,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: TextField(
                  style: TextStyle(height: 2,
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w100,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                  
                    labelStyle: TextStyle( height: 2,
                      color: Colors.black54,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Padding(
                
                padding: EdgeInsets.only(bottom: 20),
                child: TextField(
                  controller: _emailController,
                  style: TextStyle(height: 2,
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w100,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Username',
                    error: _emailInvalid? Text('Invalid username'): null,
                    labelStyle: TextStyle( height: 2,
                      color: Colors.black54,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: TextField(
                  controller: _passwordController,
                  style: TextStyle(height: 2,
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  obscureText: !showPassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(icon: Icon(showPassword?Icons.visibility_off:Icons.visibility, color: Colors.black54,), onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },), 
                    errorText: _passwordInvalid ? 'Invalid password' : null,
                    labelStyle: TextStyle( height: 2,
                      color: Colors.black54,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Text(
                  'By continuing you agree to our Terms of Service and Privacy Policy',
                  style: TextStyle(height: 1.5,fontSize: 14, color: Colors.black54, fontWeight: FontWeight.w100),
                ),
              ),
              Center(
                child: Container(
                  width: 364,
                  height: 87,
                  padding: EdgeInsets.only(bottom: 20),
                  child: FloatingActionButton(
                    onPressed:()=> signUpButtonPressed(),
                    backgroundColor: Color(0xFF53B175),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19),
                    ),
                    child: Text('Sign Up',style: TextStyle(height: 1.5,fontSize: 18),),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () => signInButtonPressed(),
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF53B175),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    
  }
  void signUpButtonPressed() {
    setState(() {
    _emailInvalid = false;
    _passwordInvalid = false;
  });
    if (_emailController.text.isEmpty || !_emailController.text.contains('@') ) {
      setState(() {
        _emailInvalid = true;
      });
    }
    if (_passwordController.text.isEmpty || _passwordController.text.length < 6) {
      setState(() {
        _passwordInvalid = true;
      });
    }
    if (!_emailInvalid && !_passwordInvalid) {
      // Perform SignUp action
      print('SignUp button pressed');
      print('Email: ${_emailController.text}');
      print('Password: ${_passwordController.text}');
    } else {
      // Show error message
      print('Invalid email or password');
    }
  }
  void signInButtonPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }
}
