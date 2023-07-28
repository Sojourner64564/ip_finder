import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'core/network/network_info.dart';
import 'features/ip_finder/data/data_sources/ip_finder_remote_data_sources.dart';
import 'features/ip_finder/data/repositories/ip_finder_repository_impl.dart';
import 'features/ip_finder/domain/repositories/ip_finder_repository.dart';
import 'features/ip_finder/domain/usecases/get_my_ip_info.dart';
import 'features/ip_finder/presentation/bloc/ip_finder_bloc.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

void init() {
  sl.registerFactory(
    () => IpFinderBloc(
      getMyIp: sl(),
      getMyIpInfo: sl(),
    ),
  );

  sl.registerLazySingleton(() => GetMyIp(sl()));
  sl.registerLazySingleton(() => GetMyIpInfo(sl()));

  sl.registerLazySingleton<IpFinderRepository>(
    () => IpFinderRepositoryImpl(
      ipFinderRemoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<IpFinderRemoteDataSource>(
      () => IpFinderRemoteDataSourceImpl(client: sl()));

  sl.registerLazySingleton(() => http.Client());

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  sl.registerLazySingleton(() => InternetConnectionChecker());
}
