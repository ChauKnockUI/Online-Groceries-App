import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_project/blocs/login/login_cubit.dart';
import 'package:training_project/blocs/login/login_state.dart';
import 'package:training_project/components/loading_screen.dart';
import 'package:training_project/routers/app_routes.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.loginSuccess) {
            Navigator.pushNamed(context, AppRoutes.home);
            context
                .read<LoginCubit>()
                .resetSuccess(); // Reset lại sau login thành công
          }
        },
        child: Stack(
          children: [
            Container(
              constraints: const BoxConstraints.expand(),
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 200),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/assets/images/backgroundImage.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: SingleChildScrollView(
                reverse: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(bottom: 70),
                      child: Center(
                        child: SizedBox(
                          width: 47.84,
                          height: 55.64,
                          child: Image(
                            image: AssetImage('lib/assets/images/carrot.png'),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 30),
                      child: Text(
                        'Enter your email and password',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    ),

                    BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: TextField(
                                controller: _emailController,
                                style: const TextStyle(height: 2),
                                onChanged:
                                    (_) => context
                                        .read<LoginCubit>()
                                        .onInputChanged(
                                          _emailController.text,
                                          _passwordController.text,
                                        ),
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  errorText:
                                      state.isEmailInvalid
                                          ? 'Please enter email in correct format'
                                          : null,
                                  labelStyle: const TextStyle(
                                    height: 2,
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: TextField(
                                controller: _passwordController,
                                obscureText: !state.showPassword,
                                style: const TextStyle(height: 2),
                                onChanged:
                                    (_) => context
                                        .read<LoginCubit>()
                                        .onInputChanged(
                                          _emailController.text,
                                          _passwordController.text,
                                        ),
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      state.showPassword
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Colors.black54,
                                    ),
                                    onPressed: () {
                                      context.read<LoginCubit>().toggleShowPassword();
                                    },
                                  ),
                                  errorText:
                                      state.isPasswordInvalid
                                          ? 'Invalid password'
                                          : null,
                                  labelStyle: const TextStyle(
                                    height: 2,
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),

                    Container(
                      padding: const EdgeInsets.only(left: 245, bottom: 30),
                      child: TextButton(
                        onPressed: () {
                          print('Forgot Password pressed!');
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),

                    Center(
                      child: Container(
                        width: 364,
                        height: 67,
                        padding: const EdgeInsets.only(bottom: 20),
                        child: BlocBuilder<LoginCubit, LoginState>(
                          builder: (context, state) {
                            // Kiểm tra trạng thái để xác định có thể nhấn nút hay không
                            return ElevatedButton(
                              onPressed:
                                  state.isLoginButtonEnabled && !state.isLoading
                                      ? () {
                                        context
                                            .read<LoginCubit>()
                                            .onInputChanged(
                                              _emailController.text,
                                              _passwordController.text,
                                            );
                                        context.read<LoginCubit>().login(
                                          _emailController.text,
                                          _passwordController.text,
                                        ); // thực hiện đăng nhập
                                      }
                                      : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    state.isLoginButtonEnabled
                                        ? const Color(0xFF53B175)
                                        : Colors.grey,
                                foregroundColor: Colors.white,
                                minimumSize: const Size(double.infinity, 60),
                              ),
                              child: const Text(
                                'Login',
                                style: TextStyle(fontSize: 18),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don’t have an account?',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.signup);
                          },
                          child: const Text(
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
            ),
            BlocBuilder<LoginCubit,LoginState>(builder: (context, state) {
              if (state.isLoading) {
                return const LoadingScreen();
              }
              return const SizedBox.shrink(); // Trả về một widget rỗng nếu không cần hiển thị LoadingScreen
            }),
          ],
        ),
      ),
    );
  }
}
