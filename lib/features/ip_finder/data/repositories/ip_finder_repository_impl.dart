//TODO: сделать имплементацию
import 'package:dartz/dartz.dart';
import 'package:ip_finder/core/error/failures.dart';
import 'package:ip_finder/features/ip_finder/domain/enteties/ip.dart';
import 'package:ip_finder/features/ip_finder/domain/enteties/ip_Info.dart';
import '../../domain/repositories/ip_finder_repository.dart';

class IpFinderRepositoryImpl implements IpFinderRepository{
  @override
  Future<Either<Failure, Ip>> getMyIp() async{
    // TODO: implement getMyIp
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, IpInfo>> getMyIpInfo() async{
    // TODO: implement getMyIpInfo
    throw UnimplementedError();
  }

}