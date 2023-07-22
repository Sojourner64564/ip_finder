import 'package:get_it/get_it.dart';

import 'features/ip_finder/data/repositories/ip_finder_repository_impl.dart';
import 'features/ip_finder/domain/repositories/ip_finder_repository.dart';
import 'features/ip_finder/domain/usecases/get_my_ip_info.dart';
import 'features/ip_finder/presentation/bloc/ip_finder_bloc.dart';

final sl = GetIt.instance;

void init(){
sl.registerFactory(
        () => IpFinderBloc(
            getMyIpInfo: sl(),
        ),
);

  sl.registerLazySingleton(() => GetMyIpInfo(sl()));
  sl.registerLazySingleton<IpFinderRepository>(() =>
    IpFinderRepositoryImpl()
);

}