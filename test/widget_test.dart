import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:training_project/main.dart';
import 'package:training_project/domain/usecases/login_user.dart';
import 'package:training_project/data/datasources/auth_remote_data_source.dart';
import 'package:training_project/data/repositories/auth_repository_impl.dart';

void main() {
  testWidgets('Login screen shows email field', (WidgetTester tester) async {
    final loginUser = LoginUser(AuthRepositoryImpl(AuthRemoteDataSource(Dio())));

    await tester.pumpWidget(MyApp(loginUser: loginUser));

    // Đợi load xong FutureBuilder
    await tester.pumpAndSettle();

    expect(find.byType(TextFormField), findsWidgets); // Có TextFormField
    expect(find.text('Email'), findsOneWidget);       // Có nhãn Email (tuỳ bạn đặt)
  });
}
