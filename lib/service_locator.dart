import 'package:express_testing/features/auth/data/source/auth_source.dart';
import 'package:get_it/get_it.dart';

import 'core/dio_client/api_service.dart';
import 'features/auth/data/repo/auth_repo_impl.dart';
import 'features/auth/domain/repository/auth_repo.dart';
import 'features/auth/presentation/bloc/confirm_code/confirm_code_bloc.dart';
import 'features/auth/presentation/bloc/sendSms/send_sms_bloc.dart';
import 'features/lesson/data/datasource/home_datasource.dart';
import 'features/lesson/data/repository/home_repo_impl.dart';
import 'features/lesson/domain/repository/home_repo.dart';
import 'features/lesson/domain/usecases/get_task_usecase.dart';
import 'features/lesson/presentation/bloc/get_task_bloc/get_task_bloc.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {

  // Core
  sl.registerLazySingleton(() => ApiClient());

  // Data Sources
  sl.registerLazySingleton(() => AuthSource(sl<ApiClient>()));
  sl.registerLazySingleton(() => HomeSource(sl<ApiClient>()));



  // Repositories
  sl.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(sl<AuthSource>()));
  sl.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(sl<HomeSource>()));

  // Use Cases
  sl.registerLazySingleton(() => FetchDailyTasksUseCase(sl<HomeRepo>()));

  // BLoC - Auth
  sl.registerFactory(() => SendSmsBloc(authRepo: sl<AuthRepo>()));
  sl.registerFactory(() => ConfirmCodeBloc(sl<AuthRepo>()));

  // BLoC - Home
 // sl.registerFactory(() => GetTaskBloc(sl<FetchDailyTasksUseCase>()));
}
