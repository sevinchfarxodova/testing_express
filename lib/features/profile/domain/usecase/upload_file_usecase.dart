import 'dart:io';
import '../../../../core/global/models/network_response.dart';
import '../repository/profile_repo.dart';

class UploadFileUseCase {
  final ProfileRepo repo;

  UploadFileUseCase(this.repo);

  Future<NetworkResponse> call({required File file}) {
    return repo.uploadFile(file: file);
  }
}
