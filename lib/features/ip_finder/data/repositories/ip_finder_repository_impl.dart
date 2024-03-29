import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ip_finder/core/data_sources/ip_finder_remote_data_source/ip_finder_remote_data_source.dart';
import 'package:ip_finder/core/error/failures.dart';
import 'package:ip_finder/features/ip_finder/data/data_sources/ip_finder_remote_data_sources.dart';
import 'package:ip_finder/features/ip_finder/domain/enteties/ip.dart';
import 'package:ip_finder/features/ip_finder/domain/enteties/ip_Info.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/ip_finder_repository.dart';

@LazySingleton(as: IpFinderRepository)
class IpFinderRepositoryImpl implements IpFinderRepository{
  IpFinderRepositoryImpl(
     this.ipFinderRemoteDataSource, //req
     this.networkInfo  //req
  );

  final IpFinderRemoteDataSource ipFinderRemoteDataSource;
  final NetworkInfo networkInfo;


@override
  Future<Either<Failure, IpEntety>> getMyIp() async{
    if(await networkInfo.isConnected){
      final remoteIp = await ipFinderRemoteDataSource.getIp();
      return Right(remoteIp);
    }else{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, IpInfoEntety>> getMyIpInfo(String ipString) async{
    if(await networkInfo.isConnected){
      final remoteIpInfo = await ipFinderRemoteDataSource.getIpInfo(ipString);
      return Right(remoteIpInfo);
    }else{
      return Left(ServerFailure());
    }
  }


}


