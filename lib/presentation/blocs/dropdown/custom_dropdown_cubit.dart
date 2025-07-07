import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_project/presentation/blocs/dropdown/custom_dropdown_state.dart';

class CustomDropdownCubit extends Cubit<CustomDropdownState> {
  CustomDropdownCubit() : super(CustomDropdownState());

  void toggleExpand() => emit(state.copyWith(isExpanded: !state.isExpanded));

  void selectItem(String item) =>
      emit(state.copyWith(selectedItem: item, isExpanded: false));
}