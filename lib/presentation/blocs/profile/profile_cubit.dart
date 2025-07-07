import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_state.dart';
import 'package:training_project/domain/usecases/get_profile.dart';
import 'package:training_project/domain/usecases/delete_account.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfile getProfile;
  final DeleteAccount deleteAccountUsecase;
  ProfileCubit(this.getProfile, this.deleteAccountUsecase) : super(ProfileState());

  Future<void> fetchProfile() async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final user = await getProfile();
      emit(state.copyWith(
        name: user.name,
        email: user.email,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> deleteAccount() async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      await deleteAccountUsecase();
      emit(ProfileState());
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
