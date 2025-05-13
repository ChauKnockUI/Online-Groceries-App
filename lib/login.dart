import 'package:flutter/material.dart';
import 'package:training_project/product_detail.dart';
import 'package:training_project/signUp.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<Login> {
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
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 200),
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
                  'Login',
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Text(
                  'Enter your emails and password',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ),
              Padding(
                
                padding: EdgeInsets.only(bottom: 10),
                child: TextField(
                  controller: _emailController,
                  style: TextStyle( height: 2,
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    errorText: _emailInvalid ? 'Please enter email in correct format' : null,
                    labelStyle: TextStyle( height: 2,
                      color: Colors.black54,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: TextField(
                  controller: _passwordController,
                  style: TextStyle( height: 2,
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
                    labelStyle: TextStyle(height: 2,
                      color: Colors.black54,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 245,bottom: 30),
                child: TextButton(
                  onPressed: () {
                    print('Nút được bấm!');
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.black54, fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: 364,
                  height: 67,
                  padding: EdgeInsets.only(bottom: 20),
                  child: FloatingActionButton(
                    onPressed:()=> loginButtonPressed(),
                    child: Text('Login',style: TextStyle(fontSize: 18),),
                    backgroundColor: Color(0xFF53B175),
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an account?',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: ()=>{signUpButtonPressed()},
                    child: Text(
                      'SignUp',
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
  void loginButtonPressed() {
    setState(() {
    _emailInvalid = false;
    _passwordInvalid = false;
  });
    if (!(_emailController.text.length>11) || !_emailController.text.endsWith('@gmail.com') ) {
      setState(() {
        _emailInvalid = true;
      });
    }
    if (!(_passwordController.text.contains(RegExp(r'[A-Z]')))|| !(_passwordController.text.contains(RegExp(r'[a-z]')))||!(_passwordController.text.contains(RegExp(r'[0-9]'))) || _passwordController.text.length < 6) {
      setState(() {
        _passwordInvalid = true;
      });
    }
    if (!_emailInvalid && !_passwordInvalid) {
      // Perform login action
      print('Login button pressed');
      print('Email: ${_emailController.text}');
      print('Password: ${_passwordController.text}');
      // Navigate to the next screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductDetail(),
        ),
      );
    } else {
      // Show error message
      print('Invalid email or password');
    }
  }
  void signUpButtonPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignUp(),
      ),
    );
  }
  
}
