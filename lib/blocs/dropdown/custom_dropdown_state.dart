import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDropdownState {
  final bool isExpanded;
  final String? selectedItem;

  CustomDropdownState({this.isExpanded = false, this.selectedItem});

  CustomDropdownState copyWith({bool? isExpanded, String? selectedItem}) {
    return CustomDropdownState(
      isExpanded: isExpanded ?? this.isExpanded,
      selectedItem: selectedItem ?? this.selectedItem,
    );
  }
}