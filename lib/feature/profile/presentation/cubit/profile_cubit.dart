import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/entity/profile.dart';
import '../../domain/usecase/get_profie_usecase.dart';
import '../../domain/usecase/update_profile_usecase.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final GetProfile getProfile;
  final UpdateProfile updateProfile;

  ProfileCubit(this.getProfile, this.updateProfile)
      : super(const ProfileState.initial());

  Future<void> loadProfile() async {
    emit(const ProfileState.loading());

    final failureOrProfile = await getProfile(NoParams());

    emit(failureOrProfile.fold(
      (failure) => ProfileState.error(failure.toString()),
      (profile) => ProfileState.loaded(profile),
    ));
  }

  Future<void> updateProfileData(Profile profile) async {
    emit(const ProfileState.loading());
    final failureOrSuccess = await updateProfile(profile);
    failureOrSuccess.fold(
      (failure) => emit(ProfileState.error(failure.toString())),
      (_) => emit(ProfileState.updated(profile)),
    );
  }
}
