import 'package:express_testing/features/lesson/domain/usecases/get_task_list_usecase.dart';
import 'package:express_testing/features/lesson/presentation/bloc/get_task_bloc/get_task_bloc.dart';
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
import 'package:express_testing/features/tests_pages/data/datasources/test_data_source.dart';
import 'package:express_testing/features/tests_pages/data/datasources/test_data_source_impl.dart';
import 'package:express_testing/features/tests_pages/data/repository/test_repo_impl.dart';
import 'package:express_testing/features/tests_pages/domain/repository/test_repo.dart';
import 'package:express_testing/features/tests_pages/domain/usecase/incorrect_attamp_usecase.dart';
import 'package:express_testing/features/tests_pages/domain/usecase/progress_create_usecase.dart';
import 'package:express_testing/features/tests_pages/domain/usecase/test_usecase.dart';
import 'package:express_testing/features/tests_pages/presentation/bloc/test/test_bloc.dart';
import 'package:express_testing/features/tests_pages/presentation/bloc/test/test_selection/test_selec_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/repo/auth_repo_impl.dart';
import '../../features/auth/data/source/auth_source.dart';
import '../../features/auth/domain/repository/auth_repo.dart';
import '../../features/auth/presentation/bloc/confirm_code/confirm_code_bloc.dart';
import '../../features/auth/presentation/bloc/sendSms/send_sms_bloc.dart';
import '../../features/lesson/data/datasource/home_datasource.dart';
import '../../features/lesson/data/repository/home_repo_impl.dart';
import '../../features/lesson/domain/repository/home_repo.dart';
import '../../features/lesson/domain/usecases/get_task_usecase.dart';
import '../dio_client/api_service.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Core
  sl.registerSingleton<DioClient>(DioClient());

  // DATA SOURCES
  sl.registerLazySingleton(() => AuthSource(sl<DioClient>()));
  sl.registerLazySingleton(() => HomeSource(sl<DioClient>()));
  sl.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(dioClient: sl<DioClient>()),
  );
  sl.registerLazySingleton<TestRemoteDataSource>(
    () => TestRemoteDataSourceImpl(dioClient: sl<DioClient>()),
  );

  // REPOSITORIES
  sl.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(sl<AuthSource>()));
  sl.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(sl<HomeSource>()));
  sl.registerLazySingleton<ProfileRepo>(
    () => ProfileRepoImpl(remoteDataSource: sl<ProfileRemoteDataSource>()),
  );
  sl.registerLazySingleton<TestRepository>(
    () => TestRepoImpl(remoteDataSource: sl<TestRemoteDataSource>()),
  );

  // USE CASES
  sl.registerLazySingleton(() => FetchDailyTasksUseCase(sl<HomeRepo>()));
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

  // test
  sl.registerLazySingleton<GetTestsUseCase>(
    () => GetTestsUseCase(repository: sl<TestRepository>()),
  );

  sl.registerLazySingleton<IncorrectAttemptsAddCountUseCase>(
    () => IncorrectAttemptsAddCountUseCase(repository: sl<TestRepository>()),
  );

  sl.registerLazySingleton<ProgressCreateUseCase>(
    () => ProgressCreateUseCase(repository: sl<TestRepository>()),
  );
  sl.registerLazySingleton<GetTaskListUseCase>(
    () => GetTaskListUseCase(sl<HomeRepo>()),
  );

  //BLOCS **************************************************************
  sl.registerFactory(() => SendSmsBloc(authRepo: sl<AuthRepo>()));
  sl.registerFactory(() => ConfirmCodeBloc(sl<AuthRepo>()));

  // BLoC - Home
  // sl.registerFactory(() => GetTaskBloc(sl<FetchDailyTasksUseCase>()));
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
  sl.registerFactory<GetTaskBloc>(() => GetTaskBloc(sl<GetTaskListUseCase>()));

  // tests
  sl.registerLazySingleton<TestBloc>(
    () => TestBloc(getTestsUseCase: sl<GetTestsUseCase>()),
  );

  sl.registerLazySingleton<TestSelectionBloc>(
    () => TestSelectionBloc(
      incorrectAttemptsAddCountUseCase: sl<IncorrectAttemptsAddCountUseCase>(),
      progressCreateUseCase: sl<ProgressCreateUseCase>(),
    ),
  );
}
