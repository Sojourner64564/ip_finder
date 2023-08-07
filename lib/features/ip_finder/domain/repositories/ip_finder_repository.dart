import 'package:ip_finder/core/error/failures.dart';
import 'package:ip_finder/features/ip_finder/domain/enteties/ip_Info.dart';
import 'package:dartz/dartz.dart';

import '../enteties/ip.dart';


abstract class IpFinderRepository{
  Future<Either<Failure, IpEntety>> getMyIp();
  Future<Either<Failure, IpInfoEntety>> getMyIpInfo(String ipString);
}


