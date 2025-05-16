import 'package:express_testing/core/local_source/storage_repository.dart';
import 'package:express_testing/features/profile/domain/usecase/delete_usecase.dart';
import 'package:express_testing/features/profile/domain/usecase/log_out_usecase.dart';
import 'package:express_testing/features/profile/domain/usecase/upload_file_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/global/models/network_response.dart';
import '../../../data/model/profile_model.dart';
import '../../../domain/usecase/update_user.dart';
import '../profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UpdateUserUseCase updateUserUseCase;
  final UploadFileUseCase uploadFileUseCase;
  final DeleteUserUseCase deleteUserUseCase;
  final LogOutUseCase logOutUseCase;

  ProfileBloc({
    required this.updateUserUseCase,
    required this.uploadFileUseCase,
    required this.deleteUserUseCase,
    required this.logOutUseCase,
  }) : super(ProfileInitial()) {
    on<UpdateUserEvent>(_onUpdateUser);
    on<UploadFileEvent>(uploadFile);
    on<DeleteEvent>(deleteUser);
    on<LogOutEvent>(logOut);
  }

  // update user
  Future<void> _onUpdateUser(
    UpdateUserEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileUpdating());

    try {
      final response = await updateUserUseCase.call(event.profileModel);
      final updatedProfile = ProfileModel.fromJson(response.data);
      emit(ProfileUpdated(updatedProfile));
    } catch (e) {
      emit(ProfileUpdateError(e.toString()));
    }
  }

  Future<void> fetchUser(  event,
      Emitter<ProfileState> emit,) async {
    emit(ProfileUpdating());

    try{

    }catch (e) {
      emit(ProfileUpdateError(e.toString()));
    }
  }

  // upload file
  Future<void> uploadFile(
    UploadFileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileUpdating());

    try {
      final response = await uploadFileUseCase.call(file: event.file);
      emit(ProfileUpdated(response.data));
    } catch (e) {
      emit(ProfileUpdateError(e.toString()));
    }
  }

  // delete
  Future<void> deleteUser(DeleteEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileUpdating());

    NetworkResponse networkResponse = await deleteUserUseCase.call();

    if (networkResponse.errorText.isEmpty) {
      await StorageRepository.setString(key: 'access_token', value: '');
      await StorageRepository.setString(key: 'refresh_token', value: '');
      await StorageRepository.setString(key: 'user_id', value: '');
      emit(ProfileLoggedOut());
    } else {}
  }

  // logout
  Future<void> logOut(LogOutEvent event,Emitter<ProfileState> emit) async {
    await StorageRepository.setString(key: 'access_token', value: '');
    await StorageRepository.setString(key: 'refresh_token', value: '');
    await StorageRepository.setString(key: 'user_id', value: '');
    emit(ProfileLoggedOut());
  }

  Future<void> payment() async {}

}
