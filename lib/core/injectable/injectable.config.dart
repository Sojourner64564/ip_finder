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
    as _i5;
import '../../features/ip_finder/data/repositories/ip_finder_repository_impl.dart'
    as _i8;
import '../../features/ip_finder/domain/repositories/ip_finder_repository.dart'
    as _i7;
import '../../features/ip_finder/domain/usecases/get_my_ip/get_my_ip.dart'
    as _i9;
import '../../features/ip_finder/domain/usecases/get_my_ip_info/get_my_ip_info.dart'
    as _i10;
import '../../features/ip_finder/presentation/bloc/ip_finder_bloc.dart' as _i11;
import '../data_sources/ip_finder_remote_data_source/ip_finder_remote_data_source.dart'
    as _i4;
import '../network/network_info.dart' as _i6;
import 'injectable.dart' as _i12; // ignore_for_file: unnecessary_lambdas

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
      () => _i5.IpFinderRemoteDataSourceImpl());
  gh.lazySingleton<_i6.NetworkInfo>(
      () => _i6.NetworkInfoImpl(get<_i3.InternetConnectionChecker>()));
  gh.lazySingleton<_i7.IpFinderRepository>(() => _i8.IpFinderRepositoryImpl(
        get<_i4.IpFinderRemoteDataSource>(),
        get<_i6.NetworkInfo>(),
      ));
  gh.lazySingleton<_i9.GetMyIp>(
      () => _i9.GetMyIp(get<_i7.IpFinderRepository>()));
  gh.lazySingleton<_i10.GetMyIpInfo>(
      () => _i10.GetMyIpInfo(get<_i7.IpFinderRepository>()));
  gh.lazySingleton<_i11.IpFinderBloc>(() => _i11.IpFinderBloc(
        get<_i10.GetMyIpInfo>(),
        get<_i9.GetMyIp>(),
      ));
  return get;
}

class _$RegisterModuleConnectionChecker
    extends _i12.RegisterModuleConnectionChecker {}
