import '../../data/model/profile_model.dart';

abstract class ProfileState  {
  const ProfileState();
}

class ProfileInitial extends ProfileState {}

class ProfileUpdating extends ProfileState {}

class ProfileUpdated extends ProfileState {
  final ProfileModel updatedProfile;

  const ProfileUpdated(this.updatedProfile);

}

class ProfileUpdateError extends ProfileState {
  final String message;

  const ProfileUpdateError(this.message);

}

class ProfileLoggedOut extends ProfileState {}
