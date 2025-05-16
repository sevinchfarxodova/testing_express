import 'dart:io';

import '../../data/model/profile_model.dart';

abstract class ProfileEvent {
  const ProfileEvent();
}

class UpdateUserEvent extends ProfileEvent {
  final ProfileModel profileModel;

  const UpdateUserEvent({required this.profileModel});
}

class UploadFileEvent extends ProfileEvent {
  final File file;

  const UploadFileEvent({required this.file});
}

class LogOutEvent extends ProfileEvent {
  const LogOutEvent();
}

class DeleteEvent extends ProfileEvent {
  const DeleteEvent();
}

class StreakEvent extends ProfileEvent {
  const StreakEvent();
}
