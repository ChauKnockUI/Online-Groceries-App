import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<Map<String, dynamic>?> {
  CartCubit() : super(null);

  void selectCategory(Map<String, dynamic> category) {
    emit(category);
  }
}