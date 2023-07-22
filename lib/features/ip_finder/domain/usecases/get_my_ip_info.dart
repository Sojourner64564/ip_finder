import 'package:dartz/dartz.dart';

import 'package:ip_finder/core/error/failures.dart';

import '../../../../core/usecases/use_case_my_ip.dart';
import '../enteties/ip_Info.dart';
import '../repositories/ip_finder_repository.dart';

class GetMyIpInfo implements UseCaseMyIp<IpInfo>{
  GetMyIpInfo(this.ipFinderRepository);

  final IpFinderRepository ipFinderRepository;

  @override
  Future<Either<Failure, IpInfo>> call() async {
    return await ipFinderRepository.getMyIpInfo();
  }

}