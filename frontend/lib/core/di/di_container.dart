
import 'package:dio/dio.dart';
import 'package:frontend/data/net/global_interceptor.dart';
import 'package:frontend/domain/repositories/services_repository.dart';
import 'package:frontend/domain/repositories/sign_in_repository.dart';
import 'package:frontend/presentation/block/main_screen/main_screen_block.dart';
import 'package:frontend/presentation/block/services_list/services_block.dart';
import 'package:frontend/presentation/block/token_cubit/token_cubit.dart';
import 'package:frontend/presentation/block/user_cubit/user_cubit.dart';
import 'package:frontend/presentation/block/user_register/register_block.dart';
import 'package:frontend/presentation/block/user_sign_in/sign_in_block.dart';
import 'package:frontend/presentation/block/welcome/welcome_block.dart';
import 'package:get_it/get_it.dart';



final sl = GetIt.instance;


Future<void> init() async {

  final dio = Dio();
  final authInterceptor = AuthInterceptor();
  sl.registerLazySingleton(() => authInterceptor);
  dio.interceptors.add(authInterceptor);
  dio.options.baseUrl = "http://192.168.0.25:5001";
  sl.registerLazySingleton(() => dio);

  sl.registerLazySingleton(() => TokenCubit());
  sl.registerLazySingleton(() => UserCubit());

  sl.registerLazySingleton(() => SignInRepository(sl<Dio>()));
  sl.registerLazySingleton(() => ServicesRepository(sl<Dio>()));

  sl.registerFactory(() => WelcomeBloc(repository: sl<SignInRepository>(),  authInterceptor: sl<AuthInterceptor>()));
  sl.registerFactory(() => RegisterBloc(repository: sl<SignInRepository>(), tokenCubit: sl<TokenCubit>()));
  sl.registerFactory(() => SignInBloc(repository: sl<SignInRepository>(), tokenCubit: sl<TokenCubit>()));
  sl.registerFactory(() => MainScreenBloc(repository: sl<SignInRepository>()));
  sl.registerFactory(() => ServicesBloc(repository: sl<ServicesRepository>()));


}
