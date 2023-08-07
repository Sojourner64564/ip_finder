// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i3;

import '../../features/ip_finder/data/data_sources/ip_finder_remote_data_sources.dart'
    as _i4;
import '../../features/ip_finder/data/repositories/ip_finder_repository_impl.dart'
    as _i7;
import '../../features/ip_finder/domain/repositories/ip_finder_repository.dart'
    as _i6;
import '../../features/ip_finder/domain/usecases/get_my_ip_info.dart' as _i8;
import '../../features/ip_finder/presentation/bloc/ip_finder_bloc.dart' as _i9;
import '../network/network_info.dart' as _i5;
import 'injectable.dart' as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final registerModuleConnectionChecker = _$RegisterModuleConnectionChecker();
  gh.factory<_i3.InternetConnectionChecker>(
      () => registerModuleConnectionChecker.internetConnection);
  gh.lazySingleton<_i4.IpFinderRemoteDataSource>(
      () => _i4.IpFinderRemoteDataSourceImpl());
  gh.lazySingleton<_i5.NetworkInfo>(
      () => _i5.NetworkInfoImpl(get<_i3.InternetConnectionChecker>()));
  gh.lazySingleton<_i6.IpFinderRepository>(() => _i7.IpFinderRepositoryImpl(
        get<_i4.IpFinderRemoteDataSource>(),
        get<_i5.NetworkInfo>(),
      ));
  gh.lazySingleton<_i8.GetMyIp>(
      () => _i8.GetMyIp(get<_i6.IpFinderRepository>()));
  gh.lazySingleton<_i8.GetMyIpInfo>(
      () => _i8.GetMyIpInfo(get<_i6.IpFinderRepository>()));
  gh.lazySingleton<_i9.IpFinderBloc>(() => _i9.IpFinderBloc(
        get<_i8.GetMyIpInfo>(),
        get<_i8.GetMyIp>(),
      ));
  return get;
}

class _$RegisterModuleConnectionChecker
    extends _i10.RegisterModuleConnectionChecker {}
