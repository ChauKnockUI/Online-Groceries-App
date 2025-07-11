import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_project/data/datasources/auth_remote_data_source.dart';
import 'package:training_project/data/repositories/auth_repository_impl.dart';
import 'package:training_project/domain/usecases/sign_up_user.dart';
import 'package:training_project/presentation/routers/app_routes.dart';
import 'package:training_project/utils/globalFormat.dart';
import 'package:training_project/presentation/blocs/signup/signup_cubit.dart';
import 'package:training_project/presentation/blocs/signup/signup_state.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) => SignUpCubit(
            SignUpUser(AuthRepositoryImpl(AuthRemoteDataSource(Dio()))),
          ),
      child: BlocListener<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state.signUpSuccess) {
            Navigator.pushNamed(context, AppRoutes.login);
            context.read<SignUpCubit>().resetSuccess();
          }
        },
        child: BlocBuilder<SignUpCubit, SignUpState>(
          builder: (context, state) {
            return Scaffold(
              resizeToAvoidBottomInset: true,
              body: SafeArea(
                child: Container(
                  constraints: const BoxConstraints.expand(),
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: 50,
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'lib/assets/images/backgroundImage.png',
                      ),
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
                            fontSize: 26,
                            height: 1.5,
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
                          controller: _firstNameController,
                          style: TextStyle(
                            height: 1.5,
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w100,
                          ),
                          decoration: InputDecoration(
                            labelText: 'First Name',
                            labelStyle: TextStyle(
                              height: 2,
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
                          controller: _lastNameController,
                          style: TextStyle(
                            height: 2,
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w100,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Last Name',
                            labelStyle: TextStyle(
                              height: 2,
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
                          onChanged:
                              (value) =>
                                  context.read<SignUpCubit>().onInputChanged(
                                    value,
                                    _passwordController.text,
                                  ),
                          style: TextStyle(
                            height: 2,
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w100,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Username',
                            errorText:
                                state.isEmailInvalid
                                    ? 'Invalid username'
                                    : null,
                            labelStyle: TextStyle(
                              height: 2,
                              color: Colors.black54,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: _PasswordField(
                          controller: _passwordController,
                          onChanged:
                              (value) => context
                                  .read<SignUpCubit>()
                                  .onInputChanged(_emailController.text, value),
                          errorText:
                              state.isPasswordInvalid
                                  ? 'Invalid password'
                                  : null,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Text(
                          'By continuing you agree to our Terms of Service and Privacy Policy',
                          style: TextStyle(
                            height: 1.5,
                            fontSize: 14,
                            color: Colors.black54,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          width: 364,
                          height: 87,
                          padding: EdgeInsets.only(bottom: 20),
                          child: FloatingActionButton(
                            onPressed:
                                state.isSignUpButtonEnabled
                                    ? () {
                                      context.read<SignUpCubit>().signUp(
                                        _firstNameController.text,
                                        _lastNameController.text,
                                        _emailController.text,
                                        _passwordController.text,
                                      );
                                      if (state.signUpSuccess) {
                                        Navigator.pushNamed(
                                          context,
                                          AppRoutes.login,
                                        );
                                      }
                                    }
                                    : null,
                            backgroundColor:
                                state.isSignUpButtonEnabled
                                    ? Color(0xFF53B175)
                                    : Colors.grey,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(19),
                            ),
                            child: Text(
                              'Sign Up',
                              style: TextStyle(height: 1.5, fontSize: 18),
                            ),
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
                            onPressed:
                                () => Navigator.pushNamed(
                                  context,
                                  AppRoutes.login,
                                ),
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 14,
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
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

class _PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final String? errorText;

  const _PasswordField({
    required this.controller,
    required this.onChanged,
    this.errorText,
  });

  @override
  State<_PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<_PasswordField> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      obscureText: !showPassword,
      style: TextStyle(
        height: 2,
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        labelText: 'Password',
        suffixIcon: IconButton(
          icon: Icon(
            showPassword ? Icons.visibility_off : Icons.visibility,
            color: Colors.black54,
          ),
          onPressed: () {
            setState(() {
              showPassword = !showPassword;
            });
          },
        ),
        errorText: widget.errorText,
        labelStyle: TextStyle(
          height: 2,
          color: Colors.black54,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
