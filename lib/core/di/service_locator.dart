import 'package:express_testing/features/profile/data/data_source/profile_data_source.dart';
import 'package:express_testing/features/profile/data/data_source/profile_data_source_impl.dart';
import 'package:express_testing/features/profile/data/repository/profile_repo_impl.dart';
import 'package:express_testing/features/profile/domain/repository/profile_repo.dart';
import 'package:express_testing/features/profile/domain/usecase/delete_usecase.dart';
import 'package:express_testing/features/profile/domain/usecase/log_out_usecase.dart';
import 'package:express_testing/features/profile/domain/usecase/streaks_usecase.dart';
import 'package:express_testing/features/profile/domain/usecase/update_user.dart';
import 'package:express_testing/features/profile/domain/usecase/upload_file_usecase.dart';
import 'package:express_testing/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:express_testing/features/profile/presentation/bloc/streaks/streaks_bloc.dart';
import 'package:get_it/get_it.dart';

import '../dio_client/api_service.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Core
  sl.registerSingleton<DioClient>(DioClient());

  // DATA SOURCES
  // profile
  sl.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(dioClient: sl<DioClient>()),
  );

  // REPOSITORIES
  //profile

  sl.registerLazySingleton<ProfileRepo>(
    () => ProfileRepoImpl(remoteDataSource: sl<ProfileRemoteDataSource>()),
  );

  // USE CASES
  // profile
  sl.registerLazySingleton<UpdateUserUseCase>(
    () => UpdateUserUseCase(sl<ProfileRepo>()),
  );

  sl.registerLazySingleton<UploadFileUseCase>(
    () => UploadFileUseCase(sl<ProfileRepo>()),
  );

  sl.registerLazySingleton<DeleteUserUseCase>(
    () => DeleteUserUseCase(sl<ProfileRepo>()),
  );

  sl.registerLazySingleton<LogOutUseCase>(
    () => LogOutUseCase(sl<ProfileRepo>()),
  );

  sl.registerLazySingleton<GetStreaksUseCase>(
    () => GetStreaksUseCase(sl<ProfileRepo>()),
  );

  //BLOCS
  //     profile

  sl.registerFactory<ProfileBloc>(
    () => ProfileBloc(
      updateUserUseCase: sl<UpdateUserUseCase>(),
      uploadFileUseCase: sl<UploadFileUseCase>(),
      deleteUserUseCase: sl<DeleteUserUseCase>(),
      logOutUseCase: sl<LogOutUseCase>(),
    ),
  );

  sl.registerFactory<StreakBloc>(
    () => StreakBloc(getStreaksUseCase: sl<GetStreaksUseCase>()),
  );
}
