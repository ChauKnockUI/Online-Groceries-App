import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_project/presentation/blocs/login/login_cubit.dart';
import 'package:training_project/presentation/blocs/cart/cart_cubit.dart';
import 'package:training_project/presentation/pages/home.dart';
import 'package:training_project/presentation/pages/login.dart';
import 'package:training_project/presentation/pages/signUp.dart';
import 'package:training_project/presentation/pages/accountPage.dart';
import 'package:training_project/presentation/pages/cartPage.dart';
import 'package:training_project/presentation/pages/explorePage.dart';
import 'package:training_project/presentation/pages/favouritePage.dart';
import 'package:training_project/presentation/pages/homePage.dart';
import 'package:training_project/presentation/pages/product_detail.dart';
import 'package:training_project/presentation/routers/app_routes.dart';
import 'package:training_project/data/datasources/auth_remote_data_source.dart';
import 'package:training_project/data/repositories/auth_repository_impl.dart';
import 'package:training_project/domain/usecases/login_user.dart';

void main() {
  
  final authRepository = AuthRepositoryImpl(AuthRemoteDataSource( Dio()));
  final loginUser = LoginUser(authRepository);

  runApp(MyApp(loginUser: loginUser));
}

class MyApp extends StatelessWidget {
  final LoginUser loginUser;
  const MyApp({super.key, required this.loginUser});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginCubit(loginUser)),
        BlocProvider(create: (_) => CartCubit()),
      ],
      child: MaterialApp(
        title: 'My App',
        theme: ThemeData(fontFamily: 'Roboto', primarySwatch: Colors.blue),
        initialRoute: AppRoutes.login,
        routes: {
          AppRoutes.home: (context) => const HomeScreen(),
          AppRoutes.login: (context) => Login(),
          AppRoutes.signup: (context) => SignUp(),
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
