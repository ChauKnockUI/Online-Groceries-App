import 'package:flutter/material.dart';
import 'package:training_project/home.dart';
import 'package:training_project/login.dart';
import 'package:training_project/pages/accountPage.dart';
import 'package:training_project/pages/cartPage.dart';
import 'package:training_project/pages/explorePage.dart';
import 'package:training_project/pages/favouritePage.dart';
import 'package:training_project/pages/homePage.dart';
import 'package:training_project/product_detail.dart';
import 'package:training_project/routers/app_routes.dart';
import 'package:training_project/signUp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_project/blocs/login/login_cubit.dart';
import 'package:training_project/blocs/login/login_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => LoginCubit())],
      child: MaterialApp(
        title: 'My App',
        theme: ThemeData(fontFamily: 'Roboto', primarySwatch: Colors.blue),
        initialRoute: AppRoutes.login,
        routes: {
          AppRoutes.home: (context) => const HomeScreen(),
          AppRoutes.login: (context) => Login(),
          AppRoutes.signup: (context) => const SignUp(),
          AppRoutes.productDetail: (context) => const ProductDetail(),
          AppRoutes.cartPage: (context) => const CartPage(),
          AppRoutes.explorePage: (context) => const ExplorePage(),
          AppRoutes.profilePage: (context) => const AccountPage(),
          AppRoutes.favouritePage: (context) => const FavouritePage(),
          AppRoutes.goodsPage: (context) => HomePage(),
        },
      ),
    );
  }
}
